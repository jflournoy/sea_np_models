#!/bin/bash
#SBATCH --job-name=ptfce
#SBATCH --output=/users/jflournoy/ptfce/output/ptfce_%A_%a.out
#SBATCH --error=/users/jflournoy/ptfce/output/ptfce_%A_%a.err
#SBATCH --time=2:00:00
#SBATCH --partition=ncf_holy
#SBATCH --mail-type=END,FAIL
#SBATCH --cpus-per-task=1
#SBATCH --mem=6000M

file_index=$SLURM_ARRAY_TASK_ID

file_list=()
while IFS=  read -r -d $'\0'; do
    file_list+=("$REPLY")
done < <(find /net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint -regex '.*/si\.\(fear\|happy\).*/si/si\.si\.\(timecenterXwcen\|wcen\|gcen\|timecenterXgcen\)_brain\.tvalue.nii.gz' -print0)

#find array number 1-N with 
#find /net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint -regex '.*/\(gad\|dep\|socanx\|stresscomp\)\.\(fear\|happy\).*/cs/cs\.\(dep\|gad\|socanx\|betweenwithin2\)\.\(timecenterXwcen\|wcen\)_\(brain\|chronicsev\)\.tvalue.nii.gz'|wc -l

file=${file_list[$((file_index-1))]}

mask_file=$(dirname $(dirname ${file}))/mask.nii.gz
echo "File is: ${file}"
echo "Mask is: ${mask_file}"

module load R
Rscript /net/holynfs01/srv/export/mclaughlin/share_root/users/jflournoy/code/sea_tfce/run_tfce_thresh.R "${file}" "$mask_file"

