# SNP Association Testing: Working with Individual-level Genetic Variants Data and Summary Statistics 

This workshop will cover first steps when doing any genetic association analysis. In receiving genetic sequencing and/or SNP microarray data, a number of quality control considerations must be considered prior to analyses. The morning session of this workshop will provide an overview of various SNP file types you may encounter, such as plink format (.bed/.bim/.fam), VCF file format, and summary statistics from GWAS. The afternoon session will run through three applied examples of association testing: Extracting individual-level allelic information (ie. 0, 1, 2 copies of an allele) into a standard row-by-column data frame format so as to compare with other non-genetic variables; conduct fine-mapping analyses to identify causal loci of a trait among associated SNPs; and create polygenic risk scores.  

## Information

### Slides
Workshop slides are available here: [https://docs.google.com/presentation/d/1ZaP_xxDOKHKRDLxerSta0eseyGfkpUVNWJlik2kwnmI/edit#slide=id.p](https://docs.google.com/presentation/d/1ZaP_xxDOKHKRDLxerSta0eseyGfkpUVNWJlik2kwnmI/edit#slide=id.p)

### Recordings
Part 1: 
- Link: [https://ubc.zoom.us/rec/share/Y4t2CGU4OlaLPmAiV2RrFixFxxD8gvftD1k90pQkQaEZfzcBdlKaNftO05Ezh7zs.e-u9M_QezV8s-Uu3?startTime=1659629138000](https://ubc.zoom.us/rec/share/Y4t2CGU4OlaLPmAiV2RrFixFxxD8gvftD1k90pQkQaEZfzcBdlKaNftO05Ezh7zs.e-u9M_QezV8s-Uu3?startTime=1659629138000)
- Passcode: ```&x8%BFx?```

Part 2:
- Link: [https://ubc.zoom.us/rec/share/Y4t2CGU4OlaLPmAiV2RrFixFxxD8gvftD1k90pQkQaEZfzcBdlKaNftO05Ezh7zs.e-u9M_QezV8s-Uu3?startTime=1659639919000](https://ubc.zoom.us/rec/share/Y4t2CGU4OlaLPmAiV2RrFixFxxD8gvftD1k90pQkQaEZfzcBdlKaNftO05Ezh7zs.e-u9M_QezV8s-Uu3?startTime=1659639919000)
- Passcode: ```&x8%BFx?```

### Details
Zoom link for both sessions: https://ubc.zoom.us/j/67274653046?pwd=SjJZKzR3M0tYM3B5ckFib0FRZW14Zz09

In-person: Room 552 (Koerner Library)

See all of the workshop material under ```/scratch/tr-precisionhealth-1/Workshops/SNP_associations```


## Prerequisites 

We strongly suggest you familiarize yourself with the content from these workshops as some familiarity with R, the Command Line, and submitting jobs in Sockeye is assumed throughout this workshop

- R and RStudio: https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Rstudio
- Intro to Sockeye and HPC basics: https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_HPCBasics
- Conda: https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Conda
- Singularity: https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/tree/main/Workshops/Core_Singularity

Download `Genio` package in R following the InstallPackagesCode.sh (in this directory)

## Workshop Schedule

9-11am: Handling SNP Data (Part 1)
- Quality control
- File formats
- Data wrangling

12-2: Applications of SNP data (Part 2)
- Extracting allele copy numbers
- Fine-mapping
- Designing and implementing polygenic risk scores (PRS)
