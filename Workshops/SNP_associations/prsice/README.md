This is for the third application in part 2 of the workshop, creating polygenic risk scores for individuals from summary statistics data using PRSice-2 software.

PRSice-2: https://www.prsice.info/

Make sure you have all the files in `/scratch/tr-precisionhealth-1/Workshops/SNP_associations/prsice` copied in to your student space. 

Make sure the input data are both in correct format.
- Target data: plink binary (.bed/.bim/.fam)
- Base data: .txt with column headers: SNP, CHR, BP, A1, A2, BETA*, SE, P
(*: BETA or OR, depending on which value is used in your sum stats.)
- Pheno data: .txt file with column headers: IID, FID and Pheno column

Software:
- PRSice.R : Executable file .R file downloaded from www.prsice.info
- PRSice_linux
