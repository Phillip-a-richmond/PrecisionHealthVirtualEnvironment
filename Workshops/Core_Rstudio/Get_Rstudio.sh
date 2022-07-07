#  load modules
module load gcc
module load singularity


# Change to your directory where you'll keep the SIF 
mkdir -p /scratch/tr-precisionhealth-1/Workshops/Rstudio_Core/
cd /scratch/tr-precisionhealth-1/Workshops/Rstudio_Core/

# Make an R_Lib directory there that matches the R version. To find the R version read up on the docker tag (link below)
mkdir -p /scratch/tr-precisionhealth-1/Workshops/Rstudio_Core/R_Libs_4.2.0/

# Set your singularity cache
#export SINGULARITY_CACHEDIR=$PWD

# Use singularity to pull your version of Rstudio docker
# I prefer to use a stable version other than latest
# Versions available here: https://hub.docker.com/r/bioconductor/bioconductor_docker/tags 

# This version doesn't hold the job
singularity pull --name rstudio-bioconductor-Release_3_15.sif docker://bioconductor/bioconductor_docker:RELEASE_3_15

# This version won't get past the spinning wheel, even with 64G RAM
#singularity pull shub://Bioconductor/bioconductor_full:latest

# Back to basic rocker, also doesn't hold the job
#singularity pull --name rocker-rstudio-4.2.sif docker://rocker/rstudio:4.2


#singularity pull --name rocker-rstudio-latest.sif docker://rocker/rstudio:latest
