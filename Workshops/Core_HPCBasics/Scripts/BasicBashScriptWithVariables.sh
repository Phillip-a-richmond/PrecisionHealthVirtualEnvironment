#!/bin/bash

# Here I have a few variables, which I define as VARNAME="<someVariable,like a path>"
WorkshopDir=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_HPCBasics/

ls $WorkshopDir

WorkingDir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/Sherlock/Core_HPCBasics/

cd $WorkingDir

# There are also environmental variables
# $PWD
echo $PWD

echo "I am in the directory: $PWD"

# $USER
echo "Hi, my name is $USER, errr at least that's my CWL!"

# You can make variables within variables by using ${}
MyWorkshopDir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/${USER}/Core_HPCBasics/


# Comments don't get executed. Comment lines start with a '#'
# List a directory
ls $WorkshopDir

# Second command:
# Note the -p here means that if a directory doesn't exist, then make one, if it does, then ignore it.
mkdir -p /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/${USER}/

# Third command:
# echo prints something to the screen
echo "$USER is awesome!"

# Fourth command:
# Print out the date
date

# Fifth command:
# Sleep for 30 seconds
sleep 10

