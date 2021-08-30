# Software
> This directory will store software packages used in the analysis of precision health data.


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

*NOTE: To use this within a script submitted to the scheduler, simply include the source and activate lines at the top of your script!*



