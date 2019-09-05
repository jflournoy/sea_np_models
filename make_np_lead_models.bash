#!/bin/bash

wcen=WCEN_
gcen=GCEN_

#Depression
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PHQ9_TOT_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output dep_lead.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    dep_lead.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV PHQ9_TOT_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output dep_lead.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    dep_lead.happy

#GAD
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV GAD7_TOT_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output gad_lead.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    gad_lead.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV GAD7_TOT_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output gad_lead.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    gad_lead.happy

#Social Anxiety
Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV LSA_ANX_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output socanx_lead.fear \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    socanx_lead.fear

Rscript ~/otherhome/code/sea_px_np_models/generate_np_dirs.R \
    --IV BRAIN \
    --DV LSA_ANX_lead \
    --mask mask.nii.gz \
    --set1 /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt \
    --setlabels /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv \
    --output socanx_lead.happy \
    --win_pre $wcen \
    --bw_pre $gcen \
    --id_var idnum \
    --covariates TIMECENTER \
    --jobs 60 \
    /mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ \
    socanx_lead.happy
