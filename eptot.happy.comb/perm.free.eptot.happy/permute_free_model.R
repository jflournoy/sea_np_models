
packages <- list('nlme', 'clubSandwich', 'reghelper')
loaded <- lapply(packages, library, character.only = TRUE)

processVoxel <- function(v) {

  NOVAL <- 999
  retvals <- numeric()

  permutationRDS = '/mnt/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint//eptot.happy.comb//perm.free.eptot.happy/permute_free.RDS'
  targetDV = 'WCEN_BRAIN'
  formula = EPISODICTOT ~ 1 + TIMECENTER + GCEN_BRAIN + WCEN_BRAIN

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
    EPISODICTOT = EPISODICTOT, 
    TIMECENTER = TIMECENTER, 
    GCEN_BRAIN = GCEN_BRAIN, 
    WCEN_BRAIN = WCEN_BRAIN, 
    idnum = idnum))

  if(v%%5e3 == 0){
    apercent <- sprintf("%3.0f%%", v/dim(voxeldat)[2]*100)
                     status_message <- paste0(apercent, ": Voxel ", v, " of ", dim(voxeldat)[2], "...")
                     message(status_message)
  }

  # `method = REML` for unbiased estimate of variance parameters.
  # See: 
  # Luke, S. G. (2017). Evaluating significance in linear mixed-effects
  # models in R. Behavior Research Methods, 49(4), 1494–1502. 
  # https://doi.org/10.3758/s13428-016-0809-y
  

  permuteModel <- neuropointillist::npointLmePermutation(permutationNumber = permutationNumber, 
                                                         permutationRDS = permutationRDS,
                                                         targetDV = targetDV,
                                                         z_sw = TRUE, vcov = 'CR2',
                                                         formula = formula,
                                                         random = ~1 | idnum,
                                                         data = model_data,
                                                         lmeOpts = list(method = 'REML', na.action=na.omit))
  if(is.null(permuteModel$Z)){
    Z <- NOVAL
  } else {
    Z <- permuteModel$Z
  }
  names(Z) <- paste0(targetDV,'-z_sw')
  return(Z)
}
