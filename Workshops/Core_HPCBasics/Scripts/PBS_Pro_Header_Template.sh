#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=2:mem=16gb
#PBS -A <YourAllocationCode>
#PBS -m abe
#PBS -M <YourEmail>
 
################################################################################

cd $PBS_O_WORKDIR

echo "Hi, my CWL is $USER"
sleep 30
date
