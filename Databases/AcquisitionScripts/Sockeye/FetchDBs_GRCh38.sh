# Set DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/

########
# CADD #
########
mkdir $DBDIR/CADD/

### CADD v1.4
mkdir $DBDIR/CADD/V1.4/
cd $DBDIR/CADD/V1.4/
#### CADD whole genome 
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz.tbi

#### CADD indels
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz.tbi

### CADD v1.6
mkdir $DBDIR/CADD/V1.6/
cd $DBDIR/CADD/V1.6/
#### CADD whole genome 
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh38/whole_genome_SNVs.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh38/whole_genome_SNVs.tsv.gz.tbi

#### CADD indels
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh38/gnomad.genomes.r3.0.indel.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh38/gnomad.genomes.r3.0.indel.tsv.gz.tbi

###############

##########
# gnomAD #
##########

mkdir $DBDIR/gnomAD/

### gnomAD v2.1.1
mkdir $DBDIR/gnomAD/V2.1.1/
cd $DBDIR/gnomAD/V2.1.1/

#### Exomes
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/exomes/gnomad.exomes.r2.1.1.sites.liftover_grch38.vcf.bgz
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/exomes/gnomad.exomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi

#### rename away from .bgz
mv gnomad.exomes.r2.1.1.sites.vcf.bgz gnomad.exomes.r2.1.1.sites.vcf.gz
mv gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi gnomad.exomes.r2.1.1.sites.vcf.gz.tbi

#### Genomes
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/genomes/gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/genomes/gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi

#### rename away from .bgz
mv gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.gz
mv gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.gz.tbi


##########

### gnomAD V3.1.1
mkdir $DBDIR/gnomAD/V3.1.1/
cd $DBDIR/gnomAD/V3.1.1/

# Genomes
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chr1.vcf.bgz
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chr1.vcf.bgz.tbi

# rename away from .bgz
mv gnomad.genomes.v3.1.1.sites.chr1.vcf.bgz gnomad.genomes.v3.1.1.sites.chr1.vcf.gz
mv gnomad.genomes.v3.1.1.sites.chr1.vcf.bgz.tbi gnomad.genomes.v3.1.1.sites.chr1.vcf.gz.tbi


###############


###############

#########
# dbSNP #
#########

mkdir $DBDIR/dbSNP/
cd $DBDIR/dbSNP/

### dbSNP 151
wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180423.vcf.gz
wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180423.vcf.gz.tbi

###############






