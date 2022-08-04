    knitr::opts_chunk$set(echo=FALSE,eval=FALSE)

Goal: Using cleaned and properly formatted GWAS summary statistics data
+ target individual-level data, create and implement polygenic risk
scores using PRSice-2.

Quick paths:

# 1. Correct formatting & setting up the environment

Make sure the input data are both in correct format. - Target data:
plink binary (.bed/.bim/.fam) - Base data: .txt with column headers:
SNP, CHR, BP, A1, A2, BETA*, SE, P (*: BETA or OR, depending on which
value is used in your sum stats.) - Pheno data: .txt file with column
headers: IID, FID and Pheno column

Software: - PRSice.R : Executable file .R file downloaded from
www.prsice.info - PRSice\_linux

\#2. Tour of PRSice-2 website

<https://www.prsice.info/>

This workshop will show only a very brief overview of some of the
options.

\#3. PBS scripts for output

Target: `QCed_1000G` (do not enter .bed/fam/bim) Base:
`migraines_F_clean.txt` Pheno: `pheno.txt`

Create a next pbs script and label as you want. For this example, will
be “migraines\_F”. Change the -M to your email. From your metadata,
generate a txt file (like `phenot.txt`) below that has column 1 being
the individual ID (`id`) and column 2 being the phenotype 0/1 (or
continuous, if a non-binary variable) (`pheno`). For this workshop, I
randomly generated 0s and 1s of the metadata. Use `--ignore-fid`

**For you to experiment, without having your own metadata yet, keep the
`pheno.txt` and `QCed1000g` target.**

## 3.1: p&lt;0.01 output

## 3.2: multiple p-threshold output
