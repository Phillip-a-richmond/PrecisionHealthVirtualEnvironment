# CADD Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh38/CADD/V1.4/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# CADD whole genome 
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/whole_genome_SNVs.tsv.gz.tbi


# CADD indels
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz
wget -c -q https://krishna.gs.washington.edu/download/CADD/v1.4/GRCh38/InDels.tsv.gz.tbi

