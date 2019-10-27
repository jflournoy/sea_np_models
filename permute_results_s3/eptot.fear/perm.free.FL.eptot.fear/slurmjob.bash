#!/bin/bash

#Slurm submission options
#LOOK AT THESE AND EDIT TO OVERRIDE FOR YOUR JOB
#SBATCH --mem 1000
#SBATCH --cpus-per-task 1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 0-24:00
#SBATCH -o npoint_%A_%a.out
#SBATCH -o npoint_%A_%a.err
export OMP_NUM_THREADS=1
num=$(printf "%04d" $SLURM_ARRAY_TASK_ID)
cd /shared/eptot.fear/perm.free.FL.eptot.fear 
/usr/bin/time --verbose /home/ec2-user/neuropointillist/npointrun -m perm.free.eptot.fear0001.nii.gz --model /shared/eptot.fear/perm.free.FL.eptot.fear/permute_free_model.R --permutationfile WCEN_EPISODICTOT-z_sw.${num}permute.nii.gz -d perm.free.eptot.feardesignmat.rds


