# Precision Health Bootcamp 2022 Workshop Descriptions


## Workshop Outline



### Introduction to Precision Health Bootcamp, The Linux Command Line, and High Performance Computing Basics on the Sockeye Server

**Workshop Date**: 9:00-11:00AM; 12:00-2:00PM, Monday July 25th, 2022.

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research. 

**Content Overview**: This is a core skills session focusing on fundamentals of using Sockeye resources. In the morning session we will get an Introduction to the Precision Health Bootcamp, followed by a hands-on introduction to the command line and computing via servers. In the afternoon we will cover file editing with nano, an intro to bash scripting, and an  intro to the PBS Pro scheduler. We will be handling human genome sequencing data during these two sessions. 

**Prerequisites**: 
- Ability to log-in to the Sockeye cluster 
- Access to /scratch/tr-precisionhealth-1/

**Survey Questions**:
1.



### Software management with conda, singularity, and git; Data management with Chinook

**Workshop Date**: 9:00-11:00 AM; 12:00-2:00PM, Tuesday July 26th, 2022.

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research.

**Content Overview**: This session will focus on using conda and singularity to manage your research software stack in the morning, with git/GitHub to manage your own analysis and code development in the afternoon, with an added demonstration of the Chinook object storage platform. The morning session will build on the analysis of short read DNA sequencing data, leveraging the conda environment to manage tools, and using singularity to pull a docker container with the variant caller DeepVariant to process our DNA sequencing reads. The afternoon session will include the basics of using git and GitHub for version control, as well as using the Chinook system for data management.

**Prerequisites**: 
- Attendance in July 25th workshop OR Familiarity with linux command line and PBS Pro scheduler


### Interactive Rstudio and R library management

**Workshop Date**: 9:00-11:00 AM, Wednesday July 27th, 2022.

**Workshop Type**: This is a core skills session focusing on fundamentals of using Sockeye for research.

**Content Overview**: This workshop will cover using Sockeye to launch an interactive Rstudio session, download software libraries for use within Rstudio, and launch R through the Sockeye cluster. For R and Rstudio, we will use the bioconductor docker containers, and will focus on installing libraries with system dependencies, including Minfi and Seurat. The second half of the session will focus on some basic operations in R, which will be expanded upon in the applied sessions. 

**Prerequisites**
- Attendance in July 25th workshop and July 26th workshop; OR Familiarity with linux command line, PBS Pro scheduler, and Singularity


### Core Skills Practical Exam

**Workshop Date**: 12:00-2:00 PM, Wednesday July 27th, 2022.

**Workshop Type**: Open-help Examination Session.

**Content Overview**: This session will be an open-help session to assist in the completion of the Core Practical Skills Exam. The exam will include tasks covered in the previous core workshops, with a focus on using the Sockeye command line, conda, singularity, R/Rstudio, git/GitHub, and Chinook. Workshop attendees are encouraged to work together and use resources from previous workshops to complete the tasks in the exam. 


### Hitchhiker's Guide to NextFlow

**Workshop Date**: 9:00-11:00AM; 12:00-2:00PM, Thursday July 28th, 2022.

**Workshop Type**: This is an applied workshop for intermediate users.

**Content Overview**: Nextflow is a powerful workflow language that is highly reproducible, scalable, and easy to use. Our goal in this workshop is to familiarize you with the capabilities of Nextflow pipelines and how they work at a high level, such that you will be able to deploy one for your own needs. In the first session of this workshop, you will learn how to set up and execute pre-built community workflows for analysing your data at scale on a high-performance computing cluster. For users who are interested in more granularity, in the second session we will explore a user-made workflow to understand the structure of a Nextflow pipeline and how a custom configuration can offer portability and flexibility.


### Running an epigenome-wide (DNA methylation) association study on data from GEO

**Workshop Date**: 9:00-11:00AM; Friday July 29th, 2022.

**Workshop Type**: This is an applied precision health technology workshop for intermediate R users, but no DNA methylation experience is required.

**Content Overview**: This workshop will cover the download of DNA methylation microarray data from a public repository (the Gene Expression Omnibus, GEO). We will parse the metadata from this public dataset, process the DNA methylation data for analysis, and conduct a differential methylation analysis in R, using data from the Illumina HumanMethylation450 microarray.

