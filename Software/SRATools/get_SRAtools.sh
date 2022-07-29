#!/bin/bash
# 
# Script to install SRAtools
#
# Written by Jane Velghe on 28-Jul-2022

# create a software directory to install the software in if one doesn't already exist
# mkdir /scratch/st-sturvey-1/Workshops/scRNAseq/Software

# change into the folder you want the software installed to
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/SRATools/

# download the software
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.0/sratoolkit.3.0.0-ubuntu64.tar.gz

# decompress the downloaded file
tar -xvzf sratoolkit.3.0.0-ubuntu64.tar.gz

#append the path to the binaries to your PATH environment variable
export PATH=$PATH:/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/SRATools/sratoolkit.3.0.0-ubuntu64/bin

#Verify that the binaries will be found by the shell:
which fastq-dump

# start the configuration, this will create a UI to interacti with
vdb-config -i
# - You will see a screen where you operate the buttons by pressing the letter highlighted in red, 
#      or by pressing the tab-key until the wanted button is reached and then pressing the space- 
#      or the enter-key.
# - You want to enable the "Remote Access" option on the Main screen.
# - Proceed to the "Cache" tab where you will want to enable "local file-caching" and you want to 
#     set the "Location of user-repository". The repository directory needs to be set to an empty 
#     folder. This is the folder where prefetch will deposit the files.

####################
  #### NOTES ####
###################

# When using SRA tools for scripts, use this one installed not the one with the conda env
# Start your script with source /scratch/st-sturvey-1/Workshops/scRNAseq/Software/sratoolkit.3.0.0-ubuntu64/bin




