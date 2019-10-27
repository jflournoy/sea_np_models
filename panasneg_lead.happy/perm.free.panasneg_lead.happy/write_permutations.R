
library(permute)

message('Loading data...')
#This presumes you've arleady set up the target model
load('/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint//panasneg_lead.happy/panasneg_lead.happy/debug.Rdata')
attach(designmat)
nperm <- 1000 #Make sure this number matches input to NeuroPointillist or is bigger
v <- 1 #to get example brain data



  BRAIN <- voxeldat[,v]
  brain_df <- data.frame(BRAIN, idnum) #the id variable is defined in the setlabels file
  
  # Compute Within-person Mean of brain data
  win_mean <- aggregate(brain_df, by = list(idnum), FUN = mean)[,1:2]
  colnames(win_mean) <- c("idnum", "WIN_BRAIN_MEAN")
  brain_df <- merge(brain_df, win_mean, by="idnum")
  
  grandmean <- mean(win_mean$WIN_BRAIN_MEAN)
  
  brain_df[, "GCEN_BRAIN"] <- brain_df$WIN_BRAIN_MEAN - grandmean
  brain_df[, "WCEN_BRAIN"] <- BRAIN - brain_df$WIN_BRAIN_MEAN
  
  # attach to these new variables
  GCEN_BRAIN <- brain_df[, "GCEN_BRAIN"]
  WCEN_BRAIN <- brain_df[, "WCEN_BRAIN"]
  
  model_data <- na.omit(data.frame(
    PANASNEG_lead = PANASNEG_lead, 
    TIMECENTER = TIMECENTER, 
    GCEN_BRAIN = GCEN_BRAIN, 
    WCEN_BRAIN = WCEN_BRAIN, 
    idnum = idnum))

set.seed(9002)
message('Generating ', nperm, ' permutations...')
ctrl.free <- how(within = Within(type = 'free'), nperm = nperm, blocks = model_data$idnum)
perm_set.free <- shuffleSet(n = model_data$idnum, control = ctrl.free)
permpath <- file.path('/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint//panasneg_lead.happy//perm.free.panasneg_lead.happy', 'permute_free.RDS')
message('Saving permutations to ', permpath)
saveRDS(perm_set.free, permpath)
