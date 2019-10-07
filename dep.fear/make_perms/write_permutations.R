library(permute)

#This presumes you've arleady set up the target model
load('../dep.fear/debug.Rdata')
attach(designmat)
nperm <- 2000 #Make sure this number matches input to NeuroPointillist or is bigger

set.seed(622019)
ctrl.free <- how(within = Within(type = 'free'), nperm = nperm, blocks = idnum)
perm_set.free <- shuffleSet(n = idnum, control = ctrl.free)
saveRDS(perm_set.free, 'permutation_set-free.RDS')
