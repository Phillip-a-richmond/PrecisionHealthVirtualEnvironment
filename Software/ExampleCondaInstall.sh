# This is an example install script. This script assumes you have deployed your own miniconda.
# If you haven't, first run InstallMiniconda3.sh

# Set this to match your miniconda3
MINICONDA3=/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/

# Add conda to your path
source $MINICONDA3/etc/profile.d/conda.sh

# conda create, will make a new environment. 
# By default, it will put the environment in $MINICONDA3/envs/
# You could set it to be elsewhere though, using the -p option. 
conda create \
	-y \
	-n AWScli \
	--experimental-solver=libmamba \
	-c conda-forge \
	awscli=1.22.63

# This example I'm pulling the aws cli, which lets me interact with aws s3. 
# To learn about a given tool on conda, including which channel (-c) to include,
# Simply google: conda install ______
# https://anaconda.org/conda-forge/awscli
# Click on the 'Files' tab to see the available versions. 
# Default will sometimes* download the latest version. Best practice is to specify the version



