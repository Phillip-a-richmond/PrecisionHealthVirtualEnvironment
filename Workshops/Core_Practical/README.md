# Welcome to your Practical Skills Exam!

This exam involves mapping trio whole genome sequencing data back to the reference genome, and calling variants. Then, you'll be asked to open an Rstudio session with the Seurat library installed.

This is content which was covered in the introductory sessions.

Code for running the commands can be found in the earlier sessions, including Intro to Linux, HPCBasics, Conda, Singularity, and Rstudio.

## The Exam

1. Make a new directory here:

```
/scratch/tr-precisionhealth-1/Workshops/Practical/$USER/
```

2. Copy this directory to your practical directory, which I'll refer to in later steps as the "practical directory":
```
/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_Practical/
``` 

So you should have a directory that looks like this:
```
/scratch/tr-precisionhealth-1/Workshops/Practical/$USER/Core_Practical/
```


3. Map the whole genome sequencing fastq data for Proband, Mother, and Father against the GRCh38 reference genome.
Fastq data is here in your practical directory:
```
/scratch/tr-precisionhealth-1/Workshops/Practical/$USER/Core_Practical/Files/
```

Code for mapping fastq data can be found here:
```
/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Workshops/Core_HPCBasics/Scripts/
``` 

There is a reference genome for you to use here:
```
/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/GRCh38_full_analysis_set_plus_decoy_hla.fa
```

4. Call variants on the trio with DeepVariant and GLNexus.
Code for that can be found here:
```
/project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Workshops/Core_Singularity/Scripts/
```

5. Create a subdirectory called Rstudio in your practical directory:
```
/scratch/tr-precisionhealth-1/Workshops/Practical/$USER/Core_Practical/Rstudio/
```

6. Pull this docker image with singularity:  
[https://hub.docker.com/r/bioconductor/bioconductor_docker](https://hub.docker.com/r/bioconductor/bioconductor_docker)

7. Create an R library folder in your practical directory:
```
mkdir /scratch/tr-precisionhealth-1/Workshops/Practical/$USER/Core_Practical/Rstudio/R_Libs/
```

8. Install the Seurat package into your practical directory R library folder using BiocManager.


9. Open Rstudio with the Rstudio bioconductor singularity image you downloaded.


10. Load the Seurat library in Rstudio


11. Take a snapshot of your screen with the library loaded.


12. Upload the snapshot to your practical directory. 
```
/scratch/tr-precisionhealth-1/Workshops/Practical/$USER/Core_Practical/
```

13. Email prichmond@bcchr.ca that you've finished the practical, and include your CWL, first and last name.


## Extra credit

Mount the filesystem with OSX-Fuse and/or sshfs, see more instructions here: 
