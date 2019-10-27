#!/bin/bash

set1fear="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt"
set1happy="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt"
stresslabels="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv"
symptlabels="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv"
mask="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/mask.nii.gz"
wcen="WCEN_"
gcen="GCEN_"
idvar="idnum"
covariates="TIMECENTER"
jobs="60"
permuteN="1000"
permuteRDS="permute_free.RDS"
modelsbasedir="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/"
permmodelpre="perm.free.bw."
permuteType="between"

#EPISODIC AUC

const="eptot"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="${permmodelpre}${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV EPISODICTOT \
--DV BRAIN \
--mask "${mask}" \
--set1 "${set1happy}" \
--setlabels "${stresslabels}" \
--output "${permmodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
--overwrite \
--permute \
--permuteN "${permuteN}" \
--permuteType "${permuteType}" \
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8981 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Chronic severe

const="chsev"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="${permmodelpre}${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV CHRONICSEV \
--DV BRAIN \
--mask "${mask}" \
--set1 "${set1fear}" \
--setlabels "${stresslabels}" \
--output "${permmodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
--overwrite \
--permute \
--permuteN "${permuteN}" \
--permuteType "${permuteType}" \
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8982 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Depression

const="dep"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="${permmodelpre}${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PHQ9_TOT \
--mask "${mask}" \
--set1 "${set1happy}" \
--setlabels "${symptlabels}" \
--output "${permmodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
--overwrite \
--permute \
--permuteN "${permuteN}" \
--permuteType "${permuteType}" \
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8985 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}" 

#GAD Lead

const="gad_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="${permmodelpre}${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV GAD7_TOT_lead \
--mask "${mask}" \
--set1 "${set1fear}" \
--setlabels "${symptlabels}" \
--output "${permmodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
--overwrite \
--permute \
--permuteN "${permuteN}" \
--permuteType "${permuteType}" \
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8989 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}" 

