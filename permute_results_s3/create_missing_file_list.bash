#!/bin/bash
#usage: bash script.bash seq_low seq_high fname_prefix fname_postfix file.out

seq_low="${1}"
seq_high="${2}"
fname_prefix="${3}"
fname_postfix="${4}"
file_out="${5}"

vals=($(seq "${seq_low}" "${seq_high}"))
fnames=$(printf "${fname_prefix}%04d${fname_postfix} " "${vals[@]}")
missing="$(ls ${fnames} 2>&1 > /dev/null)"
echo "${missing}" > "${file_out}"
sed -i -e 's/.* \([^ ]\+\.nii\.gz\): .*/\1/' "${file_out}"
sed -e 's/.*\.0\{0,3\}\([[:digit:]]\{1,4\}\)\..*/\1/' "${file_out}" > "${file_out}.numbers" 
