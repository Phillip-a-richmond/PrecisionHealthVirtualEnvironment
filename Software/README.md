# Software
> This directory will store software packages used in the analysis of precision health data.

## Overview
- [Software Mantra](#Software-Mantra)
- [Software Organization](#Software-Organization)
- [Miniconda](#Miniconda)
- [Rstudio](#Rstudio)

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
mkdir /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/prichmond/
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

### Basic Setup Overview
Using Rstudio on sockeye can be done using the guide here: 
https://confluence.it.ubc.ca/display/UARC/RStudio+with+Singularity

That guide will walk you through:
1. Pull your Rstudio container.
2. Install packages for use within your container.
3. Create and run an Rstudio job.
4. Open your session in a web browser and use Rstudio.

I have done this walkthrough within the directory: 
```
/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/
```

### Pulling Rstudio container with specific R version
You can choose a specific version of the Rstudio singularity image by choosing from the tags available here: 
[https://hub.docker.com/r/rocker/rstudio/tags?page=1&ordering=last_updated](https://hub.docker.com/r/rocker/rstudio/tags?page=1&ordering=last_updated)

For me, I wanted to use 4.0.2 since it's stable, and it matches what is on the CVMFS system.

*NOTE*: It is important that you select a version of R here. I chose 4.0.2 since it is stable, and there is a matching R version for 4.0.2 in the CVMFS software stack (relevant for next section of installing R packages). I provide an example at the bottom with 4.1.0.

```
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
**NOTE** @Jeff/Jerry Would be easiest to have the GCC and R in lmod native to Sockeye instead of within CVMFS   

2. Make a directory on the system where you'll install your libraries.
```
mkdir -p /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/Libs_4.0.2/
```


3. Open an interactive R session, set the .libPaths() to match the directory you just created.
```
R
```
> This enters you into an interactive session, should print something and look like this:
```
```
Then set the libPaths()
```
.libPaths('/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/Libs_4.0.2/')
```

4. Staying within the interactive session, install a couple pacakges.
```
install.packages("BiocManager")
library(BiocManager)
BiocManager::install("sva")
```

### Running Rstudio
Rstudio is run using a PBS job script, which will open a connection to an Rstudio session that you can connect to with a web browser on your local machine. 

1. Identify where you'll be running Rstudio (a directory on scratch space), and make a directory to work in there.
```
mkdir /scratch/st-sturvey-1/Sandbox/Sherlock/
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

Your final script should look something like mine. 



### Full Example with R 4.1.0 (for Matthew Shannon)
> This is the basic setup for starting a new R environment with version 4.1.0.

I navigated this setup in this directory, but it will work anywhere: 
```
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/
```

1. Choose your Rstudio image and pull from the online repository.
```
module load gcc
module load singularity
singularity pull --name rstudio_4.1.0.sif docker://rocker/rstudio:4.1.0
```

2. Create a folder to store your R libraries.

```
mkdir /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/Libs_4.1.0/
```

3. Activate R from the command line to get to the R console, making sure you line up the version of R with what you pulled for Rstudio.

First activate the environment (you can just copy-paste to the command line).
```
module load Software_Collection/2021
module load gcc/9.4.0 cuda/11.3.1 openmpi/4.1.1-cuda11-3 openblas/0.3.15 python/3.8.10 git/2.31.1
module load r/4.1.0
```

4. Check that you've got the right modules loaded. 

```
module list
```
Should output something like this:
```
Currently Loaded Modules:
  1) openpbs/openpbs/current    8) cuda/11.3.1             15) libx11/1.7.0
  2) default-environment        9) numactl/2.0.14          16) libxt/1.1.5
  3) Software_Collection/2021  10) openmpi/4.1.1-cuda11-3  17) libxmu/1.1.2
  4) gcc/9.4.0                 11) openblas/0.3.15         18) openjdk/11.0.8_10
  5) gmp/6.2.1                 12) python/3.8.10           19) r/4.1.0
  6) singularity/3.8.5         13) curl/7.76.1             20) perl/5.34.0
  7) libxml2/2.9.10            14) libpng/1.6.37           21) git/2.31.1
```

5. Open R console on the command line.
```
R
```
Should look like this:
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
.libPaths('/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/prichmond_rstudio/Libs_4.1.0/')
``` 

7. Now download the R packages you need.
```
# Devtools
install.packages("devtools",repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
# BioCLite
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", repos = "https://mirror.rcg.sfu.ca/mirror/CRAN/")
devtools::install_github('msraredon/NICHES', ref = 'master')
```

8. Exit the R console when you've finished installing your packages.
```
q()
```

9. Create a RunRstudio.sh script similar to the one below, pointing at the SIF file we pulled with singularity. 







