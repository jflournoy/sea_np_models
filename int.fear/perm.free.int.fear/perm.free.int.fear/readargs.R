cmdargs <- c("-m","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/int.fear/perm.free.int.fear/mask.nii.gz",
"--set1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt","--setlabels1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stress_psych-midpoint5.csv",
"--model","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/int.fear/perm.free.int.fear/permute_free_model.R",
"--output","perm.free.int.fear/perm.free.int.fear.",
debug.Rdata
"--slurmN", "60"
)
