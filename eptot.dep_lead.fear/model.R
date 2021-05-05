# setwd("~/NewNeuropoint/eptot.gad_lead.fear/eptot.gad_lead.fear.amy_mask/")
# load('debug.Rdata')
# attach(designmat)
# v <- 1e5

packages <- list('permediatr')
loaded <- lapply(packages, library, character.only = TRUE)

processVoxel <- function(v) {
  NSIM <- 5000 #This necessary to allow for a small enough p-value that the 95% confidence interval is <.001
  NCPUS <- 24
  SEED <- 1034
  SEED2 <- 8828
  NOVAL <- 999
  
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
    BRAIN = BRAIN,
    PHQ9_TOT_lead = PHQ9_TOT_lead, 
    TIMECENTER = TIMECENTER, 
    WCEN_EPISODICTOT = WCEN_EPISODICTOT, 
    GCEN_EPISODICTOT = GCEN_EPISODICTOT, 
    GCEN_BRAIN = GCEN_BRAIN, 
    WCEN_BRAIN = WCEN_BRAIN, 
    idnum = idnum))
  
  ab_mod <- permediatr::lmemm_within(data = model_data,
                                     y.name = 'PHQ9_TOT_lead',
                                     x.name = 'WCEN_EPISODICTOT',
                                     m_b.name = 'WCEN_BRAIN',
                                     m_a.name = 'BRAIN',
                                     group.id = 'idnum',
                                     covariates.y=c('TIMECENTER', 'GCEN_BRAIN', 'GCEN_EPISODICTOT'),
                                     covariates.m=c('TIMECENTER', 'GCEN_EPISODICTOT'),
                                     random.a=T,
                                     random.b=T,
                                     random.c_p=F, optimizer = 'bobyqa')
  
  # smallest_p <- round(1-pnorm(3.29053), 7)
  # smallest_p + c(-1, 0, 1)*sqrt(smallest_p*(1-smallest_p)/1e4)
  # 2/5000 + c(-1, 0, 1)*sqrt(2/5000*(1-2/5000)/5000)
  # boottime <- system.time(ab_booted <- permediatr::boot_ab(ab_mod, nsim = 500, ncpus = 10, re.form = NA, type = 'parametric', seed = 1))
  # time_per_sim_s <- boottime['elapsed']/500*10
  # (total_time <- time_per_sim_s*100*dim(voxeldat)[2]/998/10/60/60)
  
  ab_booted <- permediatr::boot_ab(ab_mod, nsim = NSIM, ncpus = NCPUS, re.form = NA, type = 'parametric', seed = SEED)
  
  set.seed(SEED2)
  null_Z_sample_i <- sample(1:NSIM, size = min(2500, NSIM))
  
  retvals <- lapply(list('ab', 'a', 'b'), function(path){
    asum <- summary(ab_booted, which = path)
    est <- asum$est_bc
    est_p <- asum$p_estbc_neg_c_estbc
    if(est_p == 0){
      est_p <- 1/NSIM
    } else if(est_p == 1){
      est_p <- 1-1/NSIM
    }
    Z <- qnorm(est_p)
    if(path == 'ab'){
      null_dist <- -(ab_booted$ab_t - est)
    } else if(path == 'a'){
      null_dist <- -(apply(ab_booted$model.m$t, 1, mean) - est)
    } else if(path == 'b'){
      null_dist <- -(apply(ab_booted$model.y$t, 1, mean) - est)
    }
    null_Z <- qnorm(ecdf(null_dist)(null_dist) - .1/length(null_dist))
    null_Z_sample <- null_Z[null_Z_sample_i]
    names_null_Z_sample <- sprintf('t%04d', 1:length(null_Z_sample))
    vals_names <- paste0(path, '_', c('est', 'Z', 'null_Z_sample'))
    names(null_Z_sample) <- names_null_Z_sample
    vals <- list(est, Z, as.list(null_Z_sample))
    names(vals) <- vals_names
    return(vals)
  })

  return(unlist(retvals, recursive = FALSE))
}
