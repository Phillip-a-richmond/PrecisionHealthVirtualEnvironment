#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=4:mem=24gb
#PBS -N RunRscript
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################
 
# Change directory into the job dir
cd $PBS_O_WORKDIR
 
# Load software environment
module load Software_Collection/2019
module load gcc/5.4.0
module load singularity

############### 
# Modify this #
###############

Rstudio_SIF=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Rstudio/rstudio-bioconductor-Release_3_15.sif
Home_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Rstudio/
Lib_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Rstudio/R_Libs_4.2.0/

R_Script=$Home_Dir/SmallRScript.R

# This is where we pass the path to our library, and the libraries installed "in the container" (#zoolander)
export SINGULARITYENV_LD_LIBRARY_PATH=$Lib_Dir:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
 
# Execute the rserver within the rocker/rstudio container
# We bind path to our data, our home, and our lib, and then call the Rstudio.sif file, and execute the rserver command
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
 Rscript $R_Script 
