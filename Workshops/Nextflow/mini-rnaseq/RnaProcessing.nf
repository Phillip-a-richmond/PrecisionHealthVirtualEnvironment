
nextflow.enable.dsl = 2

// --------
// CHANNELS
// --------

// read in metadata .tsv to get sample IDs from first column
sample_ids =
    Channel
        .fromPath(params.sample_ids)
        .splitCsv(header: false, sep: '\t')
        .map { row -> row[0] }

// list fastqs in directory and pair up by ID in filename
fastqs =
    Channel
        .fromPath(params.fastq_dir + '/*.fastq.gz')
        .map {fastq ->
            def sample_id = fastq.name.toString().tokenize('_').get(0)
            return tuple(sample_id, fastq)
        }
        .groupTuple()

// filter fastq pairs by sample IDs within the metadata
selected_fastqs =
    sample_ids
        .join(fastqs)
        .map {fastqs ->
            [fastqs[0], fastqs[1][0], fastqs[1][1]]
        }

// ---------
// PROCESSES
// ---------

/*
 * Run HISAT2 alignment on paired end reads. Uses samtools to convert SAM to BAM
 *      and sort alignments.
 *
 * INPUT:
 *      Tuple w/ sample ID, R1 reads, R2 reads,
 *      Path to HISAT2 parsed splicesites,
 *      Root filenames of HISAT2 index files,
 *      Path to directory containing HISAT2 index files.
 *
 * OUTPUT:
 *      Tuple w/ sample ID and sorted BAM file.
 */
process alignFastq {
    label "cores_8"

    input:
        tuple val(sample_id), path(r1_fastq), path(r2_fastq)
        path(splicesites_tsv)
        val(index_rootname)
        path(index_dir)

    output:
        tuple val(sample_id),
            path("${sample_id}_sorted.bam"),
            emit: aln_bams

    script:
        """
        hisat2 \
            -p $task.cpus \
            --known-splicesite-infile $splicesites_tsv \
            -x $index_rootname \
            -S ${sample_id}_unsorted.sam \
            --read-lengths 75 \
            -1 $r1_fastq \
            -2 $r2_fastq

        samtools view \
            -@ $task.cpus \
            -u ${sample_id}_unsorted.sam |\
        samtools sort \
            -@ $task.cpus \
            -o ${sample_id}_sorted.bam \
            -
        """
}

/*
 * Use Picard to mark duplicate reads.
 *
 * INPUT:
 *      Tuple w/ sample ID and sorted BAM file.
 *
 * OUTPUT:
 *      Tuple w/ sample ID, duplicate marked BAM, and BAM index file.
 */
process flagDuplicates {
    publishDir "$params.pub_dir", mode: 'copy'
    label "cores_1"

    input:
        tuple val(sample_id), path(bam)

    output:
        tuple val(sample_id),
            path("${sample_id}_dup_marked.bam"),
            path("${sample_id}_dup_marked.bai"),
            emit: flg_bams

    script:
        """
        picard MarkDuplicates \
            CREATE_INDEX=true \
            I=$bam \
            O=${sample_id}_dup_marked.bam \
            M=output_dup_metrics.txt
        """
}

/*
 * Summarise read coverage with deepTools bamCoverage.
 *
 * INPUT:
 *      Tuple w/ sample ID, duplicate marked BAM, and BAM index file.
 *
 * OUTPUT:
 *      Bigwig file summarising aligned read coverage.
 */
process calcCoverage {
    publishDir "$params.pub_dir", mode: 'copy'
    label "cores_8"

    input:
        tuple val(sample_id), path(bam), path(bai)

    output:
        path("${sample_id}_coverage.bw")

    script:
        """
        bamCoverage \
            -p $task.cpus \
            -b $bam \
            -o ${sample_id}_coverage.bw
        """
}

/*
 * Quantify gene level expression using featureCounts.
 *
 * INPUT:
 *      Tuple w/ sample ID, duplicate marked BAM, and BAM index file,
 *      Path to GTF annotation file.
 *
 * OUTPUT:
 *      Text file containing gene level read quantification.
 */
process calcGeneCounts {
    publishDir "$params.pub_dir", mode: 'copy'
    label "cores_8"

    input:
        tuple val(sample_id), path(bam), path(bai)
        path(gtf)

    output:
       path("${sample_id}_gene.counts")

    script:
        """
        featureCounts \
            --ignoreDup \
            -T $task.cpus \
            -a $gtf \
            -o ${sample_id}_gene.counts \
            $bam
        """
}

/*
 * Quantify exon level expression using featureCounts.
 *
 * INPUT:
 *      Tuple w/ sample ID, duplicate marked BAM, and BAM index file,
 *      Path to GTF annotation file.
 *
 * OUTPUT:
 *      Text file containing exon level read quantification.
 */
process calcExonCounts {
    publishDir "$params.pub_dir", mode: 'copy'
    label "cores_8"

    input:
        tuple val(sample_id), path(bam), path(bai)
        path(gtf)

    output:
       path("${sample_id}_exon.counts")

    script:
        """
        featureCounts \
            --ignoreDup \
            -T $task.cpus \
            -f \
            -a $gtf \
            -o ${sample_id}_exon.counts \
            $bam
        """
}

// -------------
// MAIN WORKFLOW
// -------------

workflow {

    alignFastq(
        selected_fastqs,
        file(params.hisat2_splicesites),
        params.hisat2_index,
        file(params.hisat2_index + '*')
    )

    flagDuplicates(alignFastq.out.aln_bams)

    calcCoverage(flagDuplicates.out.flg_bams)

    calcGeneCounts(
        flagDuplicates.out.flg_bams,
        file(params.featureCounts_gtf)
    )

    calcExonCounts(
        flagDuplicates.out.flg_bams,
        file(params.featureCounts_gtf)
    )

}

