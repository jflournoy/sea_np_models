#!/bin/bash

#This script only takes .nii.gz files
#example for df=28 p<.005 k>451 using NN=3
#create_cluster_mask.bash 28 .005 3 451 path/to/file.nii.gz 

module load afni/18.3.05-fasrc01

fullfile=$5
filename=`basename $5`
fnoext=${filename%.nii.gz}
filedir=`dirname $5`

nullcrct="$filedir"/"$fnoext".nullcrrct.nii.gz




echo ""
echo ""
if [ -f $nullcrct ]; then
	echo "Found NULL corrected file: $nullcrct" 
else
	#fix 999
	echo "Fixing non-convergent voxels by setting those with 999 equal to 0"
	echo "$filename -> $nullcrct"
	3dcalc -a $fullfile -expr '(1-equals(a,999))*a' -prefix $nullcrct
fi

df=$1

if [[ $1 -eq 0 ]]; then
	echo "DF is 0, attempting to locate df nifti..."
	df_file=$( ls "$filedir"/"${fnoext%-t_sw*}-df_sw.nii.gz" )
	if [ $? -eq 0 ]; then
		df=$( 3dBrickStat -slow -max $df_file )
		df=${df//[[:space:]]/}
		echo "Found $( basename $df_file )"
		echo "Maximum df: $df"
	else
		echo "Error: cannot find $df_file"
		exit 1
	fi
fi

#set the proper stat type and DF
echo "Setting $( basename $nullcrct ) to proper statistic type"
3drefit -fitt -substatpar 0 fitt $df $nullcrct

#create cluster map using bi-sided voxelwise p<.005, k>451 (as determined by 3dClustSim with -acf param)
echo "Creating cluster map with p<$2, NN=$3, k>$4"
echo "Using: $nullcrct"
echo "Cluster map: "$filedir"/"$fnoext".clstmap.df"$df".nii.gz"
echo "Cluster report: "$filedir"/"$fnoext".clstmap.df"$df".report"
3dClusterize -mask "$filedir"/../mask.nii.gz -inset $nullcrct -ithr 0 -idat 0 -bisided p=$2 -NN $3 -clust_nvox $4 -pref_map "$filedir"/"$fnoext".clstmap.df"$df".nii.gz > "$filedir"/"$fnoext".clstmap.df"$df".report
