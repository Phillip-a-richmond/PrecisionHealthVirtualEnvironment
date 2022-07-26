# Singularity Problem Set

1. Look at the following script:
```
/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_Singularity/Scripts/DeepVariant_Trio_GLNexus.sh
```

2. Make sure you have the directory copied to your scratch space:
```
mkdir -p /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/
cp /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Workshops/Core_Singularity/ /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/
```

3. Run the script:
```
qsub /scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Singularity/Scripts/DeepVariant_Trio_GLNexus.sh 
```

4. Examine the output for the Family merged VCF. What is different?

