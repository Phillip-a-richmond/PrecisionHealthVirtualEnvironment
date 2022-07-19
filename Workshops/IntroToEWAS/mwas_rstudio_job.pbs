#!/bin/bash
 
#PBS -l walltime=01:00:00,select=1:ncpus=4:mem=16gb
#PBS -N my_rstudio_server
#PBS -A st-dennisjk-1
#PBS -m abe
 
################################################################################
# EDIT THE VARIABLES BELOW
################################################################################
JOB_HOME=/scratch/st-dennisjk-1/wcasazza/
RSTUDIO_SIF=/scratch/st-dennisjk-1/wcasazza/IntroToMWAS.sif
################################################################################
# DO NOT CHANGE BELOW
################################################################################
# Change directory into the job dir
cd $PBS_O_WORKDIR
 
# Load software environment
module load gcc
module load singularity
 
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
 
# Optional: You can modify this container by installing custom R pakcages/libraries in your local PC with root access. In this case, you have to set LD_LIBRARY_PATH to make Rstudio use the system dependencies built in the container, which are located in "/usr/lib/x86_64-linux-gnu".
export SINGULARITYENV_LD_LIBRARY_PATH =/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
export RSTUDIO_WHICH_R=/usr/local/bin/R
 
# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run/rstudio-server --bind $TMPDIR:/tmp --bind $TMPDIR:/var/lib/rstudio-server --home $JOB_HOME $RSTUDIO_SIF rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT} --server-user ${USER}
