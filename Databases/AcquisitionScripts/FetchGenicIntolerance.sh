# Genic intolerance from RVIS:
wget http://genic-intolerance.org/data/GenicIntolerance_v3_12Mar16.txt
cut -f1,2,3 GenicIntolerance_v3_12Mar16.txt > RVIS_March2016.txt

# pLoF gnomad 2020
wget https://storage.googleapis.com/gnomad-public/release/2.1.1/constraint/gnomad.v2.1.1.lof_metrics.by_gene.txt.bgz


# Coding region intolerance
wget https://s3.us-east-2.amazonaws.com/ccrs/ccrs/ccrs.autosomes.v2.20180420.bed.gz
wget https://s3.us-east-2.amazonaws.com/ccrs/ccrs/ccrs.xchrom.v2.20180420.bed.gz


