#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=2:mem=16gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M YOUR@EMAIL.HERE
 
################################################################################

cd $PBS_O_WORKDIR

# add nextflow to path
export PATH=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Workshops/Nextflow/bin:$PATH

# set nextflow work dir
export NXF_WORK=$PBS_O_WORKDIR

# set nextflow singularity cache dir
export NXF_SINGULARITY_CACHEDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/nf_singularity_cache

# run nf-core/rnaseq
nextflow run nf-core/rnaseq \
    -profile singularity \
    -c nf-core-rnaseq.config \
    -params-file nf-core-rnaseq-params.yml

