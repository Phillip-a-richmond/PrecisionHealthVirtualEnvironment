# DANN Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/DANN/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# DANN whole genome 
wget -c -q https://cbcl.ics.uci.edu/public_data/DANN/data/DANN_whole_genome_SNVs.tsv.bgz
