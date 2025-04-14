#!/bin/bash -l
#12Jun2024
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=20G
#SBATCH --job-name=plink2
#SBATCH --time=48:00:00
#SBATCH --partition=general

cd $PWD
plink2 --glm \
       --bgen ${path}/data_chr23.bgen \
       --sample ALSPAC_100G_all1_food_liking.sample\
       --pheno alspac_food_liking.pheno3 \
       --covar alspac_food_liking_nosex.cov3 \
       --covar-variance-standardize \
       --missing-code -9,0,NA,na \
       --out alspac_food_liking_chr23 
