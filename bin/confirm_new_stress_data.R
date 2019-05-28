library(magrittr)
mri_files_fear <- readr::read_table('/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_fearGTcalm.txt', 
                                    col_names = FALSE)
mri_files_fear$ID <- gsub('.*/(\\d{4})/month(\\d{2})/.*', '\\1', mri_files_fear$X1)
mri_files_fear$TIME <- as.numeric(gsub('.*/(\\d{4})/month(\\d{2})/.*', '\\2', mri_files_fear$X1))

mri_files_happy <- readr::read_table('/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/setfilenames_happyGTcalm.txt', 
                                     col_names = FALSE)
mri_files_happy$ID <- gsub('.*/(\\d{4})/month(\\d{2})/.*', '\\1', mri_files_happy$X1)
mri_files_happy$TIME <- as.numeric(gsub('.*/(\\d{4})/month(\\d{2})/.*', '\\2', mri_files_happy$X1))

all(mri_files_fear$ID == mri_files_happy$ID)
all(mri_files_fear$TIME == mri_files_happy$TIME)

unique(mri_files_fear$TIME)

newstress <- readr::read_csv('~/UCLA_FINAL_LONG.csv')
unique(newstress$TIME)
internalizing <- readr::read_csv('~/SEAGranularityData.csv')
internalizing <- internalizing[,c('ID', 'Month', 'internalizing')]


newstress$TIMECENTER <- newstress$TIME - 5

newstress_mri <- merge(mri_files_fear[, c('ID','TIME')], newstress,
                       by = c('ID', 'TIME'), all.x = TRUE, all.y = FALSE)
newstress_mri <- newstress_mri[order(newstress_mri$ID, newstress_mri$TIME), ]
dim(newstress_mri)
dim(mri_files_fear)

all(mri_files_fear$ID == newstress_mri$ID)
all(mri_files_fear$TIME == newstress_mri$TIME)

newstress_mri$idnum <- newstress_mri$ID

readr::write_csv(
  newstress_mri,
  '/net/holynfs01/srv/export/mclaughlin/share_root/stressdevlab/stress_pipeline/Group/FaceReactivity/NewNeuropoint/datafiles/stresscov-midpoint5.csv')
