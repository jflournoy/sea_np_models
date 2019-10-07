#Uncomment to test
load('../dep.fear/debug.Rdata')
attach(designmat)
permutationNumber <- 1
nperm <- 1000
v=10000

# # Uncomment to test function
# permutationNumber <- 1
# permutationRDS <- 'permutation_set-free.RDS'
# targetDV <- 'WCEN_BRAIN'
# formula <- PHQ9_TOT ~ 1 + TIMECENTER + GCEN_BRAIN + WCEN_BRAIN
# random <- ~1 | idnum
# data <- model_data
# lmeOpts <- list(method = "REML", na.action=na.omit)
# sandwichOpts <- list()
# z_sw = TRUE
# vcov = 'CR2'

#' lme.permutation
#'
#' This function permutes the data according to one row of a user supplied
#' permutation matrix and estimates the association between the independent
#' variable and the target dependent variable. This implements the Freedman-Lane
#' procedures (Freedman and Lane, 1983) to account for covariates properly.
#'
#' Freedman, D., & Lane, D. (1983). A Nonstochastic Interpretation of Reported
#' Significance Levels. Journal of Business & Economic Statistics, 1(4),
#' 292–298. https://doi.org/10.2307/1391660
#'
#' To learn more about developing appropriate permutation matrices for complex
#' designs, see:
#'
#' Winkler, A. M., Ridgway, G. R., Webster, M. A., Smith, S. M., & Nichols, T.
#' E. (2014). Permutation inference for the general linear model. NeuroImage,
#' 92, 381–397. https://doi.org/10.1016/j.neuroimage.2014.01.060
#'
#' Winkler, A. M., Webster, M. A., Vidaurre, D., Nichols, T. E., & Smith, S. M.
#' (2015). Multi-level block permutation. NeuroImage, 123, 253–268.
#' https://doi.org/10.1016/j.neuroimage.2015.05.092
#'
#' @param permutationNumber An index specifying the row of the permutation
#'   matrix to use. Neuropoint supplies this variable named
#'   \code{permutationNumber} which should be passed to this argument unless the
#'   user wishes to do something else.
#' @param permutationRDS The path to an RDS file that contains a permutation
#'   matrix. This matrix should be P x N, where P is at least equal to the
#'   number of permutations, and N is the number of rows in the design matrix.
#' @param targetDV A string that is the name of the dependent variable of
#'   interest.
#' @param z_sw Logical indicating whether to return Z based on cluster corrected
#'   standard errors and Satterthwaite correction for degrees of freedom.
#'   Defaults to \code{TRUE}.
#' @param formula A fixed-effects formula that \code{\link[nlme]{lme}}
#'   understands.
#' @param random A random-effects formula that \code{\link[nlme]{lme}}
#'   understands.
#' @param data The data frame appropriate for \code{\link[nlme]{lme}}.
#' @param lmeOpts Named list of any additional arguments are passed to
#'   \code{\link[nlme]{lme}}.
#' @param sandwichOpts Named list of any additional arguments are passed to
#'   \code{\link[clubSandwich]{coef_test}}.
#'
#' @return A list with two elements, the first of which, \code{model}, is an
#'   object of class "lme" representing the linear mixed-effects model fit, and
#'   the second of which, \code{Z}, is the Z statistic for the null hypothesis
#'   test for the target dependent variable named in \code{targetDV}.
#' @export
#'
#' @examples
lme.permutation <- function(permutationNumber, permutationRDS, targetDV, z_sw = TRUE, vcov = 'CR2', formula, random, data, lmeOpts = list(), sandwichOpts = list()){
  require(clubSandwich)
  require(nlme)

  permutationMatrix <- readRDS(permutationRDS)
  if(dim(permutationMatrix)[2] != dim(data)[1]){
    stop(sprintf('Permutation vector is not the same length as data.\nLength of permutations: %d; length of data: %d.', 
                 dim(permutationMatrix)[2], dim(data)[1]))
  }
  ithPermutation <- permutationMatrix[permutationNumber, ]
  residsFormula <- update(formula, as.formula(paste0('. ~ . -', targetDV)))
  ystarFormula <- update(formula, as.formula(paste0('y_star ~ .')))
  
  p <- try({
    residsModel <- do.call(nlme::lme, c(list(fixed = residsFormula, random = random, data = data), lmeOpts))
    epsilon_z <- resid(residsModel)
    P_j.epsilon_z <- epsilon_z[ithPermutation]
    Zy <- predict(residsModel, level = 1)
    data$y_star <- P_j.epsilon_z + Zy
    residsModel
  })
    
  e <- try(permutationModel <- do.call(nlme::lme, c(list(fixed = ystarFormula, random = random, data = data), lmeOpts)))
  
  if(inherits(p, "try-error") | inherits(e, "try-error")){
    returnObject <- list(model = NULL, Z = NULL)
  } else {
    if(z_sw){
      eSandwich <- try(permutationModelSW <- do.call(clubSandwich::coef_test, c(list(obj = permutationModel, vcov = vcov), sandwichOpts)))
      if(inherits(eSandwich, "try-error")){
        returnObject <- list(model = NULL, Z = NULL)
      } else {
        Z <- qnorm(pt(permutationModelSW[targetDV, 'tstat'], 
                      permutationModelSW[targetDV, 'df']))
        returnObject <- list(model = permutationModelSW, Z = Z)
      }
    } else {
      coefs <- coef(summary(permutationModel))
      Z <- qnorm(pt(coefs[targetDV, 't-value'], coefs[targetDV, 'DF']))
      returnObject <- list(model = permutationModel, Z = Z)
    }
  }
  return(returnObject)
}

