
cmdargs <- c("-m","mask.nii.gz", "--set1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt",
             "--setlabels1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv", 
             "--model", "model.R",
             "--testvoxel", "10000",
             "--output", "socanx_lead.happy/socanx_lead.happy.",
             "--debugfile", "debug.Rdata",
             "--slurmN", "60")

