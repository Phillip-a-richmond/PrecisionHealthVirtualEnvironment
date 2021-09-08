# Working directory set
WORKING_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/GNOMADSV/V2.1/
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# From https://gnomad.broadinstitute.org/downloads#v2-structural-variants
wget -c -q https://storage.googleapis.com/gnomad-public/papers/2019-sv/gnomad_v2.1_sv.sites.vcf.gz
wget -c -q https://storage.googleapis.com/gnomad-public/papers/2019-sv/gnomad_v2.1_sv.sites.bed.gz


