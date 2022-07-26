FROM docker.io/rocker/verse:3.6.2

# Copy current workdir contents to image workdir
COPY . .

# Install binaries, Python
RUN apt-get update -qq && apt-get install -y \
    curl \
    python3.7 \
    python3-pip

# Install Python modules
RUN pip3 install -r code/install_python_packages.txt

# Install R packages
RUN Rscript code/install_r_packages.r

# make analysis figure
RUN Rscript code/analysis_pipeline.R