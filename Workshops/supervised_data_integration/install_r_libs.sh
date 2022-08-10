# To install packages, we need to launch the container interactively

# First load singularity
module load Software_Collection/2019
module load gcc/5.4.0
module load singularity/3.2.1

# Point to your Libs, your SIF
Home_Dir=/scratch/st-sturvey-1/Workshops/StudentSpaces/singha53/supervised_data_integration
Lib_Dir=${Home_Dir}/R_Libs_4.1.0/
Rstudio_SIF=$Home_Dir/rpystudio.sif

# Execute the rserver within the rocker/rstudio container
singularity exec --bind $TMPDIR:/var/run \
 --home $Home_Dir \
 --bind $Lib_Dir \
 $Rstudio_SIF \
R

# Run that code from the command line, then once in R, you want to set your .libPaths() to match where your R library is.
# So it'll look like:
# .libPaths('/scratch/st-sturvey-1/Workshops/StudentSpaces/singha53/supervised_data_integration/R_Libs_4.1.0/')
