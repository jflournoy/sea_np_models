#!/bin/bash
#usage: /users/jflournoy/otherhome/code/sea_px_np_models/generate_np_dirs.R
#       [-h] --IV IV --DV DV --mask MASK --set1 SET1 --setlabels SETLABELS
#       [SETLABELS ...] --output OUTPUT [--overwrite] [--win_pre WIN_PRE]
#       [--bw_pre BW_PRE] [--id_var ID_VAR] [--time_var TIME_VAR]
#       [--covariates COVARIATES [COVARIATES ...]] [--testvoxel TESTVOXEL]
#       [--jobs JOBS] [--permute] [--permuteN PERMUTEN]
#       [--permuteType PERMUTETYPE] [--debugdata DEBUGDATA] [--seed SEED]
#       [--permutationRDS PERMUTATIONRDS]
#       base_dir model_name
#
#Create a neuropoint model directory to be run
#
#positional arguments:
#  base_dir              This is where the model directory will be created
#  model_name            Name of the model
#
#optional arguments:
#  -h, --help            show this help message and exit
#  --IV IV               IV variable name. Use "BRAIN" to specify BOLD contrast
#                        as the IV
#  --DV DV               DV variable name. Use "BRAIN" to specify BOLD contrast
#                        as the DV
#  --mask MASK           Path to mask (will be copied to model directory)
#  --set1 SET1           Path to input set of imaging files
#  --setlabels SETLABELS [SETLABELS ...]
#                        Paths to imaging file labels (and covariates)
#  --output OUTPUT       String will become "string/string." prefix to NP
#                        output
#  --overwrite           Overwrite existing model files?
#  --win_pre WIN_PRE     Within-person IV name prefix
#  --bw_pre BW_PRE       Between-person IV name prefix
#  --id_var ID_VAR       Column name of id variable
#  --time_var TIME_VAR   Column name of time variable
#  --covariates COVARIATES [COVARIATES ...]
#                        Column names of covariates
#  --testvoxel TESTVOXEL
#                        Test voxel number
#  --jobs JOBS           Number of jobs
#  --permute             Are we building permutation models?
#  --permuteN PERMUTEN   Number of permutations
#  --permuteType PERMUTETYPE
#                        within or between
#  --debugdata DEBUGDATA
#                        Path to debug data to use in generating permutation
#                        matrix
#  --seed SEED           Seed for permutation randomization.
#  --permutationRDS PERMUTATIONRDS
#                        Name of RDS file containing permutation matrix

wcen="WCEN_"
gcen="GCEN_"
mask="mask.nii.gz"
idvar="idnum"
timevar="TIMECENTER"
set1="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt"
setlabels="/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stress_psych-midpoint5.csv"
IV="BRAIN"

# #GAD_LEAD ~ EPISODICTOT + BRAIN
# IV="BRAIN"
# DV="GAD7_TOT_lead"
# covariates="TIMECENTER WCEN_EPISODICTOT GCEN_EPISODICTOT"
# y="gad_lead"
# m="fear"
# x="eptot"
# output="${y}.${x}.${m}"
# Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
#     --IV "${IV}" \
#     --DV "${DV}" \
#     --mask "${mask}" \
#     --set1 "${set1}" \
#     --setlabels "${setlabels}" \
#     --output  "${output}" \
#     --win_pre "${wcen}" \
#     --bw_pre "${gcen}" \
#     --id_var "${idvar}" \
#     --time_var "${timevar}" \
#     --covariates "${covariates}" \
#     --jobs 120 \
#     --testvoxel 10000 \
#     /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
#     "${output}"

#GAD_LEAD ~ CHSEV + BRAIN
DV="GAD7_TOT_lead"
covariates="TIMECENTER WCEN_CHRONICSEV GCEN_CHRONICSEV"
y="gad_lead"
m="fear"
x="chsev"
output="${y}.${x}.${m}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV "${IV}" \
    --DV "${DV}" \
    --mask "${mask}" \
    --set1 "${set1}" \
    --setlabels "${setlabels}" \
    --output  "${output}" \
    --win_pre "${wcen}" \
    --bw_pre "${gcen}" \
    --id_var "${idvar}" \
    --time_var "${timevar}" \
    --covariates "${covariates}" \
    --jobs 120 \
    --testvoxel 10000 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    "${output}"

#SOCANX_LEAD ~ EPISODICTOT + BRAIN
DV="LSA_ANX_lead"
covariates="TIMECENTER WCEN_EPISODICTOT GCEN_EPISODICTOT"
y="socanx_lead"
m="fear"
x="eptot"
output="${y}.${x}.${m}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV "${IV}" \
    --DV "${DV}" \
    --mask "${mask}" \
    --set1 "${set1}" \
    --setlabels "${setlabels}" \
    --output  "${output}" \
    --win_pre "${wcen}" \
    --bw_pre "${gcen}" \
    --id_var "${idvar}" \
    --time_var "${timevar}" \
    --covariates "${covariates}" \
    --jobs 120 \
    --testvoxel 10000 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    "${output}"

#SOCANX_LEAD ~ CHSEV + BRAIN
DV="LSA_ANX_lead"
covariates="TIMECENTER WCEN_CHRONICSEV GCEN_CHRONICSEV"
y="socanx_lead"
m="fear"
x="chsev"
output="${y}.${x}.${m}"
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV "${IV}" \
    --DV "${DV}" \
    --mask "${mask}" \
    --set1 "${set1}" \
    --setlabels "${setlabels}" \
    --output  "${output}" \
    --win_pre "${wcen}" \
    --bw_pre "${gcen}" \
    --id_var "${idvar}" \
    --time_var "${timevar}" \
    --covariates "${covariates}" \
    --jobs 120 \
    --testvoxel 10000 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    "${output}"
