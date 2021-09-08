# Software
> This directory will store software packages used in the analysis of precision health data.

## Overview
- [Software Mantra](##Software-Mantra)
- [Software Organization](##Software-Organization)
- [Miniconda](##Miniconda)
- [Rstudio](##Rstudio)

## Software Mantra
> Installing and configuring bioinformatic software and pipelines can be frustrating, and in many cases it becomes a redundant time-consuming task that, in some cases, prevents users from ever analyzing their own data. *We want to change that.*

Within the PrecisionHealthVirtualEnvironment, we hope to solve some of these redundancies and challenges. We will take a 3 pronged approach:
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

### Basic Setup
Using Rstudio on sockeye can be done using the guide here: 
https://confluence.it.ubc.ca/display/UARC/RStudio+with+Singularity

That guide will walk you through:
1. Set up your Rstudio container
2. Set up your Rstudio job
3. Run the Rstudio job
4. Open your session in a web browser

I have done this walkthrough within the directory: 
```
/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/Rstudio/
```

### Installing packages
After completing the basic setup, then you are ready to install packages.





