# Set this to match your miniconda3
MINICONDA3=/scratch/st-sturvey-1/Workshops/StudentSpaces/$USER/Core_Conda/miniconda3/

# Add conda to your path
source $MINICONDA3/etc/profile.d/conda.sh

# Deep Lab Cut:
#conda env create -f /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/DLC-GPU-environment.yml

# NextFlow
#conda env create -f /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/Nextflow_core_RNAseq.yml

# Genome Analysis
#conda create -c bioconda -n GenomeAnalysis bwa samtools htslib picard

# Variant calling
conda create -c bioconda -n VariantCalling glnexus bcftools vcftools htslib samtools 
