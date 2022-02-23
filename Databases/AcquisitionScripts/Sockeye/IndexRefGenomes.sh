#!/bin/bash

#PBS -l walltime=05:00:00,select=1:ncpus=1:mem=8gb
#PBS -N index_ref_genome
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca

################################################################################

ANNOTATEVARIANTS_INSTALL_DIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/UserDirs/prichmond/AnnotateVariants/
source ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/miniconda3/etc/profile.d/conda.sh
conda activate ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/AnnotateVariantsEnvironment

# Go to directory
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/

## GRCh38
cd $DBDIR/GRCh38/Genome/

## GRCh38.p14
FASTA=GCA_000001405.29_GRCh38.p14_genomic.fna
REFDIR=$DBDIR/GRCh38/Genome/GRCh38.14/
TMPDIR=/scratch/st-sturvey-1/Sandbox/Sherlock/
cp $REFDIR/$FASTA $TMPDIR
cd $TMPDIR

samtools faidx $TMPDIR/$FASTA 

bwa index $TMPDIR/$FASTA 