packages <- list('nlme', 'clubSandwich', 'permute')
loaded <- lapply(packages, library, character.only = TRUE)

processVoxel <- function(v) {
  #This processVoxel function will produce the group map for 
  #a single permutation.

  if(v%%5e3 == 0){
    apercent <- sprintf("%3.0f%%", v/dim(voxeldat)[2]*100)
    status_message <- paste0(apercent, ": Voxel ", v, " of ", dim(voxeldat)[2], "...")
    message(status_message)
  }
  
  #system.time({
  BRAIN <- voxeldat[,v]
  NOVAL <- 0
  Z <- numeric()
  brain_df <- data.frame(BRAIN, idnum) #the id variable is defined in the setlabels file
  
  # Compute Within-person Mean of brain data
  win_mean <- aggregate(brain_df, by = list(idnum), FUN = mean)[,1:2]
  colnames(win_mean) <- c("idnum", "WIN_BRAIN_MEAN")
  brain_df <- merge(brain_df, win_mean, by="idnum")
  
  grandmean <- mean(win_mean$WIN_BRAIN_MEAN)
  
  brain_df[, "GCEN_BRAIN"] <- brain_df$WIN_BRAIN_MEAN - grandmean
  brain_df[, "WCEN_BRAIN"] <- BRAIN - brain_df$WIN_BRAIN_MEAN
  
  model_data <- data.frame(
    PHQ9_TOT = PHQ9_TOT, 
    TIMECENTER = TIMECENTER, 
    GCEN_BRAIN = brain_df[, "GCEN_BRAIN"], 
    WCEN_BRAIN = brain_df[, "WCEN_BRAIN"], 
    idnum = idnum)

  # `method = REML` for unbiased estimate of variance parameters.
  # See: 
  # Luke, S. G. (2017). Evaluating significance in linear mixed-effects
  # models in R. Behavior Research Methods, 49(4), 1494–1502. 
  # https://doi.org/10.3758/s13428-016-0809-y
  
  permuteModel <- lme.permutation(permutationNumber = permutationNumber, 
                                  permutationRDS = 'permutation_set-free.RDS',
                                  targetDV = 'WCEN_BRAIN',
                                  z_sw = TRUE, vcov = 'CR2',
                                  formula = PHQ9_TOT ~ 1 + TIMECENTER + GCEN_BRAIN + WCEN_BRAIN,
                                  random = ~1 | idnum,
                                  data = model_data,
                                  lmeOpts = list(method = "REML", na.action=na.omit))
  if(is.null(permuteModel$Z)){
    Z <- NOVAL
  }
  names(Z) <- 'WCEN_BRAIN-z_sw'
  return(Z)
}

# (timetime <- system.time({
# perms <- lapply(1:1000, function(p){
#   permutationNumber <<- p
#   aperm <- processVoxel(1e5)
# })
# }))
