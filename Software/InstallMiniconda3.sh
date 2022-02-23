#!/bin/sh

function buildMiniConda3() 
{
        DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
        MINI_CONDA_INSTALL_DIR=$DIR/miniconda3

        wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
        bash Miniconda3-latest-Linux-x86_64.sh -b -p $MINI_CONDA_INSTALL_DIR

        source ${MINI_CONDA_INSTALL_DIR}/etc/profile.d/conda.sh
        cd $DIR
	conda --help
}

# Execute it
buildMiniConda3

