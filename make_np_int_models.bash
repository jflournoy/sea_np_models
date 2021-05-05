#!/bin/bash

set1fear="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt"
labels="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stress_psych-midpoint5.csv"
mask="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/mask.nii.gz"
wcen="WCEN_"
gcen="GCEN_"
idvar="idnum"
covariates="TIMECENTER"
jobs="60"
permuteN="1000"
permuteRDS="permute_free.RDS"
modelsbasedir="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/"

#Internalizing

const="int"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV internalizing \
--mask "${mask}" \
--set1 "${set1fear}" \
--setlabels "${labels}" \
--output ${basemodel} \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
"${modelsbasedir}/" \
"${basemodel}"

#internalizing_lead

const="int_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV internalizing_lead \
--mask "${mask}" \
--set1 "${set1fear}" \
--setlabels "${labels}" \
--output "${permmodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
--overwrite \
--permute \
--permuteN "${permuteN}" \
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 348 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"
