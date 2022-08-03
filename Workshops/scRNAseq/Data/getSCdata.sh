#!/bin/bash
# Script to download data for scRNAseq workshop
# Written by Jane Velghe on 28-Jul-2022

################################################################################
## Set directory paths ##
DATA_DIR=/scratch/st-sturvey-1/Workshops/StudentSpaces/$USER/scRNAseq/Data

cd $DATA_DIR
mkdir $DATA_DIR/Tiny_Data

mkdir $DATA_DIR/PBMCs_C/
mkdir $DATA_DIR/PBMCs_C/Input_Files
mkdir $DATA_DIR/PBMCs_C/Output_Files

mkdir $DATA_DIR/PBMCs_X/
mkdir $DATA_DIR/PBMCs_X/Input_Files
mkdir $DATA_DIR/PBMCs_X/Output_Files
################################################################################
################################################################################
## GET TINY DATA ##
cd $DATA_DIR/Tiny_Data

wget https://cf.10xgenomics.com/supp/cell-exp/cellranger-tiny-bcl-1.2.0.tar.gz
wget https://cf.10xgenomics.com/supp/cell-exp/cellranger-tiny-bcl-simple-1.2.0.csv
tar -zxvf cellranger-tiny-bcl-1.2.0.tar.gz

################################################################################
################################################################################
## GET PBMC Chromium DATA ##
cd $DATA_DIR/PBMCs_C/Input_Files
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_fastqs.tar
tar -xvf 500_PBMC_3p_LT_Chromium_Controller_fastqs.tar

## GET PBMC OUTPUTFILES IF YOU SKIPPED CELLRANGER COUNT ON THE INPUT FILES ##
cd $DATA_DIR/PBMCs_C/Output_Files
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_possorted_genome_bam.bam
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_possorted_genome_bam.bam.bai
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_molecule_info.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_filtered_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_filtered_feature_bc_matrix.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_raw_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_raw_feature_bc_matrix.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_analysis.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_metrics_summary.csv
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_web_summary.html
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_Controller/500_PBMC_3p_LT_Chromium_Controller_cloupe.cloupe

################################################################################
################################################################################
## GET PBMC X DATA ##
cd $DATA_DIR/PBMCs_X/Input_Files
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_fastqs.tar
tar -xvf 500_PBMC_3p_LT_Chromium_Controller_fastqs.tar

## GET PBMC OUTPUTFILES IF YOU SKIPPED CELLRANGER COUNT ON THE INPUT FILES ##
cd $DATA_DIR/PBMCs_X/Output_Files
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_possorted_genome_bam.bam
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_possorted_genome_bam.bam.bai
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_molecule_info.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_filtered_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_filtered_feature_bc_matrix.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_raw_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_raw_feature_bc_matrix.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_analysis.tar.gz
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_metrics_summary.csv
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_web_summary.html
wget https://cf.10xgenomics.com/samples/cell-exp/6.1.0/500_PBMC_3p_LT_Chromium_X/500_PBMC_3p_LT_Chromium_X_cloupe.cloupe

################################################################################
################################################################################
