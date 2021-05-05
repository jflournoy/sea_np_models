#!/bin/bash

set1happy="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt"
labels="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stress_psych-midpoint5.csv"
mask="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/mask.nii.gz"
wcen="WCEN_"
gcen="GCEN_"
idvar="idnum"
covariates="TIMECENTER"
jobs="60"
modelsbasedir="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/"

#Interpersonal eptot

const="ip_eptot"
brain="happy"
modeldirname="${const}.${brain}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV IP_EPISODICTOT \
--mask "${mask}" \
--set1 "${set1happy}" \
--setlabels "${labels}" \
--output "${basemodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
"${modelsbasedir}/" \
"${basemodel}"

#Interpersonal chsev

const="ip_chsev"
brain="happy"
modeldirname="${const}.${brain}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV IP_CHRONICSEV \
--mask "${mask}" \
--set1 "${set1happy}" \
--setlabels "${labels}" \
--output "${basemodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
"${modelsbasedir}/" \
"${basemodel}"

#Interpersonal chavg

const="ip_chavg"
brain="happy"
modeldirname="${const}.${brain}"
basemodel="${modeldirname}"

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
--IV BRAIN \
--DV IP_CHRONICAVG \
--mask "${mask}" \
--set1 "${set1happy}" \
--setlabels "${labels}" \
--output "${basemodel}" \
--win_pre "${wcen}" \
--bw_pre "${gcen}" \
--id_var "${idvar}" \
--covariates "${covariates}" \
--jobs "${jobs}" \
"${modelsbasedir}/" \
"${basemodel}"
