#!/bin/bash

wcen=WCEN_
gcen=GCEN_

#PANAS Positive
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASPOS \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panaspos.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panaspos.fear 

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASPOS \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panaspos.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panaspos.happy 

#Panas Negative
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASNEG \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panasneg.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panasneg.fear 

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PANASNEG \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output panasneg.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    panasneg.happy 

#Chronic average
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV CHRONICAVG \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output chavg.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    chavg.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV CHRONICAVG \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output chavg.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    chavg.happy

