
cmdargs <- c("-m","mask.nii.gz", "--set1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt",
             "--setlabels1", "/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv", 
             "--model", "model.R",
             "-t", "10000",
             "--output", "eptot.fear/eptot.fear.",
             "--debugfile", "debug.Rdata",
             "--slurmN", "60")

