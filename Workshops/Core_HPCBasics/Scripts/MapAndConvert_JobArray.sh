#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=2:mem=16gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
#PBS -J 0-2 
################################################################################

cd $PBS_O_WORKDIR

# Load Conda
source /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh
conda  activate  GenomeAnalysis

# Variables are first defined (no spaces allowed!)
WorkingDir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/
GenomeIndex=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/GRCh38_full_analysis_set_plus_decoy_hla.fa
FastqDir=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Workshops/Core_HPCBasics/Files/

# Get the files we're going to use
Files=(${FastqDir}*_R1.fastq.gz)
IFS='/' read -a array <<< ${Files[$PBS_ARRAY_INDEX]}
SampleR1Fastq=${array[-1]}
IFS='_' read -a array2 <<< "${SampleR1Fastq}"
SampleID=${array2[0]}

echo $SampleID
echo "${SampleID}_R1.fastq.gz"
echo "${SampleID}_R2.fastq.gz"

FastqR1=$FastqDir${SampleID}_R1.fastq.gz
FastqR2=$FastqDir${SampleID}_R2.fastq.gz

ls $FastqR1
ls $FastqR2

#### Copy to $TMPDIR #####
# Here I set the final directory to match what we set above
FinalDir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/
# Here I re-set the working directory to be the $TMPDIR, a global variable recognized by the job script

echo "Copying data to $TMPDIR"

cp $FastqR1 $TMPDIR
cp $FastqR2 $TMPDIR

cd $TMPDIR
ls -l ./

# BWA mem
# bwa mem <genomeIndex> <fastqR1> <fastqR2> [options] > <output.sam>
bwa mem $GenomeIndex \
	-t $NCPUS \
	$FastqR1 \
	$FastqR2 \
	-R "@RG\tID:$SampleID\tSM:$SampleID\tPL:illumina" \
	> ${SampleID}.sam


# convert to binary and index
samtools view -@ $NCPUS -ubS $TMPDIR/${SampleID}.sam \
        | samtools sort - -@ $NCPUS  -T $TMPDIR/${SampleID}.sorted -O BAM -o $TMPDIR/${SampleID}.sorted.bam
samtools index $TMPDIR/${SampleID}.sorted.bam


### Copy data back to final dir #####
cp $TMPDIR/${SampleID}.sorted.bam $FinalDir
cp $TMPDIR/${SampleID}.sorted.bam.bai $FinalDir




