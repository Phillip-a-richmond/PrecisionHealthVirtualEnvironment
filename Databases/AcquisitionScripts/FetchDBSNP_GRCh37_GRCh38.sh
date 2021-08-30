# dbSNP Fetch script
# September 4, 2020

# RefSNP VCF files for GRC (Genome Reference Consortium) human assembly

# GRCH37
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/DBSNP/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz 
wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz.tbi

# GRCh38
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/DBSNP/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180418.vcf.gz
wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180418.vcf.gz.tbi
