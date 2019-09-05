#!/bin/bash

wcen=WCEN_
gcen=GCEN_

#PANAS Positive
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASPOS_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panaspos_lead.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panaspos_lead.fear 

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASPOS_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panaspos_lead.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panaspos_lead.happy 

#Panas Negative
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASNEG_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panasneg_lead.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panasneg_lead.fear 

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASNEG_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panasneg_lead.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panasneg_lead.happy 

