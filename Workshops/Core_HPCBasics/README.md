# PBS Pro Workshop

> The purpose of this workshop is to expose novice users to the PBS Pro scheduler.

Author: Phillip Richmond 
Contact: prichmond@bcchr.ca


## Outline


## Prerequisites


## Slide Deck

You can retrieve this slide deck at: [https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2613](https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2613)

## Problem Set
Problem set here: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/Core_HPCBasics/ProblemSet/HPCBasics_ProblemSet.txt](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/Core_HPCBasics/ProblemSet/HPCBasics_ProblemSet.txt)

## Github Gist

Gist available here: [https://gist.github.com/Phillip-a-richmond/838fdd07b7652669e50d4d38d4477212](https://gist.github.com/Phillip-a-richmond/838fdd07b7652669e50d4d38d4477212)


Gist pasted below for convenience:
---------

## High Performance Computing Basics
> This gist will have commands run in the Precision Health Bootcamp Summer 2022: HPC Basics.

Pairs with: [https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2479](https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2479)

## Best resource for module commands and interacting with Sockeye/PBS Pro:
- Sockeye wiki: [https://confluence.it.ubc.ca/display/UARC/Quickstart+Guide](https://confluence.it.ubc.ca/display/UARC/Quickstart+Guide). 
- PBS Pro Guide: [https://help.altair.com/2021.1.1/PBSProfessional/PBSUserGuide2021.1.1.pdf](https://help.altair.com/2021.1.1/PBSProfessional/PBSUserGuide2021.1.1.pdf)
- PBS Pro Reference: [https://help.altair.com/2021.1.1/PBSProfessional/PBSReferenceGuide2021.1.1.pdf](https://help.altair.com/2021.1.1/PBSProfessional/PBSReferenceGuide2021.1.1.pdf)

## Commands we ran in workshop pasted no context
```
ssh richmonp@sockeye.arc.ubc.ca
mkdir -p /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp/
ls /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/richmonp
cp -R /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_HPCBasics/ ./ 
cd ./Core_HPCBasics/
ls
cd ./Scripts/
ls
cat BasicBashScript.sh
sh BasicBashScript.sh
echo $USER
echo $PATH
ls /usr/bin
ls -lah ~/.bash_profile
nano ~/.bash_profile
echo $PATH
module avail
module load git/2.31.1
echo $PATH
module list
module remove git/2.31.1
module list
sh /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/BasicBashScript.sh
qsub -I -l walltime=3:00:00,select=1:ncpus=4:mem=16gb -q interactive_cpu -A st-sturvey-1
qstat -u $USER
exit
cat /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/Core_HPCBasics/Scripts/PBS_Pro_Header_Template.sh
nano /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/Core_HPCBasics/Scripts/PBS_Pro_Header_Template.sh
qsub /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/Core_HPCBasics/Scripts/PBS_Pro_Header_Template.sh
qstat -u $USER
qdel 3942379.pbsha.ib.sockeye
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/ 
ls ./Files/
more ./Files/Proband_R1.fastq
ls /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/
more /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/GRCh38_full_analysis_set_plus_decoy_hla.fa
cd /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_HPCBasics/ 
```

## Command Breakdown


### Execute Bash script: sh
```
sh <bashScript.sh>
```
Example:
```
sh BasicBashScript.sh
```


### Module commands
Find available modules
```
module avail
```

Load modules
```
module load <moduleName>
```
Example
```
module load git/2.31.1
```

List the modules you have loaded:
```
module list
```

Remove a module
```
module remove <moduleName>
```
Example:
```
module remove git/2.31.1
```

### Interacting with Scheduler

Submit an interactive job
```
qsub -I -l walltime=<walltime>,select=<nodeNumber>:<cpuNumber>:<memory> -q interactive_cpu -A <allocationTag>
```
Example
```
qsub -I -l walltime=3:00:00,select=1:ncpus=4:mem=16gb -q interactive_cpu -A st-sturvey-1 
```

Submit a job to the queue:
```
qsub <jobScript>
```
Example
```
qsub MapAndConvert_JobScript.sh
```

Check the status of a job in the queue:
```
qstat -u $USER
```

Delete an active job:
```
qdel <jobID>
```
Example
```
qdel 3942379
```

Check resources from finished job
```
qstat -xf <jobID>
```
Example
```
qstat -xf 3943286
```

