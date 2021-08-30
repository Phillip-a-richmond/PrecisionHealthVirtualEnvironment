# gnomAD Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/GNOMAD/V3/
mkdir -p $WORKING_DIR
cd $WORKING_DIR
wget -c -q https://storage.googleapis.com/gnomad-public/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.vcf.bgz
wget -c -q https://storage.googleapis.com/gnomad-public/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.vcf.bgz.tbi

# rename away from .bgz
mv gnomad.genomes.r3.0.sites.vcf.bgz gnomad.genomes.r3.0.sites.vcf.gz
mv gnomad.genomes.r3.0.sites.vcf.bgz.tbi gnomad.genomes.r3.0.sites.vcf.gz.tbi
