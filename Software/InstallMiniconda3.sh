#!/bin/sh

# Pulls miniconda3 install latest from web
# Runs deployment to a directory called $PWD/miniconda3
# Sources conda command to this miniconda3
# cleans up install script
function buildMiniConda3() 
{
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        MINI_CONDA_INSTALL_DIR=$DIR/miniconda3

        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh -b -p $MINI_CONDA_INSTALL_DIR

        source ${MINI_CONDA_INSTALL_DIR}/etc/profile.d/conda.sh
        cd $DIR
	conda --help
	rm Miniconda3-latest-Linux-x86_64.sh
}

# Execute it
buildMiniConda3

###############################

# Adds the libmamba-solver to the conda installation.
# Mamba is King
# RIP Kobe
function libmamba_solver()
{
	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	MINI_CONDA_INSTALL_DIR=$DIR/miniconda3
	conda install -y \
		-c conda-forge \
		conda-libmamba-solver
}

# Execute it
libmamba_solver




