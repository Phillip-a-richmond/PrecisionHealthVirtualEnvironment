#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=2:mem=16gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################

cd $PBS_O_WORKDIR

# Load Conda
source /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh
conda  activate  GenomeAnalysis

# Variables are first defined (no spaces allowed!)
WorkingDir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/
Sample=Proband
GenomeIndex=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/GRCh38_full_analysis_set_plus_decoy_hla.fa
FastqDir=$WorkingDir/Files/
FastqR1=${FastqDir}/${Sample}_R1.fastq
FastqR2=${FastqDir}/${Sample}_R2.fastq

# BWA mem
# bwa mem <genomeIndex> <fastqR1> <fastqR2> [options] > <output.sam>
bwa mem $GenomeIndex \
	$FastqR1 \
	$FastqR2 \
	-R "@RG\tID:$Sample\tSM:$Sample\tPL:illumina" \
	> ${Sample}.sam

# Samtools
## Samtools view
## samtools view -b <in.sam> <out.bam>
samtools view \
	-b ${Sample}.sam  \
	-o ${Sample}.bam

## Samtools sort
## samtools sort <in.bam> -o <out.sorted.bam>
samtools sort \
	${Sample}.bam \
	-o ${Sample}.sorted.bam

## Samtools index
## samtools index <in.sorted.bam>
samtools index \
	${Sample}.sorted.bam

## Samtools flagstat
## samtools flagstat <in.sorted.bam>
samtools flagstat \
	${Sample}.sorted.bam 
