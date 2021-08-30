# Splice AI
# This database is on Illumina's BaseSpace server.
# To download it, I need to either download to my local machine and upload to GPCC...
# or...
# use this BaseSpace CLI, which includes the ability to upload and download files
# Figure this will be useful as a tool so I installed into /mnt/common/WASSERMAN_SOFTWARE/BaseSpace/bs

# Get BaseSpace
#wget "https://api.bintray.com/content/basespace/BaseSpaceCLI-EarlyAccess-BIN/latest/\$latest/amd64-linux/bs?bt_package=latest" -O /mnt/common/WASSERMAN_SOFTWARE/BaseSpace/bs

# Authenticate access
#cd /mnt/common/WASSERMAN_SOFTWARE/BaseSpace/
#./bs auth

# Get entire project (the code comes from the basespace html path)
# It's a BIIIIG download so you'll be waiting awhile
#./bs download project -i 66029966 -o SPLICEAI/

# Move the files into their respective homes and clean up
mv SPLICEAI/genome_scores_v1.3_ds.20a701bc58ab45b59de2576db79ac8d0/*hg38* /mnt/common/DATABASES/REFERENCES/GRCh38/SPLICEAI/
mv SPLICEAI/genome_scores_v1.3_ds.20a701bc58ab45b59de2576db79ac8d0/*hg19* /mnt/common/DATABASES/REFERENCES/GRCh37/SPLICEAI/
