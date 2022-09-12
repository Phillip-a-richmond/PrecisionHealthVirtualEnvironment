# Precision Health Bootcamp 2022 Workshop Descriptions

<img src="https://user-images.githubusercontent.com/59856969/173961211-c3902de3-6761-4f21-be10-1184e08760a8.png" alt="BCCHR Precision Health Bootcamp Logo" width="150"/>


## Workshop Outline: 

Core:
- [Intro to Sockeye and HPC Basics](#workshop-1-and-2)  
- [Software Management(Conda, Singularity, Git) and Data Management (Chinook)](#workshop-3-and-4)  
- [Interactive RStudio + Package Management](#workshop-5)
- [Core Skills Assessment](#core-skills-practical-exam)

Applied:
- [NextFlow](#workshop-6-and-7)
- [DNAm](#workshop-8)
- [RNA-seq](#workshop-9-and-10)  
- [scRNA-seq](#workshop-11-and-12)
- [SNP Data Handling and Association Testing](#workshop-13-and-14)
- [Multi-omics Data Integration](#workshops-15-to-18)
- [fMRI](#workshop-19-and-20)
- [DeepLabCut](#workshop-21-and-22)  

***

#### Workshop 1 and 2   
### Introduction to the Precision Health Bootcamp, The Linux Command Line, and High Performance Computing Basics on the Sockeye Server

**Workshop Date**: Monday, July 25 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research. 

**Content Overview**: This is a core skills session focusing on fundamentals of using Sockeye resources. In the morning session we will get an Introduction to the Precision Health Bootcamp, followed by a hands-on introduction to the command line and computing via servers. In the afternoon we will cover file editing with nano, an intro to bash scripting, and an  intro to the PBS Pro scheduler. We will be handling human genome sequencing data during these two sessions. 

**Prerequisites**: 
- Ability to log-in to the Sockeye cluster 
- Access to /scratch/tr-precisionhealth-1/

**Recordings**:
- Command Line Intro: [https://www.youtube.com/watch?v=TtumysCCy7I&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2](https://www.youtube.com/watch?v=TtumysCCy7I&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2). 
- HPC Basics: [https://www.youtube.com/watch?v=ic48MCaPIwM&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=2](https://www.youtube.com/watch?v=ic48MCaPIwM&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=2). 

**Slides**:
- Command Line Intro: [https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.p](https://docs.google.com/presentation/d/1vl6V92WAsBwl5LjxgTGfv4RuucQtMkHP8UsBjmetJFw/edit#slide=id.p)
- HPC Basics: [https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2613](https://docs.google.com/presentation/d/1lJltAnO6dgznRgJi-KjV9UZL1SbB0gWe17xk_9SoNKc/edit#slide=id.g13d0dd4667e_0_2613)

**Workshop Folder**:
- Command Line Intro: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_CommandLine](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_CommandLine)
- HPC Basics: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_HPCBasics](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_HPCBasics)


***  

#### Workshop 3 and 4  
### Software Management with Conda, Singularity, and Git + Data Management with Chinook

**Workshop Date**: Tuesday, July 26 2022   
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research.

**Content Overview**: This session will focus on using conda and singularity to manage your research software stack in the morning, with git/GitHub to manage your own analysis and code development in the afternoon, with an added demonstration of the Chinook object storage platform. The morning session will build on the analysis of short read DNA sequencing data, leveraging the conda environment to manage tools, and using singularity to pull a docker container with the variant caller DeepVariant to process our DNA sequencing reads. The afternoon session will include the basics of using git and GitHub for version control, as well as using the Chinook system for data management.

**Prerequisites**: 
- Familiarity with LINUX command line and PBS Pro scheduler or our Bootcamp’s Core Workshop: [Intro to Sockeye and HPC basics](#workshop-1-and-2) 

**Recordings**:
- Conda and Singularity: [https://www.youtube.com/watch?v=093Iq2n5kMM&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=3](https://www.youtube.com/watch?v=093Iq2n5kMM&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=3). 
- Git/GitHub: [https://www.youtube.com/watch?v=ZtC1qmM_CHA&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=4](https://www.youtube.com/watch?v=ZtC1qmM_CHA&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=4). 
- Chinook: []()

**Slides**:
- Conda and Singularity: [https://docs.google.com/presentation/d/1twzjIsN1u4BtKXWFuOCVOpaIz-1mv93TSippl8rJTvI/edit#slide=id.g13b8381d6ce_0_0](https://docs.google.com/presentation/d/1twzjIsN1u4BtKXWFuOCVOpaIz-1mv93TSippl8rJTvI/edit#slide=id.g13b8381d6ce_0_0)
- Git/GitHubp[https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/github/slides/Git(Hub).pdf](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/github/slides/Git(Hub).pdf)
- Chinook[https://docs.google.com/presentation/d/1PtiK7835BO0QTzxBzXuGJ0WIIpaUsJAlOtuhv84WjvA/edit#slide=id.g13b9875dd28_0_84](https://docs.google.com/presentation/d/1PtiK7835BO0QTzxBzXuGJ0WIIpaUsJAlOtuhv84WjvA/edit#slide=id.g13b9875dd28_0_84)


**Workshop Folder**:
- Conda: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Conda](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Conda)
- Singularity: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Singularity](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Singularity)
- Git/GitHub: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/github](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/github)
- Chinook: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Chinook](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Chinook)


***  

#### Workshop 5 
### Interactive RStudio and R library Management  

**Workshop Date**: Wednesday, July 27 2022, 9:00 - 11:00 AM  

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research.

**Content Overview**: This workshop will cover using Sockeye to launch an interactive RStudio session, download software libraries for use within Rstudio, and launch R through the Sockeye cluster. For R and RStudio, we will use the bioconductor docker containers, and will focus on installing libraries with system dependencies, including Minfi and Seurat. The second half of the session will focus on some basic operations in R, which will be expanded upon in the applied sessions. 

**Prerequisites**
- Familiarity with the LINUX command line, PBS Pro scheduler, and Singularity or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2) and [Conda and Singularity](#workshop-3-and-4)   

**Recordings**:
- Rstudio and R Library Management: [https://www.youtube.com/watch?v=AkbeDw8Ksuk&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=5](https://www.youtube.com/watch?v=AkbeDw8Ksuk&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=5)

**Slides**:
- Rstudio and R Library Management: [https://docs.google.com/presentation/d/16jHGlhIx3UIlVcYLU4GbHjYTL6m4DgO9Zq_jFhlhwZg/edit#slide=id.g13edabaa23a_0_325](https://docs.google.com/presentation/d/16jHGlhIx3UIlVcYLU4GbHjYTL6m4DgO9Zq_jFhlhwZg/edit#slide=id.g13edabaa23a_0_325)

**Workshop Folder**:
- Rstudio and R Library Management: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Rstudio](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Rstudio)

***  

### Core Skills Practical Exam  

**Workshop Date**: Wednesday, July 27 2022, 12:00 - 2:00 PM  

**Workshop Type**: Open-help Examination Session  

**Content Overview**: This session will be an open-help session to assist in the completion of the Core Practical Skills Exam. The exam will include tasks covered in the previous core workshops, with a focus on using the Sockeye command line, conda, singularity, R/Rstudio, git/GitHub, and Chinook. Workshop attendees are encouraged to work together and use resources from previous workshops to complete the tasks in the exam. 


***  

#### Workshop 6 and 7 
### Hitchhiker's Guide to NextFlow

**Workshop Date**: Thursday, July 28 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for intermediate users.

**Content Overview**: Nextflow is a powerful workflow language that is highly reproducible, scalable, and easy to use. Our goal in this workshop is to familiarize you with the capabilities of Nextflow pipelines and how they work at a high level, such that you will be able to deploy one for your own needs. In the first session of this workshop, you will learn how to set up and execute pre-built community workflows for analysing your data at scale on a high-performance computing cluster. For users who are interested in more granularity, in the second session we will explore a user-made workflow to understand the structure of a Nextflow pipeline and how a custom configuration can offer portability and flexibility.

**Prerequisites:** 
- Familiarity with the LINUX command line, PBS Pro scheduler, and Singularity or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2) and [Conda and Singularity](#workshop-3-and-4)     

**Recordings**:
- Nextflow Part 1: [https://www.youtube.com/watch?v=rgBPNxuYkFk&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=6](https://www.youtube.com/watch?v=rgBPNxuYkFk&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=6)
- Nextflow Part 2: [https://www.youtube.com/watch?v=bxEWSzeOLdE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=7](https://www.youtube.com/watch?v=bxEWSzeOLdE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=7)

**Slides**:
- Nextflow Part 1: [https://docs.google.com/presentation/d/1U1NlXyaeUz2rgpO6ahNb19mLRFxf3fE8UVvbIRUcD7E/edit#slide=id.g13d11b74600_1_331](https://docs.google.com/presentation/d/1U1NlXyaeUz2rgpO6ahNb19mLRFxf3fE8UVvbIRUcD7E/edit#slide=id.g13d11b74600_1_331)
- Nextflow Part 2: [https://docs.google.com/presentation/d/1G0j21Hjk-fpL5y-q-DZQBypVNlsII8HZsYxaXx6GF0Y/edit?usp=sharing](https://docs.google.com/presentation/d/1G0j21Hjk-fpL5y-q-DZQBypVNlsII8HZsYxaXx6GF0Y/edit?usp=sharing)

**Workshop Folder**:
- NextFlow: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Nextflow](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Nextflow)


***  

#### Workshop 8  
### Running an epigenome-wide (DNA methylation) association study on data from GEO  

**Workshop Date**: Friday, July 29 2022, 9:00 - 11:00AM  

**Workshop Type**: This is an applied workshop for intermediate R users, but no DNA methylation experience is required.

**Content Overview**: This workshop will cover the download of DNA methylation microarray data from a public repository (the Gene Expression Omnibus, GEO). We will parse the metadata from this public dataset, process the DNA methylation data for analysis, and conduct a differential methylation analysis in R, using data from the Illumina HumanMethylation450 microarray.  

**Prerequisites:**  
- Familiarity with the R programming languge, LINUX command line, PBS Pro scheduler, and Singularity for Rstudio or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2), [Conda and Singularity](#workshop-3-and-4), [Interactive Rstudio and package management](#workshop-5).     
  
  
**Recording**:
- Intro to EWAS: [https://www.youtube.com/watch?v=CnEGKXufarw&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=10](https://www.youtube.com/watch?v=CnEGKXufarw&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=10)

**Slides**:
- Intro to EWAS: [https://docs.google.com/presentation/d/1J-yii-91nH6KAsNqLUELakKhLAMwGvT864Qwwsz7ug0/edit#slide=id.g13dea8c6159_5_0](https://docs.google.com/presentation/d/1J-yii-91nH6KAsNqLUELakKhLAMwGvT864Qwwsz7ug0/edit#slide=id.g13dea8c6159_5_0)

**Workshop Folder**:
- Intro to EWAS: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/IntroToEWAS](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/IntroToEWAS)


***  
  
#### Workshop 9 and 10     
### RNA-seq in a Nutshell  

**Workshop Date**: Tuesday, August 2 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**:  This is an applied workshop for intermediate R users.
  
**Content Overview**: This workshop will introduce users to the basics of processing and analyzing RNA-seq data using a publicly available dataset (GEO Accession GSE157103). Part 1 will start with a raw expression count matrix (pre-formatted for participants’ convenience), and will go through steps to clean, filter, and normalize the data. Part 2 of the workshop will start with processed counts data and run through how to conduct principal component analysis, differential expression, as well as introduce tools for gene and pathway analysis.  

**Prerequisites:**  
- If you haven’t ever used R/RStudio before, complete our Bootcamp’s Core Workshop: [Interactive RStudio + Package Management](#workshop-5)    
- Ensure that RStudio is installed on, and works, on your Sockeye allocation. 

**Recordings**:
- RNAseq Part 1: [https://www.youtube.com/watch?v=T-YUK46J3AE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=8](https://www.youtube.com/watch?v=T-YUK46J3AE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=8)
- RNAseq Part 2: [https://www.youtube.com/watch?v=L3WiDr4hnhU&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=9](https://www.youtube.com/watch?v=L3WiDr4hnhU&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=9)

**Slides**:
- RNAseq Part 1: 
- RNAseq Part 2: 


**Workshop Folder**:



**


***  

#### Workshop 11 and 12 
### A Taste of Single-cell RNA-seq (scRNA-seq)    

**Workshop Date**: Wednesday, August 3 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for beginner-to-intermediate users.  

**Content Overview**: With the advancement of single cell RNA sequencing (scRNAseq) there is a cambrian explosion of associated packages and tools to help scientists analyze their data. However, data needs to be initially processed by  be properly analyzed, the task of removing outliers and cleaning up background noise to create a clean and unbiased dataset is a  data can be properly analyzed.

**Prerequisites:** 
- Familiarity with the R programming languge, LINUX command line, PBS Pro scheduler, and Singularity for Rstudio or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2), [Conda and Singularity](#workshop-3-and-4), and [Interactive Rstudio and package management](#workshop-5).

**Recordings**:
- Part 1: [https://www.youtube.com/watch?v=_IonfgJ-y-s&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=11](https://www.youtube.com/watch?v=_IonfgJ-y-s&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=11)
- Part 2: [https://www.youtube.com/watch?v=VcQ8UcHzfn0&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=12](https://www.youtube.com/watch?v=VcQ8UcHzfn0&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=12)

**Slides**:


**Workshop Folder**:




***

#### Workshop 13 and 14 
### Single Nucleotide Polymorphisms (SNPs) and Genetics Associations  

**Workshop Date**: Thursday, August 4 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for intermediate users.  

**Content Overview**:  This workshop will cover first steps when doing any genetic association analysis. In receiving genetic sequencing and/or SNP microarray data, a number of quality control considerations must be considered prior to analyses. The morning session of this workshop will provide an overview of various SNP file types you may encounter, such as plink format (.bed/.bim/.fam), VCF file format, and summary statistics from GWAS. The afternoon session will run through three applied examples of association testing: Extracting individual-level allelic information (ie. 0, 1, 2 copies of an allele) into a standard row-by-column data frame format so as to compare with other non-genetic variables; conduct fine-mapping analyses to identify causal loci of a trait among associated SNPs; and create polygenic risk scores.  

**Prerequisites:**
- Basic familiarity with LINUX and HPC or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2), [Conda and Singularity](#workshop-3-and-4), [Interactive Rstudio + Package management](#workshop-5).

**Recordings**:
- Part 1: [https://www.youtube.com/watch?v=vAKWjePf8LE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=13](https://www.youtube.com/watch?v=vAKWjePf8LE&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=13)
- Part 2: [https://www.youtube.com/watch?v=F7xSFVb2gb0&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=14](https://www.youtube.com/watch?v=F7xSFVb2gb0&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=14)

**Slides**:


**Workshop Folder**:



***

#### Workshops 15 to 18   
### The Toolkit of Multiomics Data Integration  

**Workshop Dates**: Thursday, August 5 2022 and Monday, August 8 2022  

**Multi-omics Data Exploration**: Friday, August 5 2022: 9:00 - 11:00 AM    
**Biomarker Discovery and Evaluation Techniques**: Friday, August 5 2022: 12:00 - 2:00 PM  
**Unsupervised Multi-omics Data Integration**: Monday, August 8 2022: 9:00 - 11:00 AM  
**Supervised Multi-omics Data Integration**: Monday, August 8 2022: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for intermediate users.  

**Content Overview**:  These series of workshops will enable researchers to become comfortable using and interpreting commonly used methods for multiomics data integration through data visualizations and evaluation metrics.  

**Prerequisites**: 
- Basic familiarity with LINUX and HPC or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2), [Conda and Singularity](#workshop-3-and-4), [Interactive Rstudio + Package management](#workshop-5).

**Recordings**:
- Multi-omics Data Exploration: [https://www.youtube.com/watch?v=IGPuS_367Dw&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=15](https://www.youtube.com/watch?v=IGPuS_367Dw&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=15)
- Biomarker Discovery and Evaluation Techniques [https://www.youtube.com/watch?v=YQUhila3VI4&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=16](https://www.youtube.com/watch?v=YQUhila3VI4&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=16)

**Slides**:





***  

#### Workshop 19 and 20 
### Understanding and Interpreting Functional MRI (fMRI)  

**Workshop Date**: Tuesday, August 9 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for beginner/intermediate users.  

**Content Overview**:  
In this session there will be a basic description of MRI, fMRI, and the core data types involved in fMRI-based statistical analyses. There will be a walk-through of the commands used in the fmriprep data preprocessing pipeline, shared via slide deck and markdown. This is not intended to be a code-along style workshop.

**Prerequisites:**
- If you want to execute the commands, then the following:
  -  Basic familiarity with LINUX and HPC or our Bootcamp’s Core Workshops: [Intro to Sockeye and HPC basics](#workshop-1-and-2), [Conda and Singularity](#workshop-3-and-4), [Interactive Rstudio + Package management](#workshop-5).

**Recordings**:
- Part 1: [https://www.youtube.com/watch?v=5faYirHpn6w&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=17](https://www.youtube.com/watch?v=5faYirHpn6w&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=17)
- Part 2: [https://www.youtube.com/watch?v=6i6TVHM7CoY&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=18](https://www.youtube.com/watch?v=6i6TVHM7CoY&list=PLvb5_JhXTpMJEfkj_c3Avjzp7uTv_I7B2&index=18)

**Slides**:

**Workshop Folder**:




*** 

#### Workshop 21 and 22 
### Tracking Models with DeepLabCut 

**Workshop Date**: Wednesday, August 10 2022  
**Part 1**: 9:00 - 11:00 AM    
**Part 2**: 12:00 - 2:00 PM  

**Workshop Type**: This is an applied workshop for beginner-to-intermediate users.   

**Content Overview**:  DeepLabCut (DLC) is widely used for tracking animal body parts for behavioral analysis. In the morning we are going to have a brief overview of the tool, its applications and how to run it on Sockeye server using a Python based virtual environment. The afternoon session will entail labeling few frames of provided dataset, specifying some of the parameters and training a model for automated tracking of the labeled body parts - all on Sockeye server. The session will end with a common question and answer session.

**Prerequisites:** 
- Basic familiarity with navigation on HPC servers, or our Bootcamp’s Core Workshop: [Intro to Sockeye](#workshop-1-and-2) and [Conda and Singularity](#workshop-3-and-4). 

**Recordings**:


**Slides**:

**Workshop Folder**:


*** 


