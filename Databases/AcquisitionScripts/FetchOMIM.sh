#This is the file that gets called weekly to update the clinvar file 
DOWNLOAD_DIR=/mnt/common/DATABASES/GENERIC/OMIM/Download
WORKING_DIR=/mnt/common/DATABASES/GENERIC/OMIM
ARCHIVE_DIR=/mnt/common/DATABASES/GENERIC/OMIM/Archive
mkdir -p $DOWNLOAD_DIR
mkdir -p $WORKING_DIR
mkdir -p $ARCHIVE_DIR

cd $DOWNLOAD_DIR
#download
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
python /mnt/common/DATABASES/AcquisitionScripts/GetGeneListFromOMIM.py $WORKING_DIR/OMIM_phenotype

#cleanup
rm $DOWNLOAD_DIR/mim2gene.txt
rm $DOWNLOAD_DIR/mimTitles.txt
rm $DOWNLOAD_DIR/morbidmap.txt
rm $DOWNLOAD_DIR/genemap2.txt
