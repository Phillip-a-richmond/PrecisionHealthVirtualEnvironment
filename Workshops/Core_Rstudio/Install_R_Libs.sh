# To install packages, we need to launch the container interactively

# First load singularity
module load SoftwareCollection/2019
module load gcc/5.4.0
module load singularity/3.2.1

# Point to your Libs, your SIF
Home_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Rstudio/
Lib_Dir=${Home_Dir}/R_Libs_4.2.0/
Rstudio_SIF=$Home_Dir/rstudio-bioconductor-Release_3_15.sif

# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
R

# Run that code from the command line, then once in R, you want to set your .libPaths() to match where your R library is.
# So it'll look like:
# .libPaths('/scratch/st-sturvey-1/Sandbox/BioconductorExample/R_Libs_4.2.0/')

