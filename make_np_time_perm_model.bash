#!/bin/bash

set1fear="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt"
set1happy="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt"
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

#time fear

const="time"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--DV BRAIN \
--IV TIMECENTER \
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
--seed 54 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#time happy

const="time"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--DV BRAIN \
--IV TIMECENTER \
--mask "${mask}" \
--set1 "${set1happy}" \
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
--seed 55 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"
