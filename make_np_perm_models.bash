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

#EPISODIC AUC

const="eptot"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8981 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Chronic severe

const="chsev"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8982 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

const="chsev"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV CHRONICSEV \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8983 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Chronic Average

const="chavg"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV CHRONICAVG \
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8984 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}"

#Depression

const="dep"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
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
--debugdata "${modelsbasedir}/${modeldirname}/${modeldirname}/debug.Rdata" \
--seed 8985 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}" 

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

#GAD

const="gad"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV GAD7_TOT \
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
--seed 8988 \
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


#PANAS POS

const="panaspos"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASPOS \
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
--seed 8995 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}" 

const="panaspos"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASPOS \
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
--seed 8996 \
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

#PANAS NEG

const="panasneg"
brain="fear"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASNEG \
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
--seed 8999 \
--permutationRDS "${permuteRDS}" \
"${modelsbasedir}/${modeldirname}/" \
"${permmodel}" 

const="panasneg"
brain="happy"
modeldirname="${const}.${brain}"
permmodel="perm.free.${modeldirname}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV PANASNEG \
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
--seed 9000 \
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
