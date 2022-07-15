#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=1:mem=2gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################
#!/bin/bash

# Comments don't get executed. Comment lines start with a '#'

# First command:
ls /scratch/tr-precisionhealth-1/Workshops/Core_HPCBasics/

# Second command:
# Note the -p here means that if a directory doesn't exist, then make one, if it does, then ignore it.
mkdir -p /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/

# Third command:
# echo prints something to the screen
echo "Sherlock is a social butterfly"

# Fourth command:
# Print out the date
date

# Fifth command:
# Sleep for 30 seconds
sleep 30

