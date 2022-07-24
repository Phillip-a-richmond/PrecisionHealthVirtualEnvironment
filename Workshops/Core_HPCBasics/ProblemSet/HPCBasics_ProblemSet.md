# HPC Basics Problem Set

1. Create a new mapping script that will map the data for the Mother (e.g. ```Mother_R1.fastq and Mother_R2.fastq```)

2. Add the samtools flagstat command to the map and convert job script and get the statistics on read mapping for the Father. 

3. Run the job array script that maps data for mother, father, and proband all at once.

4. Mount the filesystem, following instructions here: [https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/MountFilesystem.md](https://github.com/Phillip-a-richmond/PrecisionHealthVirtualEnvironment/blob/main/Workshops/MountFilesystem.md)

5. Download IGV - [https://software.broadinstitute.org/software/igv/download](https://software.broadinstitute.org/software/igv/download)

6. Load the BAM files in IGV:
- Load the hg38 genome (may need to import it)
- Load the BAM files: 
	- File > Load from File
	- Select the bam file

7. Navigate to the WAS gene by typing 'WAS' into the search bar and hitting go. 

8. Take a snapshot of the reads:
- File > Save PNG image



