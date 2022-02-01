#!/bin/bash
#This is the file that gets called weekly to update the clinvar file 
DOWNLOAD_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/ClinVar/Download
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/ClinVar/
ARCHIVE_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/ClinVar/Archive
mkdir -p $ARCHIVE_DIR
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR

#download
wget -c ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/clinvar.vcf.gz
#unzip
gunzip $DOWNLOAD_DIR/clinvar.vcf.gz

# Getting into vcfanno, by running bgzip and tabix
# These tools are available by activating AnnotateVariants
MINI_CONDA_INSTALL_DIR=/mnt/common/WASSERMAN_SOFTWARE/AnnotateVariants/opt/miniconda3
source ${MINI_CONDA_INSTALL_DIR}/etc/profile.d/conda.sh
conda activate /mnt/common/WASSERMAN_SOFTWARE/AnnotateVariants/opt/AnnotateVariantsEnvironment

bgzip -c $DOWNLOAD_DIR/clinvar.vcf > $DOWNLOAD_DIR/clinvar.vcf.gz 
tabix $DOWNLOAD_DIR/clinvar.vcf.gz

# Move out of download dir into working dir
cp $DOWNLOAD_DIR/clinvar.vcf.gz $WORKING_DIR/clinvar.vcf.gz
cp $DOWNLOAD_DIR/clinvar.vcf.gz.tbi $WORKING_DIR/clinvar.vcf.gz.tbi

#archive unzipped with date added
cp $DOWNLOAD_DIR/clinvar.vcf $ARCHIVE_DIR/clinvar_`date '+%y%m%d'`

# Clean up
rm $DOWNLOAD_DIR/clinvar.vcf.gz
rm $DOWNLOAD_DIR/clinvar.vcf.gz.tbi
