# CADD Fetch script

# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/FATHMM/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# FATHMM whole genome 
wget -c -q http://fathmm.biocompute.org.uk/database/fathmm-MKL_Current.tab.gz
