#!/bin/bash

#Slurm submission options
#LOOK AT THESE AND EDIT TO OVERRIDE FOR YOUR JOB
#SBATCH --mem 1000
#SBATCH --cpus-per-task 1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 0-24:00
#SBATCH --partition ncf_holy
#SBATCH -o npoint_%A_%a.out
#SBATCH -o npoint_%A_%a.err
module load R
export OMP_NUM_THREADS=1
num=$(printf "%04d" $SLURM_ARRAY_TASK_ID)
cd /net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/panasneg.happy/perm.free.panasneg.happy/perm.free.panasneg.happy/

/usr/bin/time --verbose npointrun -m perm.free.panasneg.happy.0001.nii.gz --model /net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/panasneg.happy/perm.free.panasneg.happy/permute_free_model.R --permutationfile WCEN_BRAIN-z_sw.${num}permute.nii.gz -d perm.free.panasneg.happy.designmat.rds

