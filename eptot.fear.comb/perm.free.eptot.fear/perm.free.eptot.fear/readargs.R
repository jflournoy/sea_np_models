cmdargs <- c("-m","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/eptot.fear.comb/perm.free.eptot.fear/mask.nii.gz",
"--set1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm_comb.txt","--setlabels1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv",
"--model","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/eptot.fear.comb/perm.free.eptot.fear/permute_free_model.R",
"--output","perm.free.eptot.fear/perm.free.eptot.fear.",
debug.Rdata
"--slurmN", "60"
)
