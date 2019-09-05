# #Uncomment to test
# load('debug.Rdata')
# attach(designmat)
# permutationNumber <- 1
# nperm <- 1000
# v=10000

packages <- list('nlme', 'clubSandwich', 'permute')
loaded <- lapply(packages, library, character.only = TRUE)

processVoxel <- function(v) {
  #This processVoxel function will produce the group map for 
  #a single permutation.
  #
  #Literature citations:
  #
  # Freedman, D., & Lane, D. (1983). A Nonstochastic Interpretation of Reported Significance Levels. Journal of Business & Economic Statistics, 1(4), 292–298. https://doi.org/10.2307/1391660
  # Winkler, A. M., Ridgway, G. R., Webster, M. A., Smith, S. M., & Nichols, T. E. (2014). Permutation inference for the general linear model. NeuroImage, 92, 381–397. https://doi.org/10.1016/j.neuroimage.2014.01.060
  # Winkler, A. M., Webster, M. A., Vidaurre, D., Nichols, T. E., & Smith, S. M. (2015). Multi-level block permutation. NeuroImage, 123, 253–268. https://doi.org/10.1016/j.neuroimage.2015.05.092
  
  # system.time({
  perm_set <- readRDS('permutation_set-free.RDS')
  this_perm <- perm_set[permutationNumber, ]
  # }) #.021
  
  if(v%%5e3 == 0){
    apercent <- sprintf("%3.0f%%", v/dim(voxeldat)[2]*100)
    status_message <- paste0(apercent, ": Voxel ", v, " of ", dim(voxeldat)[2], "...")
    message(status_message)
  }


  #system.time({
  BRAIN <- voxeldat[,v]
  # Usually this should be 999 for diagnostic purposes, but for practical reasons,
  # that is, to avoid having to reprocess the permutations after being written
  # I am setting to 0.
  NOVAL <- 0 
  retvals <- numeric()
  model_data <- data.frame(
    BRAIN = BRAIN, 
    TIMECENTER = TIMECENTER, 
    GCEN_EPISODICTOT = GCEN_EPISODICTOT, 
    WCEN_EPISODICTOT = WCEN_EPISODICTOT, 
    idnum = idnum)
  #}) #.002
  
  model_formula <- y_star ~ 1 + TIMECENTER + GCEN_EPISODICTOT + WCEN_EPISODICTOT
  
  # `method = REML` for unbiased estimate of variance parameters.
  # See: 
  # Luke, S. G. (2017). Evaluating significance in linear mixed-effects
  # models in R. Behavior Research Methods, 49(4), 1494–1502. 
  # https://doi.org/10.3758/s13428-016-0809-y
  
  #residualizing on the nuisance variables is recommended, see CITE
  #we then permute this residualized DV to get the statistic for 
  #this permutation
  
  # system.time({
  p <- try({
    eptot.fear.p <-
      nlme::lme(BRAIN ~ 1 + TIMECENTER + GCEN_EPISODICTOT,
                random = ~1 | idnum, data = model_data, 
                method = "REML", na.action=na.omit)
    epsilon_z <- resid(eptot.fear.p)
    P_j.epsilon_z <- epsilon_z[this_perm]
    Zy <- predict(eptot.fear.p, level = 1)
    model_data$y_star <- P_j.epsilon_z + Zy
  })
  # }) # .037
  
  # system.time({
  e <- try(eptot.fear <-
             nlme::lme(y_star ~ 1 + TIMECENTER + GCEN_EPISODICTOT + WCEN_EPISODICTOT,
                       random = ~1 | idnum, data = model_data, 
                       method = "REML", na.action=na.omit) )
  # }) #.043
  
  # Compute cluster corrected standard errors to account for, e.g., residual autocorrelation.
  # See coef_test help for description of "CR2"
  # system.time({
  e_sandwich <- try(eptot.fear_sw <- clubSandwich::coef_test(e, vcov = "CR2"))
  # }) #.047
  
  if (inherits(e, "try-error")){ 
    message("error thrown at voxel ", v)
    message(e);
    eptot.fear <- NULL 
  }
  if (inherits(e_sandwich, "try-error")){
    message("can't compute corrected standard errors at voxel ", v)
    message(e_sandwich);
    eptot.fear_sw <- NULL
  }
  
  #For the permutation testing we only need to save out the statistic of interest.
  #That is, just the z statistic converted from the t-stat from the two models.
  
  # system.time({
  # name_col_correspondence <- c("-t" = "t-value")
  # name_col_correspondence_sw <- c("-t_sw" = "tstat")
  if (!(is.null(eptot.fear))) {
    coefs <- coef(summary(eptot.fear))
    # reg_retvals <- unlist(lapply(name_col_correspondence, function(colname){
    #     return(coefs[, colname])
    # }))
    #convert to z-stat
    z_stats <- apply(coefs, 1, function(arow) qnorm(pt(arow['t-value'], arow['DF'])))
    names(z_stats) <- paste0("-z.", names(z_stats))
    reg_retvals <- c(z_stats)
    
    names(reg_retvals) <- gsub("[\\(\\)]", "", gsub("(.*?)\\.(.*)", "\\2\\1", names(reg_retvals)))

  } else {
    model_terms <- c("Intercept", attr(terms(model_formula), "term.labels"))
    reg_retvals <- rep(NOVAL, length(model_terms) * length(name_col_correspondence))
    # names(reg_retvals) <- paste0(rep(model_terms, length(name_col_correspondence)), 
    #                              rep(names(name_col_correspondence), each = length(model_terms)))
    names(reg_retvals) <- paste0(rep(model_terms, length(name_col_correspondence)), "-z")
  }
  if(!(is.null(eptot.fear_sw))){
    coefs_sw <- eptot.fear_sw
    # reg_retvals_sw <- unlist(lapply(name_col_correspondence_sw, function(colname){
    #   rval <- coefs_sw[, colname]
    #   names(rval) <- rownames(coefs_sw)
    #   return(rval)
    # }))
    #convert to z-stat
    z_stats_sw <- apply(coefs_sw, 1, function(arow) qnorm(pt(arow['tstat'], arow['df'])))
    names(z_stats_sw) <- paste0("-z_sw.", names(z_stats_sw))
    reg_retvals_sw <- c(z_stats_sw)
    
    names(reg_retvals_sw) <- gsub("[\\(\\)]", "", gsub("(.*?)\\.(.*)", "\\2\\1", names(reg_retvals_sw)))
  } else {
    model_terms_sw <- c("Intercept", attr(terms(model_formula), "term.labels"))
    reg_retvals_sw <- rep(NOVAL, length(model_terms_sw) * length(name_col_correspondence_sw))
    # names(reg_retvals_sw) <- paste0(rep(model_terms_sw, length(name_col_correspondence_sw)), 
    #                                 rep(names(name_col_correspondence_sw), each = length(model_terms_sw)))
    names(reg_retvals_sw) <- paste0(rep(model_terms, length(name_col_correspondence)), "-z_sw")
  }
  retvals <- c(reg_retvals, reg_retvals_sw)
  # }) #.015
  return(retvals[grepl('WCEN', names(retvals))])
}

# (timetime <- system.time({
# perms <- lapply(1:1000, function(p){
#   permutationNumber <<- p
#   aperm <- processVoxel(1e5)
# })
# }))
