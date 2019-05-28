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

#         0           1            2         3          4           5            6         7         8            9
dirarray=(chsev.fear  chsev.happy  dep.fear  dep.happy  eptot.fear  eptot.happy  gad.fear  gad.happy socanx.fear  socanx.happy)

thisdir=${dirarray[$dirnum]}

cd $thisdir/$thisdir
make clean
exit
