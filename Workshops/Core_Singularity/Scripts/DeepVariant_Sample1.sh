#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=2:mem=16gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################

cd $PBS_O_WORKDIR

##########
# Set up #
##########

# Change to your workshop directory
WorkingDir=/scratch/Public/TRAINING/GenomeAnalysisModule/StudentSpaces/Sherlock/
cd $WORKING_DIR 

# Load singularity
module load singularity
BIN_VERSION="1.0.0"

# Pull latest version, if you already have it, this will be skipped
singularity pull docker://google/deepvariant:"${BIN_VERSION}"

# Here, I'm setting up the sample I'm going to run it on
SAMPLE_ID=Sample1
SAMPLE_BAM=$SAMPLE_ID.sorted.bam

# Then, I set up the reference genome location
FASTA_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/GENOME/
FASTA_FILE=GRCh38-lite.fa

# Last, we'll make a special output directory called ${SAMPLE_ID}_Deepvariant
OUTPUT_DIR=$WORKING_DIR/${SAMPLE_ID}_DeepVariant
mkdir -p $OUTPUT_DIR

# This is a complicated command, which will work if you set the above correctly.
singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
	-B "${WORKING_DIR}":"/bamdir" \
	-B "${FASTA_DIR}":"/genomedir" \
	-B "${WORKING_DIR}":"/output" \
	docker://google/deepvariant:"${BIN_VERSION}" \
  /opt/deepvariant/bin/run_deepvariant \
  --model_type=WGS \
  --ref="/genomedir/$FASTA_FILE" \
  --reads="/bamdir/$SAMPLE_BAM" \
  --output_vcf="/output/${SAMPLE_ID}_DeepVariant.vcf.gz" \
  --num_shards=$SLURM_CPUS_PER_TASK 


