
cmdargs <- c("-m","mask.nii.gz", "--set1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt",
             "--setlabels1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv", 
             "--model", "model.R",
             "--testvoxel", "10000",
             "--output", "panaspos.fear/panaspos.fear.",
             "--debugfile", "debug.Rdata",
             "--slurmN", "60")

