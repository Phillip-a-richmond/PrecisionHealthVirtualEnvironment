# This script refers to a VEP install which is a part of the AnnotateVariants conda environment

# The easiest way to use VEP is to: 
# 1. load the conda environment for AnnotateVariants

source /mnt/common/WASSERMAN_SOFTWARE/AnnotateVariants/opt/miniconda3/etc/profile.d/conda.sh
conda activate /mnt/common/WASSERMAN_SOFTWARE/AnnotateVariants/opt/AnnotateVariantsEnvironment/

# Now you have vep executable in your path, as well as vep_install (which is an alias of the available INSTALL.pl which comes from VEP)
# You can download files to a local cache, as well as plugins, using this tool

# For GRCh37 and GRCh38, it looks like this:

vep_install -a cfp -s homo_sapiens -y GRCh37 --PLUGINS LoFtool,MaxEntScan,StructuralVariantOverlap --PLUGINSDIR /mnt/common/DATABASES/REFERENCES/GRCh37/VEP/PLUGINS/ --CACHEDIR /mnt/common/DATABASES/REFERENCES/GRCh37/VEP/

vep_install -a cfp -s homo_sapiens -y GRCh38 --PLUGINS LoFtool,MaxEntScan,StructuralVariantOverlap --PLUGINSDIR /mnt/common/DATABASES/REFERENCES/GRCh38/VEP/PLUGINS/ --CACHEDIR /mnt/common/DATABASES/REFERENCES/GRCh38/VEP/

# LOFTEE also requires a supplemental file:
#wget https://raw.githubusercontent.com/Ensembl/VEP_plugins/release/102/LoFtool_scores.txt
#mv LoFtool_scores.txt /mnt/common/DATABASES/GENERIC/LOFTEE/

# MaxEntScan - has data to download, which I'll keep in /mnt/common/WASSERMAN_SOFTWARE/VEP/, download instructions there

# Structural Variant Plugin
# Downloaded into /mnt/common/DATABASES/


