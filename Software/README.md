# Software
> This directory will store software packages used in the analysis of precision health data, and show researchers how to manage their own software stack.

## Overview
- [Software Mantra](#Software-Mantra)
- [Software Organization](#Software-Organization)
- [Miniconda](#Miniconda)
- [Rstudio](#Rstudio-on-Sockeye)

## Software Mantra
> Installing and configuring bioinformatic software and pipelines can be frustrating, and causes redundant efforts/use of time amongst researchers. In many cases it becomes such a time-consuming task that it even prevents users from analyzing their own data. *We want to change that.*

Within the **PrecisionHealthVirtualEnvironment**, we hope to solve some of these redundancies and challenges. We will take a 3 pronged approach:
1. Provide some walk-throughs on how to manage your own software on shared HPC with miniconda and singularity.
2. Maintain core software for general use within workshops and precision health data analysis pipelines.
3. Create a space for users to deploy their software and share with others. Sharing is caring. 

## Software Organization
The upper level of this software directory is only managed by Phillip Richmond. Users are welcome to create a directory with their username inside of UserDir/, and install tools there.

E.g. on Sockeye:
```
mkdir /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/UserDirs/prichmond/
``` 

If you're open to sharing your user dir with others, please discuss with Phillip Richmond (phillip.a.richmond@gmail.com).


## Miniconda
Miniconda is a great package manager with low overhead. Miniconda3 is installed here using the InstallMiniconda3.sh shell script.

To use this package manager you need to do the following: 
### Step 1 - Get Conda in your path
Source this file to get 'conda' into your PATH:
```
source /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh
```

### Step 2 - Create a new environment with a couple packages
Now you can create a new environment with a few packages on the command line:
```
conda create -y -n ShortReadTools -c bioconda -c conda-forge samtools bwa bcftools htslib
```
This creates a new environment called ShortReadTools, which will have the following tools in it:
- samtools 
- bwa 
- bcftools 
- htslib 


### Step 2 modified - Create a new environment from a config.yml
It's possible to create environments based on a config.yml file, which increases reproducibility and can enable the creation of some trickier conda environments.
For this, you'll need some kind of config.yml in this format (I call this one Bedtools.yml):
```
# platform: linux-64
name: Bedtools
channels:
 - bioconda
dependencies:
 - pybedtools
 - bedtools
```

Then you can create the environment:
```
conda env create --file Bedtools.yml --name Bedtools
```

### Step 3 - Activate the environment to use your tools
We will activate the environment with a simple command. 
```
conda activate ShortReadTools
```
NOTE: If you get an error saying: 
```
-bash: conda: command not found
```
Then simply re-source conda to get it into your path, and run again:
```
source /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh
conda activate ShortReadTools
``` 
When you activate the environment from the command line, you'll see a small change to your command prompt:
```
[richmonp@login03 Software]$ conda activate ShortReadTools
(ShortReadTools) [richmonp@login03 Software]$ bwa mem -h
```



*NOTE: To use this within a script submitted to the scheduler, simply include the source and activate lines at the top of your script!*

### Step 4 - Test to make sure your tools are working
If I activated ShortReadTools, then I can now use bwa mem
```
bwa mem --help
```


### Step 5 - Deactivate
You can deactivate this too when you're done using the tools, or if you need to use a different environment for a next step of the pipeline:
```
conda deactivate
conda activate Bedtools
```


## Rstudio on Sockeye

## Full Example with Bioconductor Image for Minfi and Seurat

This example is for a bioconductor image, which is useful for many genomics workflows, including DNA methylation analysis or single-cell RNAseq.

### Step 1: Pull your bioconductor image

The steps in this script are contained within the script:
```
Get_Rstudio.sh
```

1. Create yourself a working directory for Rstudio on the scratch space.
```
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/<username>/Rstudio/
```

My example is:
```
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
```

--------

2. Copy this script to that directory:
```
cp /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/Get_Rstudio.sh /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
```

---------

3. Find a bioconductor image from the available 'tags' here: [https://hub.docker.com/r/bioconductor/bioconductor_docker/tags](https://hub.docker.com/r/bioconductor/bioconductor_docker/tags). 

You can get more info from clicking on the individual release links. 

The release I'm using here is 3\_15, which uses R version 4.2.0. 

----------

4. Modify the Get\_Rstudio.sh script using a text editor, e.g. nano, vim, or emacs.
```
nano /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/Get_Rstudio.sh
```

The script looks like this:
```
#  load modules
module load gcc
module load singularity

# Change to your directory where you'll keep the SIF 
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/BioconductorExample/
cd /scratch/tr-precisionhealth-1/Sandbox/BioconductorExample/

# Make an R_Lib directory there that matches the R version. To find the R version read up on the docker tag (link below)
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/BioconductorExample/R_Libs_4.2.0/

# Set your singularity cache
export SINGULARITY_CACHEDIR=$PWD

# Use singularity to pull your version of Rstudio docker
# I prefer to use a stable version other than latest
# Versions available here: https://hub.docker.com/r/bioconductor/bioconductor_docker/tags 
singularity pull --name rstudio-bioconductor-Release_3_15.sif docker://bioconductor/bioconductor_docker:RELEASE_3_15
```

You'll need to make some changes, including changing the path to our Rstudio setup directory. 

For Sherlock, I'll change this file to have the following paths that I made above, but I'll keep release 3\_15 and R version 4.2.0.

Example script for Sherlock:
```
#  load modules
module load gcc
module load singularity

# Change to your directory where you'll keep the SIF
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
cd /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/

# Make an R_Lib directory there that matches the R version. To find the R version read up on the docker tag (link below)
mkdir -p /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/

# Set your singularity cache
export SINGULARITY_CACHEDIR=$PWD

# Use singularity to pull your version of Rstudio docker
# I prefer to use a stable version other than latest
# Versions available here: https://hub.docker.com/r/bioconductor/bioconductor_docker/tags
singularity pull --name rstudio-bioconductor-Release_3_15.sif docker://bioconductor/bioconductor_docker:RELEASE_3_15
```

----------

5. Run the script with bash. Note, this has to happen from within our Rstudio directory.
```
cd /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
sh Get_Rstudio.sh
```

----------

6. When it finishes, check that you have your image where it should be.
```
ls -lah /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/rstudio-bioconductor-Release_3_15.sif
```

If you don't have a SIF file, start Step 1 again.


### Step 2: Install libraries from R console
The steps in this script are contained within the script:
```
Install_R_Libs.sh
```

1. Copy this script into your Rstudio directory (here I'm continuing with the Sherlock example from Step 1).
```
cp /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/Install_R_Libs.sh /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
```

----------

2. This is the script:
```
# To install packages, we need to launch the container interactively

# First load singularity
module load singularity

# Point to your Libs, your SIF
Home_Dir=/scratch/st-sturvey-1/Sandbox/BioconductorExample/
Lib_Dir=/scratch/st-sturvey-1/Sandbox/BioconductorExample/R_Libs_4.2.0/
Rstudio_SIF=/scratch/st-sturvey-1/Sandbox/BioconductorExample/rstudio-bioconductor-Release_3_15.sif

# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
R

# Run that code from the command line, then once in R, you want to set your .libPaths() to match where your R library is.
# So it'll look like:
# .libPaths('/scratch/st-sturvey-1/Sandbox/BioconductorExample/R_Libs_4.2.0/')
```

We will modify it to match our setup for Sherlock (or your own setup from Step 1 above).
```
# To install packages, we need to launch the container interactively

# First load singularity
module load singularity

# Point to your Libs, your SIF
Home_Dir=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/
Lib_Dir=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/
Rstudio_SIF=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/rstudio-bioconductor-Release_3_15.sif

# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
R

# Run that code from the command line, then once in R, you want to set your .libPaths() to match where your R library is.
# So it'll look like:
# .libPaths('/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/')
```

--------

3. Run the script:
```
sh Install_R_Libs.sh
```

This will print to the screen something that looks like this:
```
INFO:    Convert SIF file to sandbox...

R version 4.2.0 (2022-04-22) -- "Vigorous Calisthenics"
Copyright (C) 2022 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

During startup - Warning messages:
1: Setting LC_CTYPE failed, using "C" 
2: Setting LC_COLLATE failed, using "C" 
3: Setting LC_TIME failed, using "C" 
4: Setting LC_MESSAGES failed, using "C" 
5: Setting LC_MONETARY failed, using "C" 
6: Setting LC_PAPER failed, using "C" 
7: Setting LC_MEASUREMENT failed, using "C" 
> 
```

--------

4. Now that we are in the interactive R environment, we will set our path to the place we are storing libraries with the .libPaths() command.
```
.libPaths('/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/')
```

---------

5. Last, we are now able to install packages, either through install.packages, or BiocManager::install.
```
library(BiocManager)
BiocManager::install("Seurat")
```

Once you are done installing packages, test that you can load them.


```
library(Seurat)
```

### Step 3A - Run an Rstudio session with this image and installed libraries

1. Copy a Run\_Rstudio.sh script into a working directory on the scratch mount.
```
cp /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/Run_Rstudio.sh /scratch/tr-precisionhealth-1/Sandbox/Sherlock/Rstudio/
```

That script looks like this:
```
#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=4:mem=32gb
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

Rstudio_SIF=/scratch/st-sturvey-1/Sandbox/BioconductorExample/rstudio-bioconductor-Release_3_15.sif
Home_Dir=/scratch/st-sturvey-1/Sandbox/BioconductorExample/ 
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
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Data_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT} --server-user ${USER}
```

--------

2. Make modifications to the top part of the script for your resources needed, singularity image path, the path to your data directories, etc.

Open your editor
```
nano Run_Rstudio.sh
```

Change this part for accurate resources, your own email, etc.
```
#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=4:mem=32gb
#PBS -N my_rstudio_server
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
```

Change these portions to refer to the correct image, and Rstudio deployment:
```
############### 
# Modify this #
###############

Rstudio_SIF=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/rstudio-bioconductor-Release_3_15.sif
Home_Dir=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/ 
Data_Dir=/scratch/st-sturvey-1/Workshops/
Lib_Dir=/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/
```

-------

3. Run the script with qsub

```
qsub Run_Rstudio.sh
```

--------

4. Check to see the job started running.

```
qstat -u $USER
```

5. Once it starts, you'll get a "connection" file. That file will look like this:

```
$ cat  connection_3800271.pbsha.ib.sockeye.txt
 
1. Create an SSH tunnel to RStudio Server from your local workstation using the following command:
 
ssh -N -L 8787:se011:58357 richmonp@sockeye.arc.ubc.ca
 
2. Point your web browser to http://localhost:8787
 
3. Login to RStudio Server using the following credentials:
 
Username: richmonp
Password: xV4WHGmyJavlbn1/CN8c
 
When done using RStudio Server, terminate the job by:
 
1. Sign out of RStudio (Left of the "power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:
 
qdel 3800271.pbsha.ib.sockeye
```

--------

6. Follow the instructions in the file, first by opening a NEW terminal (not connected to Sockeye), and running the SSH tunnel command. 

This will be unique for each session, and for each user.
```
ssh -N -L 8787:se011:58357 richmonp@sockeye.arc.ubc.ca
```

You'll be prompted with your password, enter it, run the 2-factor authentication, and then it should look like it "hangs".

--------

7. Open up a new web browser window, and type in that http address, then login to the Rstudio window with the username and password provided.

--------


8. Once in Rstudio, set the library path with the .libPaths() command, matching the library path we set.

```
.libPaths('/scratch/st-sturvey-1/Sandbox/Sherlock/Rstudio/R_Libs_4.2.0/')
```

--------

9. Load your libraries that you installed above. NOTE, you cannot install libraries within the Rstudio session, because there is no access to the internet from the compute nodes.

```
library(Seurat)
```

END.

### Step 3B - Run R with the pre-installed library and docker image for Rstudio.







Other examples for Rstudio. NOTE, use the above example first before trying these other methods.

### Basic Setup Overview
Using Rstudio on sockeye can be done using the guide here: 
https://confluence.it.ubc.ca/display/UARC/RStudio+with+Singularity

That guide will walk you through basic set up for Rstudio. 

This guide builds upon that, and covers how you:
1. Pull your Rstudio container with a specific R version.
2. Install packages for use within your Rstudio session.
3. Create and run an Rstudio job.
4. Open your Rstudio session in a web browser and use Rstudio, connecting to your installed packages.

Before we get deep into this walk-through, you need to set 2 directories:

1. A place to store your singularity Rstudio SIF file. Here I use:
```
mkdir -p /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/
```

2. A place to store your Run_Rstudio.sh script, your libraries, and input/output. Here I use:
```
mkdir -p /scratch/st-sturvey-1/Sandbox/Sherlock/
```


### Pulling Rstudio container with specific R version
You can choose a specific version of the Rstudio singularity image by choosing from the tags available here: 
[https://hub.docker.com/r/rocker/rstudio/tags?page=1&ordering=last_updated](https://hub.docker.com/r/rocker/rstudio/tags?page=1&ordering=last_updated)

For me, I wanted to use 4.0.2 since it's stable, and it matches what is on the CVMFS system.

*NOTE*: It is important that you select a version of R here. I chose 4.0.2 since it is stable, and there is a matching R version for 4.0.2 in the CVMFS software stack (relevant for next section of installing R packages). I provide an example at the bottom with 4.1.0.

```
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/
module load gcc
module load singularity
singularity pull --name rstudio_4.0.2.sif docker://rocker/rstudio:4.0.2
```

### Installing packages
After pulling the singularity image, you are ready to install packages.

1. Load R into your environment, making sure you match between the Rstudio version you pulled above, and what's available on the system.

```
module load CVMFS_test
module load r/4.0.2
module load gcc/8.4.0
```

2. Make a directory on the system where you'll install your libraries.
```
mkdir -p /scratch/st-sturvey-1/Sandbox/Sherlock/Libs_4.0.2/
```

3. Open an interactive R session, set the .libPaths() to match the directory you just created.
```
R
```
> This enters you into an interactive session, should print something and look like this:
```
R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> 
```
Then set the libPaths()
```
.libPaths('/scratch/st-sturvey-1/Sandbox/Sherlock/Libs_4.0.2/')
```

4. Staying within the interactive session, install a couple pacakges.
```
install.packages("BiocManager",repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
library(BiocManager)
BiocManager::install("sva")
```

### Running Rstudio
Rstudio is run using a PBS job script, which will open a connection to an Rstudio session that you can connect to with a web browser on your local machine. 

1. Change to the directory where you'll be running Rstudio (a directory on scratch space).
```
cd /scratch/st-sturvey-1/Sandbox/Sherlock/
```

2. Create the Run_Rstudio.sh job script, likely using a text editor (e.g. nano/vi/emacs). The script should look like this:
```
#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=1:mem=5gb
#PBS -N my_rstudio_server
#PBS -A <st-alloc-1>
#PBS -m abe
#PBS -M <you.email@ubc.ca>
 
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
export SINGULARITYENV_LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
 
# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home /scratch/<st-alloc-1>/<cwl>/my_rstudio \
 /arc/project/<st-alloc-1>/rstudio/rstudio.sif \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT}
```

The key pieces we need to change here include:  

A) Resources needed
```
#PBS -l walltime=03:00:00,select=1:ncpus=1:mem=5gb
``` 
> Change this to have the amount of memory/cpu your job requires. We can leave it at 5gb but that won't be enough for many tasks. e.g.
```
#PBS -l walltime=06:00:00,select=1:ncpus=6:mem=30gb
```

B) The allocation code.
```
#PBS -A <st-alloc-1>
```
> Change this to be your own allocation, e.g:
```
#PBS -A st-sturvey-1
```

C) Email address.
```
#PBS -M <you.email@ubc.ca>
```
> Change to be your own email:
```
#PBS -M prichmond@bcchr.ca
```

D) Path to your working directory, and the SIF file, inside the singularity exec command:
```
singularity exec --bind $TMPDIR:/var/run \
 --home /scratch/st-sturvey-1/Sandbox/Sherlock/ \
 /arc/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio//rstudio/rstudio.sif \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT}
```
> Change this to be relevant to what we have set up above, notably changing the place we write data (scratch) the place our SIF is stored (project):
```
singularity exec --bind $TMPDIR:/var/run \
 --home /scratch/st-sturvey-1/Sandbox/Sherlock/ \
 /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Rstudio/prichmond_rstudio/rstudio_4.1.0.sif \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT}
```

Your final script should look something like mine:
```
#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=1:mem=5gb
#PBS -N my_rstudio_server
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
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
#export SINGULARITYENV_LD_LIBRARY_PATH=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/Libs_4.1.0/:/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
 
# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home /scratch/st-sturvey-1/Sandbox/Sherlock/ \
 /arc/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/rstudio_4.1.0.sif \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT}
```

**NOTE** Right now I'm having trouble binding the project mount if that's where libraries are stored. So keep libraries in the scratch directory where you run the tool.



### Full Example with R 4.1.0 (for Matthew Shannon)
> This is the basic setup for starting a new R environment with version 4.1.0.

1. Choose your Rstudio image and pull from the online repository, load the singularity and gcc modules, and pull the Rstudio image with singularity. Here I'm pulling to a directory on the project mount.
```
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/
module load gcc
module load singularity
singularity pull --name rstudio_4.1.0.sif docker://rocker/rstudio:4.1.0
```

2. Create a folder to store your R libraries, and Run_Rstudio script in the scratch working space.
```
mkdir -p /scratch/st-sturvey-1/Sandbox/Sherlock/Libs_4.1.0/
```

3. Get the R executable from the command line to get to the R console, making sure you line up the version of R with what you pulled for Rstudio.
```
module load Software_Collection/2021
module load gcc/9.4.0 cuda/11.3.1 openmpi/4.1.1-cuda11-3 openblas/0.3.15 python/3.8.10 git/2.31.1 geos/3.8.1
module load r/4.1.0
```

4. Check that you've got the right modules loaded. 

```
module list
```
> Should output something like this:
```
  1) openpbs/openpbs/20.0.1     8) numactl/2.0.14          15) libxt/1.1.5
  2) default-environment        9) openmpi/4.1.1-cuda11-3  16) libxmu/1.1.2
  3) Software_Collection/2021  10) openblas/0.3.15         17) openjdk/11.0.8_10
  4) gmp/6.2.1                 11) python/3.8.10           18) r/4.1.0
  5) gcc/9.4.0                 12) curl/7.76.1             19) geos/3.8.1
  6) libxml2/2.9.10            13) libpng/1.6.37           20) perl/5.34.0
  7) cuda/11.3.1               14) libx11/1.7.0            21) git/2.31.1
```

5. Open R console on the command line.
```
R
```
> Should look like this:
```
R version 4.1.0 (2021-05-18) -- "Camp Pontanezen"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

>
```

6. Set the .libPaths() parameter in the R console to match the directory we made above.
```
.libPaths('/scratch/st-sturvey-1/Sandbox/Sherlock/Libs_4.1.0/')
``` 

7. Now download the R packages you need. **NOTE** This can take a logn time. 
```
# Devtools
install.packages("devtools",repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
# BioCLite
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
devtools::install_github('msraredon/NICHES', ref = 'master')
# Seurat
install.packages("Seurat",repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
```

8. Exit the R console when you've finished installing your packages.
```
q()
```

9. Create a Run_Rstudio.sh script similar to the one below, pointing at the SIF file we pulled with singularity, and setting the home directory to be the working space you created above on the scratch mount. For more details see walk-through above. Here, we'll use whatever text-editor we are most familiar with, e.g. nano, vi, or emacs.
```
nano Run_Rstudio.sh
```
OR
```
vi Run_Rstudio.sh
```
OR
```
emacs Run_Rstudio.sh
```


> Script should look like this, you can copy and paste, but modify as needed for paths/email/account.
```
#!/bin/bash
 
#PBS -l walltime=03:00:00,select=1:ncpus=1:mem=5gb
#PBS -N my_rstudio_server
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
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
 
# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home /scratch/st-sturvey-1/Sandbox/Sherlock/ \
 /arc/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/rstudio_4.1.0.sif \
 rserver --auth-none=0 --auth-pam-helper-path=pam-helper --secure-cookie-key-file ${SECURE_COOKIE} --www-port ${PORT}
```

10. Submit the Run_Rstudio.sh script to the scheduler.
```
qsub Run_Rstudio.sh
```

11. Open the connection.txt file created by your job.
```
cat connection_3368189.pbsha.ib.sockeye.txt
```
> Should look something like this:
```
1. Create an SSH tunnel to RStudio Server from your local workstation using the following command:
 
ssh -N -L 8787:se003:60328 richmonp@sockeye.arc.ubc.ca
 
2. Point your web browser to http://localhost:8787
 
3. Login to RStudio Server using the following credentials:
 
Username: richmonp
Password: tC1J0uemvqRD0k620Lqp
 
When done using RStudio Server, terminate the job by:
 
1. Sign out of RStudio (Left of the "power" button in the top right corner of the RStudio window)
2. Issue the following command on the login node:
 
qdel 3368189.pbsha.ib.sockeye
```

12. Open a new terminal (not one that's logged into sockeye, but a fresh terminal on your local machine), and paste in the ssh details. Make sure this is relevant to your own job, not the details I have below.
```
ssh -N -L 8787:se003:60328 richmonp@sockeye.arc.ubc.ca
```

13. Open a web browser, and point to http://localhost:8787.

14. Login with the username and password provided in your connection file.

15. Once in Rstudio, set the .libPaths() parameter by typing into Rstudio console
```
.libPaths("/scratch/st-sturvey-1/Sandbox/Sherlock/Libs_4.1.0/")
```

16. Test that your libraries can be loaded correctly.
```
library(devtools)
```

17. Now have fun using Rstudio!







