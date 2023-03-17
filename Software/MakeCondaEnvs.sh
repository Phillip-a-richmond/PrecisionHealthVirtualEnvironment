# Source conda, get it in your path
source /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh

# Deep Lab Cut:
#conda env create -f /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/DLC-GPU-environment.yml

# NextFlow
#conda env create -f /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/Nextflow_core_RNAseq.yml

# Genome Analysis
#conda create -c bioconda -n GenomeAnalysis bwa samtools htslib picard

# Variant calling
#conda create -c bioconda -n VariantCalling glnexus bcftools vcftools htslib samtools 

# SRA Tools
#conda create -c bioconda -n SRATools sra-tools

# Plink
#conda create -c bioconda -n Plink plink bcftools vcftools htslib

# Minimap and samtools
conda create -y --experimental-solver=libmamba \
	-c bioconda \
	-n Minimap2_Samtools \
	minimap2=2.24 samtools=1.16.1 htslib=1.16.1 bcftools


