DOCKERHUB_USERNAME=singha53
IMAGE_VERSION=v0.1

module load gcc singularity

# Change to your directory where you'll keep the SIF 
Home_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/supervised_data_integration/

mkdir -p $Home_Dir
cd $Home_Dir

# Make an R_Lib directory there that matches the R version. To find the R version read up on the docker tag (link below)
mkdir -p $Home_Dir/R_Libs_4.1.0/

# Set your singularity cache
export SINGULARITY_CACHEDIR=$PWD

singularity pull --name rpystudio.sif docker://$DOCKERHUB_USERNAME/rpystudio:$IMAGE_VERSION
