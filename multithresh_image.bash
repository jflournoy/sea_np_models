#!/bin/bash
#
#Usage:
#bash script.bash sdat_file_prefix mask_file_path target_nii files_for_sdat

prefix=$1
mask=$2
target=$3
tfilename=`basename "${target}"`
tfnoext=${tfilename%.nii.gz}
tfiledir=`dirname "${target}"`


sdat="${prefix}.sdat"
clustpre="${prefix}.3dXClust"
mthresh="${clustpre}.mthresh.A.5perc+tlrc"

echo "Converting to sdat..."

if [ ! -f "${sdat}" ]
then
	3dtoXdataset -prefix "${prefix}" \
		"${mask}" \
		${@:4}
else
	echo "sdat file exists: ${sdat}"
fi

echo "Computing 3dXClustSim..."

if [ ! -f "${mthresh}.BRIK" ]
then
	3dXClustSim -inset "${mask}" \
		"${sdat}" \
		-global \
		-prefix "${clustpre}"
else
	echo "mthresh file exists: ${mthresh}"
fi

echo "Thresholding target: ${target}"

3dMultiThresh -mthresh ${mthresh} \
	-input "${target}" \
	-prefix "${tfiledir}/${tfnoext}.multi-threshed.nii.gz" \
	-allmask "${tfiledir}/${tfnoext}.multi-threshed.all-mask.nii.gz" \
	-nozero 2>&1 | tee "${tfiledir}/${tfnoext}.multi-threshed.out"
