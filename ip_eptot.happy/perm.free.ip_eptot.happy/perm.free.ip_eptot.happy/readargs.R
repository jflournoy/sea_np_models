cmdargs <- c("-m","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ip_eptot.happy/perm.free.ip_eptot.happy/mask.nii.gz",
"--set1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt","--setlabels1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stress_psych-midpoint5.csv",
"--model","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/ip_eptot.happy/perm.free.ip_eptot.happy/permute_free_model.R",
"--output","perm.free.ip_eptot.happy/perm.free.ip_eptot.happy.",
debug.Rdata
"--slurmN", "60"
)
