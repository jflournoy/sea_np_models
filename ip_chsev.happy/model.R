
packages <- list('nlme', 'clubSandwich', 'reghelper')
loaded <- lapply(packages, library, character.only = TRUE)

processVoxel <- function(v) {

  NOVAL <- 999
  retvals <- numeric()

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
    IP_CHRONICSEV = IP_CHRONICSEV, 
    TIMECENTER = TIMECENTER, 
    GCEN_BRAIN = GCEN_BRAIN, 
    WCEN_BRAIN = WCEN_BRAIN, 
    idnum = idnum))

  model_formula <- IP_CHRONICSEV ~ 1 + TIMECENTER + GCEN_BRAIN + WCEN_BRAIN

  # `method = REML` for unbiased estimate of variance parameters.
  # See: 
  # Luke, S. G. (2017). Evaluating significance in linear mixed-effects
  # models in R. Behavior Research Methods, 49(4), 1494–1502. 
  # https://doi.org/10.3758/s13428-016-0809-y
  e <- try(ip_chsev.happy <-
              nlme::lme(IP_CHRONICSEV ~ 1 + TIMECENTER + GCEN_BRAIN + WCEN_BRAIN,
                        random = ~1 | idnum, data = model_data, 
                        method = "REML", na.action=na.omit) )

  # Compute cluster corrected standard errors to account for, e.g., residual autocorrelation.
  # See coef_test help for description of "CR2"
  e_sandwich <- try(ip_chsev.happy_sw <- clubSandwich::coef_test(e, vcov = "CR2"))


  if (inherits(e, "try-error")){ 
    message("error thrown at voxel ", v)
    message(e);
    ip_chsev.happy <- NULL 
  }
  if (inherits(e_sandwich, "try-error")){
    message("can't compute corrected standard errors at voxel ", v)
    message(e_sandwich);
    ip_chsev.happy_sw <- NULL
  }
  name_col_correspondence <- c("-est" = "Value", "-t" = "t-value", "-p" = "p-value")
  name_col_correspondence_sw <- c("-t_sw" = "tstat", "-df_sw" = "df", "-p_satt_sw" = "p_Satt")
  if (!(is.null(ip_chsev.happy))) {
    coefs <- coef(summary(ip_chsev.happy))
    reg_retvals <- unlist(lapply(name_col_correspondence, function(colname){
      if(colname == name_col_correspondence[[3]]){
        return(1-coefs[, colname])
      } else {
        return(coefs[, colname])
      }
    }))
    names(reg_retvals) <- gsub("[\\(\\)]", "", gsub("(.*?)\\.(.*)", "\\2\\1", names(reg_retvals)))
    
    std_coefs <- coef(beta(ip_chsev.happy))
    std_reg_retvals <- std_coefs[, "Value"]
    names(std_reg_retvals) <- paste0(gsub("\\(*(.*?)\\)*\\.*z*$", "\\1", names(std_reg_retvals)), "-beta")
  } else {
    model_terms <- c("Intercept", attr(terms(model_formula), "term.labels"))
    reg_retvals <- rep(NOVAL, length(model_terms) * length(name_col_correspondence))
    names(reg_retvals) <- paste0(rep(model_terms, length(name_col_correspondence)), 
                                 rep(names(name_col_correspondence), each = length(model_terms)))
    std_reg_retvals <- rep(NOVAL, length(model_terms))
    names(std_reg_retvals) <- paste0(model_terms, "-beta")
  }
  if(!(is.null(ip_chsev.happy_sw))){
    coefs_sw <- ip_chsev.happy_sw
    reg_retvals_sw <- unlist(lapply(name_col_correspondence_sw, function(colname){
      if(colname == name_col_correspondence_sw[[3]]){
        rval <- 1-coefs_sw[, colname] 
      } else {
        rval <- coefs_sw[, colname]
      }
      names(rval) <- rownames(coefs_sw)
      return(rval)
    }))
    names(reg_retvals_sw) <- gsub("[\\(\\)]", "", gsub("(.*?)\\.(.*)", "\\2\\1", names(reg_retvals_sw)))
  } else {
    model_terms_sw <- c("Intercept", attr(terms(model_formula), "term.labels"))
    reg_retvals_sw <- rep(NOVAL, length(model_terms_sw) * length(name_col_correspondence_sw))
    names(reg_retvals_sw) <- paste0(rep(model_terms_sw, length(name_col_correspondence_sw)), 
                                    rep(names(name_col_correspondence_sw), each = length(model_terms_sw)))
  }
  retvals <- c(reg_retvals, std_reg_retvals, reg_retvals_sw)
  return(retvals)
}
