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
SIF=$Working_Dir/deepvariant_1.4.0.sif

# Here, I'm setting up the sample I'm going to run it on
Sample_ID=Proband
Sample_BAM=${Sample_ID}.sorted.bam
BAM_Dir=$Working_Dir/Files/

# Then, I set up the reference genome location
Fasta_Dir=/project/tr-precisionhealth-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/1000G/
Fasta_File=GRCh38_full_analysis_set_plus_decoy_hla.fa


# This is a complicated command, which will work if you set the above correctly.
singularity run -B /usr/lib/locale/:/usr/lib/locale/ \
	-B "${BAM_Dir}":"/bamdir" \
	-B "${Fasta_Dir}":"/genomedir" \
	-B "${Working_Dir}":"/output" \
	-B "$TMPDIR":"/tmp" \
	$SIF \
  /opt/deepvariant/bin/run_deepvariant \
  --intermediate_results_dir="/tmp/intermediate_results_dir" \
  --model_type=WGS \
  --ref="/genomedir/$Fasta_File" \
  --reads="/bamdir/$Sample_BAM" \
  --output_vcf="/tmp/${Sample_ID}_DeepVariant_way1.vcf.gz" \
  --output_gvcf="/tmp/${Sample_ID}_DeepVariant_way1.gvcf.gz" \
  --num_shards=$NCPUS


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
  --output_vcf=$TMPDIR/${Sample_ID}_DeepVariant_way2.vcf.gz \
  --output_gvcf=$TMPDIR/${Sample_ID}_DeepVariant_way2.gvcf.gz \
  --num_shards=$NCPUS


# Copy data back
cp $TMPDIR/*vcf.gz $Working_Dir

