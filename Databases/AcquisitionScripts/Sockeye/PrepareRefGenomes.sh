# Set the DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/


##############################################################
# Step 1 - Load the Conda environment from AnnotateVariants ##
##############################################################

ANNOTATEVARIANTS_INSTALL_DIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/UserDirs/prichmond/AnnotateVariants/
source ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/miniconda3/etc/profile.d/conda.sh
conda activate ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/AnnotateVariantsEnvironment



###############################################################################
# Step 2 - Get Reference genomes and index them. #
##################################################

# Get Reference Genome Files (these match the files in str_bams) 
## GRCh37
#
#mkdir -p $DBDIR/GRCh37/Genome/
#cd $DBDIR/GRCh37/Genome/
#
#wget http://www.bcgsc.ca/downloads/genomes/9606/hg19/1000genomes/bwa_ind/genome/GRCh37-lite.fa
#wget http://www.bcgsc.ca/downloads/genomes/9606/hg19/1000genomes/bwa_ind/genome/GRCh37-lite.fa.fai
#
#bwa index GRCh37-lite.fa
#

##########
# GRCh38 #
##########

mkdir -p $DBDIR/GRCh38/Genome/
cd $DBDIR/GRCh38/Genome/

#### 1000 Genomes
#mkdir -p 1000G/
#cd 1000G/
#
##### Fetch fasta
#wget -c -q http://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/reference/GRCh38_reference_genome/GRCh38_full_analysis_set_plus_decoy_hla.fa
#
##### Samtools index
#samtools faidx GRCh38_full_analysis_set_plus_decoy_hla.fa
#
##### BWA index
#bwa index GRCh38_full_analysis_set_plus_decoy_hla.fa
#
#### Ensembl
#cd $DBDIR/GRCh38/Genome/
#mkdir -p Ensembl/
#cd Ensembl
#
##### Fetch Fasta
#wget ftp://ftp.ensembl.org/pub/release-96/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz
#gunzip -c Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz > GRCh38-lite.fa
#
##### Samtools index
#samtools faidx GRCh38-lite.fa
#
##### BWA index
#bwa index GRCh38-lite.fa

### Gencode
#### Fasta
#wget -c -q http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/GRCh38.primary_assembly.genome.fa.gz
#
## GFF3/GTF
#wget -c -q http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.annotation.gff3.gz
#gunzip gencode.v38.annotation.gff3.gz
#
#wget -c -q http://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_38/gencode.v38.annotation.gtf.gz
#gunzip gencode.v38.annotation.gtf.gz


### GRCh38.14
mkdir -p GRCh38.14
#wget -c -q https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.29_GRCh38.p14/GCA_000001405.29_GRCh38.p14_genomic.fna.gz
#gunzip GCA_000001405.29_GRCh38.p14_genomic.fna.gz

#bwa index GCA_000001405.29_GRCh38.p14_genomic.fna

#wget -c -q https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.29_GRCh38.p14/GCA_000001405.29_GRCh38.p14_genomic.gtf.gz
#gunzip GCA_000001405.29_GRCh38.p14_genomic.gtf.gz 


