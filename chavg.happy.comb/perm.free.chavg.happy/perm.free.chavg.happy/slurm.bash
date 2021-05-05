#!/bin/bash

#Slurm submission options
#LOOK AT THESE AND EDIT TO OVERRIDE FOR YOUR JOB
#SBATCH --mem 1000
#SBATCH -p ncf
#SBATCH --cpus-per-task 1
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --time 0-24:00
#SBATCH -o npointperm_%A_%a.out
#SBATCH --mail-type=END
#SBATCH --account=mclaughlin_lab

module load gcc/7.1.0-fasrc01
module load R/3.5.1-fasrc01

cp ~/.R/Makevars.gcc ~/.R/Makevars

export R_LIBS_USER=/ncf/mclaughlin/users/jflournoy/R_3.5.1_GCC:$R_LIBS_USER
export OMP_NUM_THREADS=1
num=$(printf "%04d" $SLURM_ARRAY_TASK_ID)
dashmarray=($(find ./ -name 'perm.free.*.0001.nii.gz' ))
dashm=${dashmarray[0]}
model="$(pwd -P)/permute_free_model.R"
permfile="WCEN_BRAIN-z_sw.${num}permute.nii.gz"
design=$(ls perm.free.*.designmat.rds)

echo running: srun -c 1 /usr/bin/time --verbose /users/jflournoy/otherhome/code/neuropointillist/npointrun -m "${dashm}" --model "${model}" --permutationfile "${permfile}" -d "${design}"

srun -c 1 /usr/bin/time --verbose /users/jflournoy/otherhome/code/neuropointillist/npointrun -m "${dashm}" --model "${model}" --permutationfile "${permfile}" -d "${design}"
