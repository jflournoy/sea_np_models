#!/bin/bash

wcen=WCEN_
gcen=GCEN_

#episodic AUC
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV EPISODICTOT \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output eptot.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    eptot.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV EPISODICTOT \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output eptot.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    eptot.happy

#Chronic severe
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV CHRONICSEV \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output chsev.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    chsev.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV CHRONICSEV \
    --DV BRAIN \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv \
    --output chsev.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    chsev.happy

#Depression
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PHQ9_TOT \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output dep.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    dep.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PHQ9_TOT \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output dep.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    dep.happy

#GAD
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV GAD7_TOT \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output gad.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    gad.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV GAD7_TOT \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output gad.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    gad.happy

#Social Anxiety
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV LSA_ANX \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output socanx.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    socanx.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV LSA_ANX \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output socanx.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    --overwrite \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    socanx.happy
