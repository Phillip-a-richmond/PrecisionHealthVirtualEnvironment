# gnomAD Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/GNOMAD/V2.1.1/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# Genomes
wget -c -q https://storage.googleapis.com/gnomad-public/release/2.1.1/vcf/genomes/gnomad.genomes.r2.1.1.sites.vcf.bgz
wget -c -q https://storage.googleapis.com/gnomad-public/release/2.1.1/vcf/genomes/gnomad.genomes.r2.1.1.sites.vcf.bgz.tbi

# rename away from .bgz
mv gnomad.genomes.r2.1.1.sites.vcf.bgz gnomad.genomes.r2.1.1.sites.vcf.gz
mv gnomad.genomes.r2.1.1.sites.vcf.bgz.tbi gnomad.genomes.r2.1.1.sites.vcf.gz.tbi

# Exomes
wget -c -q https://storage.googleapis.com/gnomad-public/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz
wget -c -q https://storage.googleapis.com/gnomad-public/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi

# rename away from .bgz
mv gnomad.exomes.r2.1.1.sites.vcf.bgz gnomad.exomes.r2.1.1.sites.vcf.gz
mv gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi gnomad.exomes.r2.1.1.sites.vcf.gz.tbi
