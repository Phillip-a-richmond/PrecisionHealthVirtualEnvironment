# Precision Health Initiative's Introduction to Epigenome Wide Association Studies (EWAS)

Based on a workshop provided by the BC Children's Research Institute's [Trainee 'Omics Group (TOG)](ihttps://bcchr.ca/tog). You can check it out [here](https://github.com/BCCHR-trainee-omics-group/StudyGroup/tree/master/workshops/2020-10-29_intro_to_ewas), and see their other workshops on their [GitHub Page](https://github.com/BCCHR-trainee-omics-group/StudyGroup).

## Workshop Setup
Please download this directory to a folder on your machine: [Directory Download](https://downgit.github.io/#/home?url=https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/IntroToEWAS)
1. Copy the file named `IntroToEWAS.zip` to your directory on an HPC (Using `scp` on the commandline, or another tool like [Cyberduck](https://cyberduck.io/))
1. Move this file to a writable directory (`mv IntroToEWAS.zip /scratch/<st-your-allocation>/<user>/` on UBC's ARC Sockeye)
1. Unpack and switch into this directory with `unzip IntroToEWAS.zip && cd IntroToEWAS`
1. Make the data directory where you will store all of your data (`mkdir IntroToEWAS`)
1. On UBC's ARC Sockeye, copy required data with `cp -r /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/IntroToEWAS/data/ data/`
1. Edit `mwas_rstudio_job.pbs` to have the location of your writable directory and software
1. Submit the following job on Sockeye with `qsub mwas_rstudio.pbs`
1. Follow the instructions in `connection_<jobid>.txt` when it appeasr in your working directory

## Resources
You can find the required data for this workshop at the following links:
- GEO series matrix file with methylation and phenotype data [GSE100197](https://ftp.ncbi.nlm.nih.gov/geo/series/GSE100nnn/GSE100197/matrix/GSE100197_series_matrix.txt.gz)
- Supplementary material and hits from [Wilson et al, 2017](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5886226/bin/ddx391_supp.zip)
- Raw methylation [IDAT files](https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE100197&format=file)
- HM450 methylation array [manifest](https://webdata.illumina.com/downloads/productfiles/humanmethylation450/humanmethylation450_15017482_v1-2.csv)