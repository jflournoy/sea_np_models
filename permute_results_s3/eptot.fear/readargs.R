
cmdargs <- c("-m","mask.nii.gz", "--set1", "../text_data/setfilenames_fearGTcalm.txt",
             "--setlabels1", "../text_data/stresscov-midpoint5.csv", 
             "--model", "permute_free_model.R",
             "--testvoxel", "1",
             "--output", "perm.free.eptot.fear/perm.free.eptot.fear",
             "--debugfile", "debug.Rdata",
             "--slurmN", "60",
             "--permute", "1000")

