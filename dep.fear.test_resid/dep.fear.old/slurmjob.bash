#!/bin/bash


#Slurm submission options
#LOOK AT THESE AND EDIT TO OVERRIDE FOR YOUR JOB
#SBATCH -p ncf_holy
#SBATCH --mem 10000
#SBATCH --time 0-6:00
#SBATCH --mail-type=END
#SBATCH -o npoint_%A_%a.out
#SBATCH -o npoint_%A_%a.err
export OMP_NUM_THREADS=1
MODEL=/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/dep.fear.test_resid/model.R
DESIGNMAT=dep.fear.designmat.rds
num=$(printf "%04d" $SLURM_ARRAY_TASK_ID)
npointrun -m dep.fear.${num}.nii.gz --model ${MODEL} -d ${DESIGNMAT}


