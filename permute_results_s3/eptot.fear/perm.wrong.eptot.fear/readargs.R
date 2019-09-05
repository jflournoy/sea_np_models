cmdargs <- c("-m","/home/jflournoy/Documents/NeuroDebian/code/permute_example_sea_s3/eptot.fear/mask.nii.gz",
"--set1", "/home/jflournoy/Documents/NeuroDebian/code/permute_example_sea_s3/text_data/setfilenames_fearGTcalm.txt","--setlabels1", "/home/jflournoy/Documents/NeuroDebian/code/permute_example_sea_s3/text_data/stresscov-midpoint5.csv",
"--model","/home/jflournoy/Documents/NeuroDebian/code/permute_example_sea_s3/eptot.fear/permute_free_model.R",
"--output","perm.free.eptot.fear/perm.free.eptot.fear",
debug.Rdata
"--slurmN", "60"
)
