#!/bin/bash

#Slurm submission options
#LOOK AT THESE AND EDIT TO OVERRIDE FOR YOUR JOB
#SBATCH -p ncf_holy
#SBATCH --mem 15000
#SBATCH --cpus-per-task 24
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 2-00:00
#SBATCH --mail-type=END
#SBATCH -o npoint_%A_%a.out
#SBATCH -o npoint_%A_%a.err

module load gcc/7.1.0-fasrc01
module load R/3.5.1-fasrc01

export OMP_NUM_THREADS=24
MODEL=/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/eptot.gad_lead.fear/eptot.gad_lead.fear.10k/model.R
DESIGNMAT=eptot.gad_lead.fear.designmat.rds
num=$(printf "%04d" $SLURM_ARRAY_TASK_ID)
npointrun -m eptot.gad_lead.fear.${num}.nii.gz --model ${MODEL} -d ${DESIGNMAT} --rds


