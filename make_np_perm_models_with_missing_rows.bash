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

#Depression Lead

const="dep_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PHQ9_TOT_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8986 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="dep_lead"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PHQ9_TOT_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8987 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"


#GAD Lead

const="gad_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8989 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="gad_lead"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV GAD7_TOT_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8990 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Social Anxiety

const="socanx"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV LSA_ANX \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8991 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="socanx"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV LSA_ANX \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8992 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Social Anxiety Lead

const="socanx_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV LSA_ANX_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8993 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="socanx_lead"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV LSA_ANX_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8994 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"


#PANAS POS Lead

const="panaspos_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASPOS_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8997 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="panaspos_lead"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASPOS_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8998 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"


#PANAS NEG Lead

const="panasneg_lead"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASNEG_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 9001 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="panasneg_lead"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASNEG_lead \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 9002 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"
