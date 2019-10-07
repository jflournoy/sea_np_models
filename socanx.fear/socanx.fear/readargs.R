cmdargs <- c("-m","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/socanx.fear/mask.nii.gz",
"--set1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt","--setlabels1", "/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/depanxcov-midpoint5.csv",
"--model","/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/socanx.fear/model.R",
"--output","socanx.fear/socanx.fear.",
debug.Rdata
"--slurmN", "60"
)
