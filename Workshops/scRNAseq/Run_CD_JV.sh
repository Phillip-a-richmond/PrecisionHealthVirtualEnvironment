#!/usr/bin/env bash
#SBATCH --partition=defq

#SBATCH --mail-user=jfvelghe@student.ubc.ca
#SBATCH --mail-type=ALL

## CPU Usage
#SBATCH --mem=64G
#SBATCH --cpus-per-task=8
#SBATCH --time=24:00:00
#SBATCH --nodes=1

## Output and Stderr
#SBATCH --output=%x-%j.out
#SBATCH --error=%x-%j.error

################################################################################

# Change directory into the job dir
cd /mnt/scratch/Precision/CD/
 
# Load software environment
module load slurm
module load singularity

#####################
############### 
# Modify this #
###############

# This needs to match the Rstudio that you pulled
Singularity_Image=$PWD/rstudio-bioconductor-Release_3_15.simg

# Configure your data directory
Home_Dir=/mnt/scratch/Precision/CD/

# Configure your R Library Location
Lib_Dir=/mnt/scratch/Precision/CD/R/x86_64-pc-linux-gnu-library/4.0/
#mkdir -p $Lib_Dir

###### Do Not Change This ########
###########################################################

export PASSWORD=$(openssl rand -base64 8)
# get unused socket per https://unix.stackexchange.com/a/132524
# tiny race condition between the python & singularity commands
readonly PORT=$(python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()')
cat > connection_${SLURM_JOB_ID}.txt <<END
1. SSH tunnel from your workstation using the following command:

   ssh -N -L 8787:${HOSTNAME}:${PORT} ${USER}@${SLURMD_NODENAME}

   and point your web browser to http://localhost:8787

2. log in to RStudio Server using the following credentials:

   user: ${USER}
   password: ${PASSWORD}

When done using RStudio Server, terminate the job by:

1. Exit the RStudio Session ("power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:

      scancel -f ${SLURM_JOB_ID}
END

export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

##NOTE##
# This is a local drive location I can write, you should be able
# to just set to a subfolder of your HPC home/scratch directory
export TMPDIR="${PWD}/rstudio-tmp"

mkdir -p "$TMPDIR/tmp/rstudio-server"
uuidgen > "$TMPDIR/tmp/rstudio-server/secure-cookie-key"
chmod 0600 "$TMPDIR/tmp/rstudio-server/secure-cookie-key"

mkdir -p "$TMPDIR/var/lib"
mkdir -p "$TMPDIR/var/run"

###########################################################

# Also bind data directory on the host into the Singularity container.
# By default the only host file systems mounted within the container are $HOME, /tmp, /proc, /sys, and /dev.
##NOTE##
# You may need here just to replace the fourth bind option, or drop
singularity exec \
  --vm-err \
  --bind="$TMPDIR/var/lib:/var/lib/rstudio-server" \
  --bind="$TMPDIR/var/run:/var/run/rstudio-server" \
  --bind="$TMPDIR/tmp:/tmp" \
  --bind=$Home_Dir \
  --bind=$Lib_Dir \
  --home=$PWD \
  $Singularity_Image \
  rserver --server-user ${USER} --www-port ${PORT} --auth-none=0 --auth-pam-helper-path=pam-helper --auth-timeout-minutes=0 --auth-stay-signed-in-days=30
printf 'rserver exited' 1>&2

