#!/bin/bash

TIME='00:40:00'
MEM='64'

if (( $(echo "$3 > 1" | bc -l) )) 
	then
	TIME='02:00:00'
	MEM='128'
fi

if (( $(echo "$3 < 0.1" | bc -l) )) 
	then
	TIME='00:30:00'
	MEM='32'
fi

read -r -d '' SCRIPT << EOM 
#!/bin/bash
#PBS -l walltime=${TIME},select=1:ncpus=32:mem=${MEM}gb
#PBS -N $1_gwas_pipeline
#PBS -A st-sturvey-1
#PBS -o /scratch/tr-precisionhealth-1/Workshops/SNP_associations/logs/pipeline_$1.log
#PBS -e /scratch/tr-precisionhealth-1/Workshops/SNP_associations/logs/pipeline_$1.err
 
################################################################################
 
module load gcc
module load singularity

singularity run --bind /scratch/tr-precisionhealth-1/Workshops/SNP_associations/:/work  /scratch/tr-precisionhealth-1/Workshops/SNP_associations/db_gwas_software/gwas_pipeline.sif $2 

EOM

echo "$SCRIPT" > /scratch/tr-precisionhealth-1/Workshops/SNP_associations/GWAS_preparation/jobs/pipeline_$1.pbs

qsub /scratch/tr-precisionhealth-1/Workshops/SNP_associations/GWAS_preparation/jobs/pipeline_$1.pbs
