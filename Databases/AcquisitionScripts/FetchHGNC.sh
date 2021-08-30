#This is the file that gets called weekly to update the clinvar file 
DOWNLOAD_DIR=/mnt/common/DATABASES/GENERIC/HGNC/
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR
#download
wget ftp://ftp.ebi.ac.uk/pub/databases/genenames/hgnc/tsv/locus_types/gene_with_protein_product.txt

