DOCKERHUB_USERNAME=singha53
IMAGE_VERSION=v0.1

module load gcc singularity

singularity pull --name rpystudio.sif docker://$DOCKERHUB_USERNAME/rpystudio:$IMAGE_VERSION