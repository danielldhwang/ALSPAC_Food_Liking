#!/bin/bash -l
#12June2024
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --job-name=plink2
#SBATCH --time=96:00:00
#SBATCH --partition=general
#SBATCH --account=**
#SBATCH --array=1-9

cd $PWD
plink2 --glm \
       --bgen data_chr0${SLURM_ARRAY_TASK_ID}.bgen \
       --sample ALSPAC_100G_all1_food_liking.sample \
       --pheno alspac_food_liking.pheno \
       --covar alspac_food_liking.cov \
       --covar-variance-standardize \
       --missing-code -9,0,NA,na \
       --out alspac_food_liking_chr${SLURM_ARRAY_TASK_ID} 
