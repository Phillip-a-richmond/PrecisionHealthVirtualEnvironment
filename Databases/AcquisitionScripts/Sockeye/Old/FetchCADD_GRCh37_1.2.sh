# CADD Fetch script

# Working directory set
WORKING_DIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh37/CADD/V1.2/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# CADD whole genome 
wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz 
wget -c -q  https://krishna.gs.washington.edu/download/CADD/v1.2/whole_genome_SNVs.tsv.gz.tbi 
