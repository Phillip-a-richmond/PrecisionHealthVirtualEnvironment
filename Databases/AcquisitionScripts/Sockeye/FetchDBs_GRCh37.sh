# Set DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh37/

########
# CADD #
########
function CADD()
{
	mkdir $DBDIR/CADD/
	
	### CADD v1.2
	mkdir $DBDIR/CADD/V1.2/
	cd $DBDIR/CADD/V1.2/
	#### CADD whole genome
	wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz 
	wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz.tbi 
	
	### CADD v1.4
	mkdir $DBDIR/CADD/V1.4/
	cd $DBDIR/CADD/V1.4/
	#### CADD whole genome 
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh37/whole_genome_SNVs.tsv.gz
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh37/whole_genome_SNVs.tsv.gz.tbi
	
	#### CADD indels
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh37/InDels.tsv.gz
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh37/InDels.tsv.gz.tbi
	
	### CADD v1.6
	mkdir $DBDIR/CADD/V1.6/
	cd $DBDIR/CADD/V1.6/
	#### CADD whole genome 
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh37/whole_genome_SNVs.tsv.gz
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh37/whole_genome_SNVs.tsv.gz.tbi
	
	#### CADD indels
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh37/InDels.tsv.gz
	wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.6/GRCh37/InDels.tsv.gz.tbi
}

###############

##########
# gnomAD #
##########
function gnomAD()
{
	mkdir -p $DBDIR/gnomAD/
	
	### gnomAD v2.1.1
	mkdir -p $DBDIR/gnomAD/V2.1.1/
	cd $DBDIR/gnomAD/V2.1.1/
	
	# Genomes
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/2.1.1/vcf/genomes/gnomad.genomes.r2.1.1.sites.vcf.bgz
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/2.1.1/vcf/genomes/gnomad.genomes.r2.1.1.sites.vcf.bgz.tbi
	
	# rename away from .bgz
	mv gnomad.genomes.r2.1.1.sites.vcf.bgz gnomad.genomes.r2.1.1.sites.vcf.gz
	mv gnomad.genomes.r2.1.1.sites.vcf.bgz.tbi gnomad.genomes.r2.1.1.sites.vcf.gz.tbi
	
	# Exomes
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/2.1.1/vcf/exomes/gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi
	
	# rename away from .bgz
	mv gnomad.exomes.r2.1.1.sites.vcf.bgz gnomad.exomes.r2.1.1.sites.vcf.gz
	mv gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi gnomad.exomes.r2.1.1.sites.vcf.gz.tbi
}	

###############

#########
# dbSNP #
#########

function dbSNP()
{
	mkdir $DBDIR/dbSNP/
	cd $DBDIR/dbSNP/
	
	### dbSNP 151
	wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz
	wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz.tbi
}
###############


##########
# TOPMED #
##########
function TOPMED()
{
	mkdir $DBDIR/TOPMED/
	cd $DBDIR/TOPMED/
	
	# Fetch script (provided by Matthew Oldach 2021-03-03
	curl 'https://bravo.sph.umich.edu/freeze3a/hg19/download/all' -H 'Accept-Encoding: gzip, deflate, br' -H 'Cookie: remember_token="tatiana_maroilley@yahoo.fr|4aa2aa500943ee3585bf6febc63196e170f2fcebf1f2c15b1afb17aa5c3e8d05bda140294f004ec4e33a8e411f7a1c3ad26bbda7d9ccde22bcb3452a9bc6789b"; _ga=GA1.2.200123860.1613163948; _gid=GA1.2.1854906133.1614791993; _gat=1' --compressed > bravo-dbsnp-all.vcf.gz
}	
	

#############

# Execution #

#############

#CADD
gnomAD
#dbSNP
#TOPMED







