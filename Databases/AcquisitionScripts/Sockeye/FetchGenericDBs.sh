# Set the DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/Generic/
AcquisitionScripts=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/AcquisitionScripts/Sockeye/


#############
# gnomAD OE #
#############

mkdir -p $DBDIR/OE/
cd $DBDIR/OE/

### Metrics by gene
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz -O gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz
mv gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz gnomad.v2.1.1.lof_metrics.by_gene.txt.gz
gunzip gnomad.v2.1.1.lof_metrics.by_gene.txt.gz


### Metrics by transcript
wget -c -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz -O gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz
mv gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz gnomad.v2.1.1.lof_metrics.by_transcript.txt.gz
gunzip gnomad.v2.1.1.lof_metrics.by_transcript.txt.gz


################

########
# OMIM #
########

WORKING_DIR=$DBDIR/OMIM/
DOWNLOAD_DIR=$DBDIR/OMIM/Download/
ARCHIVE_DIR=$DBDIR/OMIM/Archive
mkdir -p $WORKING_DIR
mkdir -p $DOWNLOAD_DIR
mkdir -p $ARCHIVE_DIR

cd $DOWNLOAD_DIR
#download, herein  using Phillip Richmond's API key (prichmond @ bcchr . ca)
wget -c -q http://omim.org/static/omim/data/mim2gene.txt
wget -c -q http://data.omim.org/downloads/XvSdl7fDT1yl5u2taBwJeA/mimTitles.txt
wget -c -q http://data.omim.org/downloads/XvSdl7fDT1yl5u2taBwJeA/morbidmap.txt
wget -c -q http://data.omim.org/downloads/XvSdl7fDT1yl5u2taBwJeA/genemap2.txt

#archive
cp $DOWNLOAD_DIR/mim2gene.txt $ARCHIVE_DIR/mim2gene.txt`date '+%y%m%d'`
cp $DOWNLOAD_DIR/mimTitles.txt $ARCHIVE_DIR/mimTitles.txt`date '+%y%m%d'`
cp $DOWNLOAD_DIR/genemap2.txt $ARCHIVE_DIR/genemap2.txt`date '+%y%m%d'`
cp $DOWNLOAD_DIR/morbidmap.txt $ARCHIVE_DIR/morbidmap.txt`date '+%y%m%d'`

#Rename the morbidmap.txt to OMIM_phenotype
cp $DOWNLOAD_DIR/morbidmap.txt $WORKING_DIR/OMIM_phenotype
cp $DOWNLOAD_DIR/mim2gene.txt $WORKING_DIR/OMIM_mim2gene
#remove the commented lines
grep -v "^#" $WORKING_DIR/OMIM_phenotype > $WORKING_DIR/OMIM_phenotype_nocomments

# Parse into table format (Assuming you are in the acqusition scripts directory: /mnt/common/DATABASES/AcquisitionScripts/)
python $AcquisitionScripts/GetGeneListFromOMIM.py $WORKING_DIR/OMIM_phenotype

#cleanup
rm $DOWNLOAD_DIR/mim2gene.txt
rm $DOWNLOAD_DIR/mimTitles.txt
rm $DOWNLOAD_DIR/morbidmap.txt
rm $DOWNLOAD_DIR/genemap2.txt


###############


#######
# HPO #
#######

WORKING_DIR=$DBDIR/HPO/
DOWNLOAD_DIR=$WORKING_DIR/Download/
ARCHIVE_DIR=$WORKING_DIR/Archive/
mkdir -p $WORKING_DIR
mkdir -p $DOWNLOAD_DIR
mkdir -p $ARCHIVE_DIR
cd $DOWNLOAD_DIR
#download
wget -c -q http://purl.obolibrary.org/obo/hp/hpoa/genes_to_phenotype.txt
wget -c -q http://purl.obolibrary.org/obo/hp/hpoa/phenotype_to_genes.txt

# rename to keep with my pipeline
mv genes_to_phenotype.txt ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt
mv phenotype_to_genes.txt ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt

cp ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt $WORKING_DIR/
cp ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt $WORKING_DIR/

cp ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt $ARCHIVE_DIR/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt`date '+%y%m%d'`
cp ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt $ARCHIVE_DIR/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt`date '+%y%m%d'`

#cleanup
rm $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt
rm $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt


###############


#######
# PLI #
#######

mkdir -p $DBDIR/PLI/
cd $DBDIR/PLI/

# Genic intolerance from RVIS:
wget http://genic-intolerance.org/data/GenicIntolerance_v3_12Mar16.txt
cut -f1,2,3 GenicIntolerance_v3_12Mar16.txt > RVIS_March2016.txt












