
cmdargs <- c("-m","mask.nii.gz", "--set1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm_comb.txt",
             "--setlabels1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv", 
             "--model", "model.R",
             "--testvoxel", "10000",
             "--output", "eptot.happy/eptot.happy.",
             "--debugfile", "debug.Rdata",
             "--slurmN", "60")

