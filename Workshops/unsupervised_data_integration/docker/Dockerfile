FROM rocker/rstudio:4.1.0

COPY . .
 
# https://davetang.org/muse/2021/04/24/running-rstudio-server-with-docker/
RUN apt-get clean all && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    libhdf5-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    libxt-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libglpk40 \
    libgit2-28 \
  && apt-get clean all && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
  
RUN apt-get update && apt-get install -f && apt-get install -y python3.6 python3-setuptools python3-dev python3-pip
RUN apt-get install -y libcurl4-openssl-dev 
RUN apt-get install -y libcairo2-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libxt-dev libharfbuzz-dev libfribidi-dev


# Install Python modules
RUN pip install -r ./install_python_packages.txt

# Install mofapy2
#RUN python3 -m pip install 'https://github.com/bioFAM/mofapy2/tarball/master'
RUN python3 -m pip install mofapy2==0.6.4

# Install bioconductor dependencies
RUN R --vanilla -e "\
  if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager', repos = 'https://cran.r-project.org'); \
  sapply(c('rhdf5', 'dplyr', 'tidyr', 'reshape2', 'pheatmap', 'corrplot', \
           'ggplot2', 'ggbeeswarm', 'scales', 'GGally', 'doParallel', 'RColorBrewer', \
           'cowplot', 'ggrepel', 'foreach', 'reticulate', 'HDF5Array', 'DelayedArray', \
           'ggpubr', 'forcats', 'Rtsne', 'uwot', \
           'systemfonts', 'ragg', 'Cairo', 'ggrastr', 'basilisk', 'mvtnorm'), \ 
         BiocManager::install)"

# https://github.com/rocker-org/rocker-versioned2
#RUN ./install_python.sh

# Install R packages
RUN Rscript ./install_r_packages.r
