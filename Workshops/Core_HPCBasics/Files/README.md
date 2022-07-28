# Files

The sample data here is created by Phillip Richmond, and is derived from WGS data in the Thousand Genomes Project. 

Briefly
1. Polaris fastq files (https://github.com/Illumina/Polaris) mapped to GRCh38 (1kG version) with bwa mem
2. BAM files were bam-surgeoned with a pathogenic SNV
3. Altered bam files were region-cut with samtools view -L,
4. Namesorted with samtools sort -n
5. Extracted to fastq with samtools fastq

If interested, operations 1-5 looks like this:
```
BAM=$BAM_DIR/$SAMPLE.sorted.bam

ls $BAM

#### GRCh38 #### 
echo "GRCh38 genome"
GENOME=GRCh38
FASTA_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/GENOME/
FASTA_FILE=GRCh38-lite.fa

SEQ_TYPE=WGS
BAM_DIR=$WORKING_DIR
TMP_DIR=$WORKING_DIR/tmp
mkdir -p $TMP_DIR

# Modified bam files
INBAM=${SAMPLE}_chrX_Region.bam
INBAM_SORTED=${SAMPLE}_chrX_Region.namesorted.bam

# Final fastq files
OUTFASTQ1=${SAMPLE}_chrX_Region_R1.fastq
OUTFASTQ2=${SAMPLE}_chrX_Region_R2.fastq

# target bed file
TARGET=$WORKING_DIR/gene_region.bed
# Index CRAM
samtools view \
	--write-index \
	$BAM \
	-@ $NSLOTS \
	-T $FASTA_DIR/$FASTA_FILE \
	-L $TARGET \
	-o ${SAMPLE}_chrX_Region.bam

samtools sort -n $INBAM -@ $NSLOTS -o $INBAM_SORTED

# Convert to fastq
samtools fastq \
	-@ $NSLOTS \
	-1 $OUTFASTQ1 -2 $OUTFASTQ2 \
	-0 /dev/null \
	-s /dev/null \
	-n $INBAM_SORTED

gzip $OUTFASTQ1
gzip $OUTFASTQ2
```

