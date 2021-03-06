#!/bin/bash
 
#PBS -l walltime=10:00:00,select=1:ncpus=4:mem=24gb
#PBS -A st-sturvey-1
#PBS -m abe
#PBS -M prichmond@bcchr.ca
 
################################################################################

cd $PBS_O_WORKDIR

##########
# Set up #
##########

# Change to your workshop directory
Working_Dir=/scratch/tr-precisionhealth-1/Workshops/StudentSpaces/$USER/Core_Singularity/
cd $Working_Dir

# Load singularity
module load singularity

# Where is your SIF file
SIF=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/DeepVariant/deepvariant_1.4.0.sif

# Then, I set up the reference genome location
Fasta_Dir=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/
Fasta_File=GRCh38_full_analysis_set_plus_decoy_hla.fa
 
# Directory for my BAM files
BAM_Dir=$Working_Dir/Files/


###########
# Proband #
###########

# Here, I'm setting up the sample I'm going to run it on
Sample_ID=Proband
Sample_BAM=${Sample_ID}.sorted.bam

# This is another version of the same code, but here we bind paths directly into the container with their original hierarchy
singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
	-B ${Working_Dir} \
	-B ${Fasta_Dir} \
	--home $Working_Dir \
	-B $TMPDIR \
	$SIF \
  /opt/deepvariant/bin/run_deepvariant \
  --intermediate_results_dir=$TMPDIR/intermediate_results_dir \
  --model_type=WGS \
  --ref=$Fasta_Dir/$Fasta_File \
  --reads=$BAM_Dir/$Sample_BAM \
  --output_vcf=$TMPDIR/${Sample_ID}_DeepVariant.vcf.gz \
  --output_gvcf=$TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz \
  --regions "chrX:48300000-49300000" \
  --num_shards=$NCPUS

cp $TMPDIR/${Sample_ID}_DeepVariant.vcf.gz $Working_Dir
cp $TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz $Working_Dir


##########
# Mother #
##########

# Here, I'm setting up the sample I'm going to run it on
Sample_ID=Mother
Sample_BAM=${Sample_ID}.sorted.bam

# This is another version of the same code, but here we bind paths directly into the container with their original hierarchy
singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
	-B ${Working_Dir} \
	-B ${Fasta_Dir} \
	-B $TMPDIR \
	$SIF \
  /opt/deepvariant/bin/run_deepvariant \
  --intermediate_results_dir=$TMPDIR/intermediate_results_dir \
  --model_type=WGS \
  --ref=$Fasta_Dir/$Fasta_File \
  --reads=$BAM_Dir/$Sample_BAM \
  --output_vcf=$TMPDIR/${Sample_ID}_DeepVariant.vcf.gz \
  --output_gvcf=$TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz \
  --regions "chrX:48300000-49300000" \
  --num_shards=$NCPUS

cp $TMPDIR/${Sample_ID}_DeepVariant.vcf.gz $Working_Dir
cp $TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz $Working_Dir

##########
# Father #
##########

# Here, I'm setting up the sample I'm going to run it on
Sample_ID=Father
Sample_BAM=${Sample_ID}.sorted.bam

# This is another version of the same code, but here we bind paths directly into the container with their original hierarchy
singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
	-B ${Working_Dir} \
	-B ${Fasta_Dir} \
	-B $TMPDIR \
	$SIF \
  /opt/deepvariant/bin/run_deepvariant \
  --intermediate_results_dir=$TMPDIR/intermediate_results_dir \
  --model_type=WGS \
  --ref=$Fasta_Dir/$Fasta_File \
  --reads=$BAM_Dir/$Sample_BAM \
  --output_vcf=$TMPDIR/${Sample_ID}_DeepVariant.vcf.gz \
  --output_gvcf=$TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz \
  --regions "chrX:48300000-49300000" \
  --num_shards=$NCPUS

cp $TMPDIR/${Sample_ID}_DeepVariant.vcf.gz $Working_Dir
cp $TMPDIR/${Sample_ID}_DeepVariant.gvcf.gz $Working_Dir

###########################
# GL Nexus Joint Genotype #
###########################

glnexus_sif=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/GLNexus/glnexus_v1.4.3.sif

cd $TMPDIR
singularity exec \
	-B $TMPDIR \
	-B $Working_Dir \
	-B $Fasta_Dir \
	$glnexus_sif \
	glnexus_cli -c DeepVariant_unfiltered \
	--threads $NCPUS \
	$TMPDIR/*gvcf.gz \
	> $TMPDIR/Family.merged.glnexus.bcf

source /project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Software/miniconda3/etc/profile.d/conda.sh
conda activate VariantCalling

bcftools view $TMPDIR/Family.merged.glnexus.bcf | bgzip -c > $TMPDIR/Family.merged.vcf.gz
tabix $TMPDIR/Family.merged.vcf.gz


# Clean up
cp $TMPDIR/Family.merged.vcf.gz* $Working_Dir 



