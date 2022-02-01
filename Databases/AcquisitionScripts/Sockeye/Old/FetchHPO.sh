#This is the file that gets called weekly to update the clinvar file 
DOWNLOAD_DIR=/mnt/common/DATABASES/GENERIC/HPO/Download/
WORKING_DIR=/mnt/common/DATABASES/GENERIC/HPO/
ARCHIVE_DIR=/mnt/common/DATABASES/GENERIC/HPO/Archive
mkdir -p $DOWNLOAD_DIR
mkdir -p $ARCHIVE_DIR
cd $DOWNLOAD_DIR
#download
wget http://compbio.charite.de/jenkins/job/hpo.annotations.monthly/lastSuccessfulBuild/artifact/annotation/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt
wget http://compbio.charite.de/jenkins/job/hpo.annotations.monthly/lastSuccessfulBuild/artifact/annotation/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt

cp ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt $WORKING_DIR/
cp ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt $WORKING_DIR/


cp $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt $ARCHIVE_DIR/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt`date '+%y%m%d'`
cp $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt $ARCHIVE_DIR/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt`date '+%y%m%d'`

#cleanup
rm $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_genes_to_phenotype.txt
rm $DOWNLOAD_DIR/ALL_SOURCES_ALL_FREQUENCIES_phenotype_to_genes.txt


