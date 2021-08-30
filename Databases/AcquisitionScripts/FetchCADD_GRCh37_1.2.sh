# CADD Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/CADD/V1.2/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# CADD whole genome 
wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz 
wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz.tbi 
