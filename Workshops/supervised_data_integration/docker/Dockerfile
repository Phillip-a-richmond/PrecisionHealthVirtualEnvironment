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

# https://github.com/rocker-org/rocker-versioned2
RUN ./install_python.sh

# Install Python modules
RUN pip install -r ./install_python_packages.txt

# Install R packages
RUN Rscript ./install_r_packages.r
