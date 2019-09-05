#!/bin/bash
#SBATCH --job-name=npoint
#SBATCH --output=/users/jflournoy/sea_npoint/make_%A_%a.out
#SBATCH --error=/users/jflournoy/sea_npoint/make_%A_%a.err
#SBATCH --time=2:00:00
#SBATCH --partition=ncf_holy
#SBATCH --mail-type=END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --mem=1000M

dirnum=$SLURM_ARRAY_TASK_ID
module load R

dirarray=($(cat "$1"))

thisdir=${dirarray[$dirnum]}

echo "Dir list is ${#dirarray[@]} elements long"
echo "Choosing number ${dirnum}"
echo "Changing directory to '${thisdir}'"
cd $thisdir
echo "Running 'make clean'"
make clean
exit
