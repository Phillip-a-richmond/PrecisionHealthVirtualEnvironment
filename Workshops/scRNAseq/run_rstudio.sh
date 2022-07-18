#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=1:mem=64gb
#PBS -N my_rstudio_server
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################
 
# Change directory into the job dir
cd $PBS_O_WORKDIR
 
# Load software environment
module load singularity

#####################
############### 
# Modify this #
###############

Rstudio_SIF=/scratch/st-sturvey-1/Workshops/scRNAseq/rstudio-bioconductor-Release_3_15.sif
Home_Dir=/scratch/st-sturvey-1/Workshops/scRNAseq/
Data_Dir=/scratch/st-sturvey-1/Workshops/
Lib_Dir=/scratch/st-sturvey-1/Sandbox/BioconductorExample/R_Libs_4.2.0/

######################

##############################
# Don't change anything else #
##############################

# Set RANDFILE location to writeable dir
export RANDFILE=$TMPDIR/.rnd
 
# Generate a unique password for RStudio Server
export SINGULARITYENV_PASSWORD=$(openssl rand -base64 15)
 
# Find a unique port for RStudio Server to listen on
readonly PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')
 
# Set per-job location for the rserver secure cookie
export SECURE_COOKIE=$TMPDIR/secure-cookie-key
 
# Print connection details to file
cat > connection_${PBS_JOBID}.txt <<END
 
1. Create an SSH tunnel to RStudio Server from your local workstation using the following command:
 
ssh -N -L 8787:${HOSTNAME}:${PORT} ${USER}@sockeye.arc.ubc.ca
 
2. Point your web browser to http://localhost:8787
 
3. Login to RStudio Server using the following credentials:
 
Username: ${USER}
Password: ${SINGULARITYENV_PASSWORD}
 
When done using RStudio Server, terminate the job by:
 
1. Sign out of RStudio (Left of the "power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:
 
qdel ${PBS_JOBID}
 
END


# This is where we pass the path to our library, and the libraries installed "in the container" (#zoolander)
export SINGULARITYENV_LD_LIBRARY_PATH=$Lib_Dir:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
 
# Execute the rserver within the rocker/rstudio container
# We bind path to our data, our home, and our lib, and then call the Rstudio.sif file, and execute the rserver command
singularity exec \
 --bind $TMPDIR:/var/lib/rstudio-server \
 --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 $Rstudio_SIF \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT} --server-user ${USER}
