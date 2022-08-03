#!/bin/bash
#
#!!! This is not officially supported by 10x
# Written by Jane Velghe on 28-Jul-2022
#
# =============================================================================
# Job Script
# =============================================================================
#
#PBS -l walltime=2:00:00,select=1:ncpus=16:mem=128gb
#PBS -A st-sturvey-1
#PBS -o {STDOUT_LOG}
#PBS -e {STDERR_LOG}
#
# *UPDATE* to your project name shown in the qstat -a list
#PBS -N tiny_mkfastqs
#
# *UPDATE* to your email address
#PBS -M jfvelghe@student.ubc.ca

################################################################################

################
# Modify these #
################

# *UPDATE* to where you want to make the file for the job outputs
JOB_WORKDIR=/scratch/st-sturvey-1/Workshops/StudentSpaces/$USER/scRNAseq/Data/Tiny_Data/

# *UPDATE* to the folder containing your sequencing outputs
SEQREADS_DIR=$JOB_WORKDIR/cellranger-tiny-bcl-1.2.0

# *UPDATE* to your sample sheet csv
SAMPLE_SHEET=$JOB_WORKDIR/cellranger-tiny-bcl-simple-1.2.0.csv

# this will be the name of the folder that fastq files will end up in the $JOB_WORKDIR
mkfastq_id=tiny_fastqs

###############################################
# Reference data - uncomment the one you use #
##############################################

# References to align reads to, comment in/out depending on reference type needed (human first, mouse is second)
REFDATA=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/CellRanger/refdata-gex-GRCh38-2020-A
#REFDATA=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Databases/References/mm10/Genome/CellRanger/refdata-gex-mm10-2020-A

################################
# Don't change this file path #
################################

# The folder containing the CellRanger Software (shouldn't chance for Sockeye)
CellRanger_DIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/CellRanger/cellranger-7.0.0

#########################################
# Don't change anything in this section #
#########################################

# load required software
module load CVMFS_CC
module load bcl2fastq2

# Add CellRanger to your path
export PATH=$CellRanger_DIR:$PATH
#export PATH=/arc/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/CellRanger/cellranger-7.0.0:$PATH

cd $JOB_WORKDIR

###########################################
# CellRanger mkfastq on Tiny Data - Example
###########################################

#run cellranger mkfastq example using the "tiny"" data
cellranger mkfastq --id=$mkfastq_id --localcores=12 --localmem=120 \
   --run=$SEQREADS_DIR \
   --csv=$SAMPLE_SHEET 

###########################################
