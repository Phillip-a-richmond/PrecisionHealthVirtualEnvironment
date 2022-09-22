#!/bin/bash
#
#!!! This is not officially supported by 10x
# Written by Jane Velghe on 28-Jul-2022
#
# THIS WILL NOT FULLY WORK, THE TINY DATA IS NOT MEANT TO BE USED FOR THE
# COUNT FUNCTION. I WROTE THIS SCRIPT HERE SO YOU CAN REFER TO ANOTHER EXAMPLE 
# OF HOW TO LIST OUT THE FILES PATHS PROPERLY WEHN YOU GO FROM CELLRANGER 
# MKFASTQ RESULTS AND INTO CENNRANGER COUNT
# =============================================================================
# Job Script
# =============================================================================
#
#PBS -l walltime=12:00:00,select=1:ncpus=16:mem=128gb
#PBS -A st-sturvey-1
#PBS -o {STDOUT_LOG}
#PBS -e {STDERR_LOG}
#
# *UPDATE* to your project name shown in the qstat -a list
#PBS -N count_PBMCs
#
# *UPDATE* to your email address
#PBS -M jfvelghe@student.ubc.ca

#####################################
# Modify these file paths as needed #
#####################################
# *UPDATE* to where you want to make the file for the job outputs
JOB_WORKDIR=/scratch/st-sturvey-1/Workshops/StudentSpaces/$USER/scRNAseq/Data/Tiny_Data/

# *UPDATE* to the folder containing your sequencing outputs
#   -  use in mkfastq
SEQREADS_DIR=$JOB_WORKDIR/cellranger-tiny-bcl-1.2.0

# *UPDATE* to your sample sheet csv
#   -  use in mkfastq
SAMPLE_SHEET=$JOB_WORKDIR/cellranger-tiny-bcl-simple-1.2.0.csv

# *SAME* this was be the name of the folder where fastqs are put - 
#   -  use in mkfastq
mkfastq_id=tiny_fastqs

# this should be the sample name from the sample sheet which was appended to the front of the FASTQ file names
#   -  use in count
sample_id=test_sample

#what do you want to call this folder with the count outputs?
#   -  use in count
name=teeny_outs

# ***Shouldn't change*** if going from mkfastq to this.. otherwise it is the name of your folder containing your FASTQ files/folder. Should contain  a folder ending in _fastqs, or is called "fastq_path". A folder  within this on should containing only files that end in .fastq.gz
#   -  use in count
fastq_DIR=$JOB_WORKDIR/$mkfastq_id/outs/fastq_path

#######################################
# Reference File Paths - Dont change #
######################################
# References to align reads to, comment in/out depending on reference type needed (human first, mouse is second)
REFDATA=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/CellRanger/refdata-gex-GRCh38-2020-A
#REFDATA=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Databases/References/mm10/Genome/CellRanger/refdata-gex-mm10-2020-A

################################
# Don't change this file path #
###############################
# The folder containing the CellRanger Software (shouldn't change for Sockeye)
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

###########################################
# CellRanger mkfastq on Tiny Data - Example
###########################################

# Change into $JOB_WORKDIR
cd $JOB_WORKDIR

#run cellranger mkfastq example using the "tiny"" data
cellranger mkfastq --id=$mkfastq_id --localcores=12 --localmem=120 \
--run=$SEQREADS_DIR \
--csv=$SAMPLE_SHEET 
#id= the name of the folder that fastq files will end up in the $JOB_WORKDIR


########################################
# Run CellRanger mkfastq #
########################################

#change into outs folder
cd $JOB_WORKDIR/

#update --id and --sample to your sample name. 
#ID will be the name of the folder it shows up in

 cellranger count --id=$name \
--transcriptome=$REFDATA \
--fastqs=$fastq_DIR \
--sample=$sample_id \
--expect-cells=500 \
--localcores=12 \
--localmem=120

