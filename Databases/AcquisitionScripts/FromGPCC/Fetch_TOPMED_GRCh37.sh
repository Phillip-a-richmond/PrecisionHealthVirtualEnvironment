# Make working directory
DOWNLOAD_DIR=/mnt/common/DATABASES/REFERENCES/GRCh37/TOPMED/
mkdir -p $DOWNLOAD_DIR
cd $DOWNLOAD_DIR

# Fetch script (provided by Matthew Oldach 2021-03-03
curl 'https://bravo.sph.umich.edu/freeze3a/hg19/download/all' -H 'Accept-Encoding: gzip, deflate, br' -H 'Cookie: remember_token="tatiana_maroilley@yahoo.fr|4aa2aa500943ee3585bf6febc63196e170f2fcebf1f2c15b1afb17aa5c3e8d05bda140294f004ec4e33a8e411f7a1c3ad26bbda7d9ccde22bcb3452a9bc6789b"; _ga=GA1.2.200123860.1613163948; _gid=GA1.2.1854906133.1614791993; _gat=1' --compressed > bravo-dbsnp-all.vcf.gz

