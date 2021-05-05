cmdargs <- c("-m","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/chavg.happy.comb/perm.free.chavg.happy/mask.nii.gz",
"--set1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm_comb.txt","--setlabels1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv",
"--model","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/chavg.happy.comb/perm.free.chavg.happy/permute_free_model.R",
"--output","perm.free.chavg.happy/perm.free.chavg.happy.",
debug.Rdata
"--slurmN", "60"
)
