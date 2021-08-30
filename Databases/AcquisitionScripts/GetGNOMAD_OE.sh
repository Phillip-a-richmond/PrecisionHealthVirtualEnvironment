# These gene constraint metrics come from:
# https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz
WORKING_DIR=/mnt/common/DATABASES/GENERIC/OE/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# Metrics by gene
wget -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz -O gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz
gunzip gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz

# Metrics by transcript
wget -q https://storage.googleapis.com/gcp-public-data--gnomad/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz -O gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz
gunzip gnomad.v2.1.1.lof_metrics.by_transcript.txt.bgz

