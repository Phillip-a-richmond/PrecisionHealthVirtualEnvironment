#!/bin/bash
#
#!!! This is not officially supported by 10x
# Written by Jane Velghe on 28-Jul-2022
#
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

################
# Modify these #
################

# *UPDATE* to where you have the sequencing files want to make the file for the job outputs
JOB_WORKDIR=/scratch/st-sturvey-1/Workshops/StudentSpaces/$USER/scRNAseq/Data/PBMCs_C/

#--------------------------
# New for count function #
#--------------------------
# *UPDATE* to the name of your folder containing your FASTQ files/folder. 
#    Should contain  a folder ending in _fastqs, or is called "fastq_path". 
#    A folder within this one should containing only files that end in .fastq.gz
fastq_DIR=$JOB_WORKDIR/Input_Files/

# This is the sample name from the sample sheet which was appended to the front 
#    of the FASTQ file names
sample_id=500_PBMC_3p_LT_Chromium_Controller

# you can rename what you will call the folder with results from cellranger 
#    count with:
name=PMBCs_C_outs

#######################################
# Reference File Paths - Dont change #
######################################
# References to align reads to, comment in/out depending on reference type needed (human first, mouse is second)
REFDATA=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/CellRanger/refdata-gex-GRCh38-2020-A
#REFDATA=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Databases/References/mm10/Genome/CellRanger/refdata-gex-mm10-2020-A

################################
# Don't change this file path #
###############################
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

########################################
# Run CellRanger mkfastq #
########################################

#change into the folder where ou wand to results to appear
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

