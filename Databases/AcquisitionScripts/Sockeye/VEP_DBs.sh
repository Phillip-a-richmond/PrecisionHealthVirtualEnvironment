# Set the DBDIR
DBDIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/

##############################################################
# Step 1 - Load the Conda environment from AnnotateVariants ##
##############################################################

ANNOTATEVARIANTS_INSTALL_DIR=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/UserDirs/prichmond/AnnotateVariants/
source ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/miniconda3/etc/profile.d/conda.sh
conda activate ${ANNOTATEVARIANTS_INSTALL_DIR}/opt/AnnotateVariantsEnvironment

#################################################################
# Step 2 - Call vep_install (from the env) to install GRCh37/38 #
#################################################################


## GRCh37
mkdir -p $DBDIR/GRCh37/VEP/
mkdir -p $DBDIR/GRCh37/VEP/Plugins/

vep_install -a cfp \
	-s homo_sapiens \
	-y GRCh37 \
	--PLUGINS LoFtool,SpliceAI \
	--PLUGINSDIR $DBDIR/GRCh37/VEP/Plugins/ \
	--CACHEDIR $DBDIR/GRCh37/VEP/ 

## GRCh38
mkdir -p $DBDIR/GRCh38/VEP/
mkdir -p $DBDIR/GRCh38/VEP/Plugins/

vep_install -a cfp \
	-s homo_sapiens \
	-y GRCh38 \
	--PLUGINS LoFtool,SpliceAI \
	--PLUGINSDIR $DBDIR/GRCh38/VEP/Plugins/ \
	--CACHEDIR $DBDIR/GRCh38/VEP/ 


