## From Bench to Bioinformatics: UBC Precision Health Bootcamp’s Single Cell RNA Sequencing Data Processing Workshop 


### Part 1 - CellRanger: From Raw to Preprocessed Data

Part 1 of the workshop starts with a mile-high overview of generating droplet-based single cell RNA sequences (scRNAseq). From there, we will look at what raw Illumina sequencing files look like and introduce the CellRanger software. We will focus on two main pipelines: mkfastq and count. Participants will learn how to use these funcitons on UBC ARC Sockeye to convert BCL files to FASTQ files with mkfastq, then align those files to a reference genome using count. From there, data can be used by third party applications for further processing and analysis. 

Learning objectives: 
* Understand the key steps of single cell RNA sequencing, from bench to bioinformatics
* Set up and run the CellRanger mkfastq and count pipelines on Sockeye

#### Slides
[https://docs.google.com/presentation/d/1Q9I5efRXDfej3QDVP1fAlHPftsJ7INLs-B7O9BqnAOY/edit?usp=sharing](https://docs.google.com/presentation/d/1Q9I5efRXDfej3QDVP1fAlHPftsJ7INLs-B7O9BqnAOY/edit?usp=sharing)  

#### Recording

- Link: [https://ubc.zoom.us/rec/share/ILFSCA4QHVXwrHQURn2KVQpDvRXw97ncpyxmJEQSSnlM5oRPUrzyXKFb9vQl_Xad.KQhLN0aTXtylIC5Q?startTime=1659542755000](https://ubc.zoom.us/rec/share/ILFSCA4QHVXwrHQURn2KVQpDvRXw97ncpyxmJEQSSnlM5oRPUrzyXKFb9vQl_Xad.KQhLN0aTXtylIC5Q?startTime=1659542755000)  
- Passcode: ```n!GZ@89t```

** Requirements: ** 
* Basic working-knowledge and experience with Linux
* Access to Sockeye

***
### Part 2 – Processing scRNAseq Data: From CellRanger outputs to Seurat Object ready for downstream analysis 
 
Part 2 of the workshop will take in the outputs we made in the morning session using CellRanger Software into an RStudio environment on the server. We will process the data one more time to remove ambient mRNA using the SoupX Packages, then make a Seurat object. From there we will threshold our number of genes and number of mRNA picked up in each cell for quality control. Next,  we will remove any remaining artificial multiplets that occurred due to the droplet based mechanism of single cell encapsulation and library preparation using the DoubletFinder package. Finally, we will fully process and integrate two datasets so they can be used for further downstream analysis! 


Learning objectives: 
* Use CellRanger mkfastq and count outputs to create a seurat object of scRNAseq data
* Apply two packages (SoupX and DoubletFinder) to help process scRNAseq data
* Perform SCTransform on multiple samples objects at once and integrate them for downstream analysis

#### Slides 

[https://docs.google.com/presentation/d/1t3B_PYF-Noxfll-nYXzj0bobimKiDgg3QwEksh-6kPo/edit?usp=sharing](https://docs.google.com/presentation/d/1t3B_PYF-Noxfll-nYXzj0bobimKiDgg3QwEksh-6kPo/edit?usp=sharing)

#### Recording

- Link: [https://ubc.zoom.us/rec/share/JP0ST2VvcaTqqmgD7Ht2vVngUzBBzQ2tCXVInTxKHrv-rDWhGiZPzxokbXQgq2H4.-rbRuphxFSp86LOr?startTime=1659553973000](https://ubc.zoom.us/rec/share/JP0ST2VvcaTqqmgD7Ht2vVngUzBBzQ2tCXVInTxKHrv-rDWhGiZPzxokbXQgq2H4.-rbRuphxFSp86LOr?startTime=1659553973000)
- Passcode: ```+t*8bKe@```

** Requirements: ** 
* Basic working-knowledge and experience with R
* Access to Sockeye

***  
### Workshop Resources  

We won’t have time to go through every function, tool, theory, or rational covered in today’s workshop, so please refer to the resources below for more details!

FASTQ Files Explained: 
https://support.illumina.com/bulletins/2016/04/fastq-files-explained.html  
Cell Ranger mkfastq:
https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_fq 
Cell Ranger count: 
https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_ct 
Understanding Cell Ranger Outputs: https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/output/overview 
SoupX: https://cran.r-project.org/web/packages/SoupX/vignettes/pbmcTutorial.html 
DoubletFinder: https://github.com/chris-mcginnis-ucsf/DoubletFinder 
Seurat: https://satijalab.org/seurat/index.html 
SCTransform: https://satijalab.org/seurat/articles/sctransform_vignette.html 
PBMCs_C Dataset: https://www.10xgenomics.com/resources/datasets/500-human-pbm-cs-3-lt-v-3-1-chromium-controller-3-1-low-6-1-0
PBMCs_X Dataset: https://www.10xgenomics.com/resources/datasets/500-human-pbm-cs-3-lt-v-3-1-chromium-x-3-1-low-6-1-0

***  

These two workshops feed into each other as Part 2 is based around the background explained in Part 1. However, it is possible to join for just one workshop. 
