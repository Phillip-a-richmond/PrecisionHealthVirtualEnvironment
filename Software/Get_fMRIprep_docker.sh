module load singularity
export SINGULARITY_CACHEDIR=$PWD
singularity pull fmriprep.sif docker://nipreps/fmriprep
