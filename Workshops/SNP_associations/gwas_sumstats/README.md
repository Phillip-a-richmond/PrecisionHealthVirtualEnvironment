This directory is for the the latter part of section 1, downloading and organizing summary statistics data.

We will be cleaning summary statistics following a pipeline made in-house (https://github.com/daniil-belikau/gwas_clean_script) however there is no universal way to do this; Daniil's is just nice and standardized to apply to summary statistics from any source, in any format! 

Note this workshop will not be going through the pipeline in depth, but focusing on demonstrating its output and the downstream applications. 

Copy `/scratch/tr-precisionhealth-1/Workshops/SNP_associations/GWAS_preparation/migraines_females_standardized.tsv` (the output from the pipeline) and `/scratch/tr-precisionhealth-1/Workshops/SNP_associations/GWAS_preparation/migraines_F_clean.txt` as references for the output as described in the .rmd uploaded above.

If you want to try applying the pipeline yourself, find your trait of interest: https://docs.google.com/spreadsheets/d/1kvPoupSzsSFBNSztMzl04xMoSC3Kcx3CrjVf4yBmESU/edit#gid=178908679
(home page: http://www.nealelab.is/uk-biobank) 

- identify rows for trait of interest (self-reported migraine: 20002_1265) in: 
- Download one of your choosing relevant to your subject area using `wget` link
- rename using `mv`

Make sure to check that the Neale Lab confirmed it had ample sample size so as to not provide erroneous results (they will flag it if it has dubious quality data):
https://nealelab.github.io/UKBB_ldsc/

This tutorial will use the migraine data, which shows pronounced sex differences in prevalence and, therefore, potentially different genetic loci.

Neale lab flagged the ICD-10 migraines and recommended against using those stats: ("Warning: Lack of confidence")
https://nealelab.github.io/UKBB_ldsc/h2_summary_G43.html 

However, self-reported migraine (20002_1265) was sufficient: https://nealelab.github.io/UKBB_ldsc/h2_summary_20002_1265.html

Estimated SNP heritability: 0.1022 (se=0.0154, p=1.6e-11) (this is from sex-pooled data (sex regressed out); as they flag sex bias in the data, recommend downloaded the female- and male-specific GWASs to investigate them separately!)
