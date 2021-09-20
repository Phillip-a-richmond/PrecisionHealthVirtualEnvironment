# Set DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/

########
# CADD #
########
function CADD()
{
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
}
###############

##########
# gnomAD #
##########

function gnomAD()
{
	mkdir -p $DBDIR/gnomAD/
	
	# gnomAD v2.1.1 URLs taken from gnomAD website
	### gnomAD v2.1.1
	mkdir -p $DBDIR/gnomAD/V2.1.1/
	cd $DBDIR/gnomAD/V2.1.1/
	
	
	#### Exomes
	#wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/exomes/gnomad.exomes.r2.1.1.sites.liftover_grch38.vcf.bgz
	#wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/exomes/gnomad.exomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi
	#
	##### rename away from .bgz
	#mv gnomad.exomes.r2.1.1.sites.vcf.bgz gnomad.exomes.r2.1.1.sites.vcf.gz
	#mv gnomad.exomes.r2.1.1.sites.vcf.bgz.tbi gnomad.exomes.r2.1.1.sites.vcf.gz.tbi
	#
	##### Genomes
	#wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/genomes/gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz
	#wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/liftover_grch38/vcf/genomes/gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi
	#
	##### rename away from .bgz
	#mv gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.gz
	#mv gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.bgz.tbi gnomad.genomes.r2.1.1.sites.liftover_grch38.vcf.gz.tbi
	
	
	##########

	# gnomAD URL for v3: https://console.cloud.google.com/storage/browser/_details/gcp-public-data--gnomad/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.vcf.bgz?authuser=0
	### gnomAD V3
#	mkdir -p $DBDIR/gnomAD/V3/
#	cd $DBDIR/gnomAD/V3/
#
#	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.vcf.bgz
#	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.0/vcf/genomes/gnomad.genomes.r3.0.sites.vcf.bgz.tbi
#
#	# rename away from .bgz
#	mv gnomad.genomes.r3.0.sites.vcf.bgz gnomad.genomes.r3.0.sites.vcf.gz
#	mv gnomad.genomes.r3.0.sites.vcf.bgz.tbi gnomad.genomes.r3.0.sites.vcf.gz.tbi
#
	##########

	# URLs taken from gnomAD website
	# unfortunately no combined VCF...
	### gnomAD V3.1.1
	mkdir -p $DBDIR/gnomAD/V3.1.1/
	cd $DBDIR/gnomAD/V3.1.1/
	
	# Genomes (loop)
	for i in {1..22}
	do
		wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chr${i}.vcf.bgz
		wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chr${i}.vcf.bgz.tbi
		mv gnomad.genomes.v3.1.1.sites.chr${i}.vcf.bgz gnomad.genomes.v3.1.1.sites.chr${i}.vcf.gz
		mv gnomad.genomes.v3.1.1.sites.chr${i}.vcf.bgz.tbi gnomad.genomes.v3.1.1.sites.chr${i}.vcf.gz.tbi
	done

	# chrX
	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chrX.vcf.bgz
	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chrX.vcf.bgz.tbi
	mv gnomad.genomes.v3.1.1.sites.chrX.vcf.bgz gnomad.genomes.v3.1.1.sites.chrX.vcf.gz
	mv gnomad.genomes.v3.1.1.sites.chrX.vcf.bgz.tbi gnomad.genomes.v3.1.1.sites.chrX.vcf.gz.tbi

	# chrY
	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chrY.vcf.bgz
	wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/3.1.1/vcf/genomes/gnomad.genomes.v3.1.1.sites.chrY.vcf.bgz.tbi
	mv gnomad.genomes.v3.1.1.sites.chrY.vcf.bgz gnomad.genomes.v3.1.1.sites.chrY.vcf.gz
	mv gnomad.genomes.v3.1.1.sites.chrY.vcf.bgz.tbi gnomad.genomes.v3.1.1.sites.chrY.vcf.gz.tbi

	# chrM
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/3.1/vcf/genomes/gnomad.genomes.v3.1.sites.chrM.vcf.bgz
	wget -c -q https://gnomad-public-us-east-1.s3.amazonaws.com/release/3.1/vcf/genomes/gnomad.genomes.v3.1.sites.chrM.vcf.bgz.tbi
	mv gnomad.genomes.v3.1.sites.chrM.vcf.bgz gnomad.genomes.v3.1.sites.chrM.vcf.gz 
	mv gnomad.genomes.v3.1.sites.chrM.vcf.bgz.tbi gnomad.genomes.v3.1.sites.chrM.vcf.gz.tbi
}	

###############


###############

#########
# dbSNP #
#########

function dbSNP()
{
	mkdir $DBDIR/dbSNP/
	cd $DBDIR/dbSNP/
	
	### dbSNP 151
	wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180423.vcf.gz
	wget -c  https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh38p7/VCF/All_20180423.vcf.gz.tbi
	
}

###############

#CADD
gnomAD
#dbSNP





