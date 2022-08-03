#  load modules
module load Software_Collection/2019
module load gcc/5.4.0
module load singularity/3.2.1

# Change to your directory where you'll keep the SIF 
Home_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/scRNAseq/
#Home_Dir=/scratch/tr-precisionhealth-1/Workshops/scRNAseq/Student_Stuff/scRNAseq/

mkdir -p $Home_Dir
cd $Home_Dir

# Make an R_Lib directory there that matches the R version. To find the R version read up on the docker tag (link below)
# mkdir -p $Home_Dir/R_Libs_4.2.0/ #### not used for scRNAseq workshop

# Set your singularity cache
export SINGULARITY_CACHEDIR=$PWD

# Use singularity to pull your version of Rstudio docker
# I prefer to use a stable version other than latest
# Versions available here: https://hub.docker.com/r/bioconductor/bioconductor_docker/tags 
singularity pull --name rstudio-bioconductor-Release_3_15.sif docker://bioconductor/bioconductor_docker:RELEASE_3_15

