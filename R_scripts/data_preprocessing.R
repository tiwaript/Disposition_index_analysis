require(foreign)
require(tidyr)
################################################################
dat_ihoma<-read.spss("./Data/PMNS PREDIABETES DATA_27JUNE2019.sav",to.data.frame = T,use.value.labels = T)
df_labels<-data.frame(attr(dat_ihoma,"variable.labels"))
###### data for bergman plot ###################################
dat_bergplot<-readRDS("./Data/data_bergman_plot.RDS")
##### data for linear mixed effect model #######################
dat_lme<-dat_ihoma[,c(1,3,141,14:16,112,114,134,127,117,131,113,115,130,125,78,11)]
colnames(dat_lme)[7:9]<-c("homasens_6","homasens_12","homasens_18")
colnames(dat_lme)[10:12]<-c("homabeta_6","homabeta_12","homabeta_18")
colnames(dat_lme)[13:15]<-c("dispindex_6","dispindex_12","dispindex_18")
colnames(dat_lme)[16:18]<-c("glucosef_6","glucosef_12","glucosef_18")
dat_lme_long<-reshape(dat_lme,varying = c("age_6","age_12","age_18",
                                          "homasens_6","homasens_12","homasens_18",
                                          "homabeta_6","homabeta_12","homabeta_18",
                                          "dispindex_6","dispindex_12","dispindex_18",
                                          "glucosef_6","glucosef_12","glucosef_18"),
                      direction = "long",idvar = "key",sep="_")
##### data for Pregnancy bergman plot #######
dat_indiaGDM<-read.spss("./Data/Serial Glucose_IndiaGDM_n 48.sav",
                       to.data.frame = T,use.value.labels = T)
dat_indiaGDM$insS_V1<-1/dat_indiaGDM$insf_v1
dat_indiaGDM$insS_V2<-1/dat_indiaGDM$insf_v2
dat_indiaGDM$insS_V3<-1/dat_indiaGDM$insf_v3
dat_indiaGDM$insR_V1<-(dat_indiaGDM$insf_v1- dat_indiaGDM$ins60_v1)/(dat_indiaGDM$fgluf_v1- dat_indiaGDM$glu60_v1)
dat_indiaGDM$insR_V2<-(dat_indiaGDM$insf_v2- dat_indiaGDM$ins60_v2)/(dat_indiaGDM$fgluf_v2- dat_indiaGDM$glu60_v2)
dat_indiaGDM$insR_V3<-(dat_indiaGDM$insf_v3- dat_indiaGDM$ins60_v3)/(dat_indiaGDM$fgluf_v3- dat_indiaGDM$glu60_v3)

dat_indiaGDM_long<-reshape(dat_indiaGDM, idvar = "en_no", varying = list(c(40:42), c(37:39),c(34:36),c(31:33),
                                                                         c(28:30)), direction="long",
                           v.names = c('insR','insS','DI','IGI','MatIndex'),sep="_")
dat_indiaGDM<-read.spss("./Data/Serial glucose_INDO-DANISH & IAEA-B12_n=248.sav",
                        to.data.frame = T,use.value.labels = T)
rownames(dat_indiaGDM)<-dat_indiaGDM[,1]
##### connvert to long 

dat_indiaGDM_long<-dat_indiaGDM[,c("en_no","HOMA_B_V1","HOMA_B_V2","HOMA_B_v3",
                                   "HOMA_S_V1", "HOMA_S_V2" ,"HOMA_S_v3",
                                   "fgluf_v1" ,"fgluf_v2","fgluf_v3",
                                   "insf_v1","insf_v2","insf_v3"
                                   )]
colnames(dat_indiaGDM_long)[1:7]<-c("en_no","HOMAB_V1","HOMAB_V2","HOMAB_v3",
                                 "HOMAS_V1", "HOMAS_V2" ,"HOMAS_v3")
dat_indiaGDM_long<-reshape(dat_indiaGDM, idvar = "en_no", varying = list(c(5,7,9), c(6,8,10),c(11:13),c(14:16)), direction="long",
        v.names = c('fgluf','finsf','HOMAB','HOMAS'),sep="_")
dat_indiaGDM_long<-reshape(dat_indiaGDM_long,varying =c("HOMAB_V1","HOMAB_V2","HOMAB_v3",
                                                        "HOMAS_V1", "HOMAS_V2" ,"HOMAS_v3",
                                                        "fgluf_v1" ,"fgluf_v2","fgluf_v3",
                                                        "insf_v1","insf_v2","insf_v3"),
                           direction = "long",idvar = "en_no",sep="_")
                           #v.names = c("HOMAB","HOMAS","fgluf","insf"))
##################################
tapply(dat_indiaGDM_long$HOMAB,dat_indiaGDM_long$time,median) 
## 1     2     3 
#82.35 96.15 94.25 
tapply(dat_indiaGDM_long$HOMAS,dat_indiaGDM_long$time,median)
##1      2      3 
##154.90 149.60 156.45 

######################## India-Danish_patCat data ###############
dat_indoDan<-read.spss("./Data/Combined Indodanish-Iaeab12-Lip_n=514.sav",to.data.frame = T,
                       use.value.labels = T)
dat_patcat<-read.spss("./Data/Catalano Data.sav",to.data.frame = T,use.value.labels = T)
dat_indoDan_long<-reshape(dat_indoDan, idvar = "key", 
                          varying = list(c(7,11,15), c(8,12,16)), 
                          direction="long",
                          v.names = c('HOMAB','HOMAS'),sep="_")
dat_indoDan$en_no[249:514]<-dat_indoDan$ID[249:514]
dat_indoDan_long<-dat_indoDan_long[,c(1:4,11:14)]

dat_patcat_long<-reshape(dat_patcat, idvar = "Sr.No", 
                         varying = list(c(4,6,8), c(5,7,9)), 
                         direction="long",
                         v.names = c('HOMAB','HOMAS'),sep="_")
dat_patcat_long$time<-gsub("1","Early Pregnancy",dat_patcat_long$time)
dat_patcat_long$time<-gsub("2","1",dat_patcat_long$time)
dat_patcat_long$time<-gsub("3","2",dat_patcat_long$time)
dat_patcat_long<-dat_patcat_long[,-c(1,4,5)]
dat_patcat_long$StudyCode<-rep("Patcat",nrow(dat_patcat_long))
##########################################################################
dat_PMNS<-read.spss("./Data/pmns original.sav",to.data.frame = T,use.value.labels = T)
dat_var_PMNS<-read.csv("./Data/PMNS_var_sel_modelling.csv",header = F)
colnames(dat_var_PMNS)[1]<-'var'
dat_PMNS_model<-dat_PMNS[,which(colnames(dat_PMNS) %in% dat_var_PMNS$V1)]

dat_PMNS_model<-merge(dispindex_coef,dat_PMNS_model,by=0)
dat_PMNS_model<-dat_PMNS_model[,-60] ## thick1
dat_PMNS_model<-dat_PMNS_model[,-70] ## cereb2
########################################################################
dat_fitfor2<-read.spss("./Data/FITFOR2_study_Pradeep.sav",use.value.labels = T,to.data.frame = T)
dat_fitfor_long<-reshape(dat_fitfor2[,c(1,8:13,14)], idvar = "rspnr", 
                          varying = list(c(2:4), c(5:7)), 
                          direction="long",
                          v.names = c('HOMAB','HOMAS'),sep="_")
dat_fitfor_long$StudyCode<-rep("Fitfor2",nrow(dat_fitfor_long))
colnames(dat_fitfor_long)[1]<-'ID'
dat_fitfor_long<-dat_fitfor_long[,c(1,2,6,3:5)]
dat_patcatindodanfit_long<-rbind(dat_patcatindodan_long,dat_fitfor_long)
######################################################################
dat_mexican<-read.spss("./Data/Mexican Study for Pradeep.sav",
                       to.data.frame = T,use.value.labels = T)

dat_mexican_long<-reshape(dat_mexican[,c(1,4:5,8:9,12:13,14)], idvar = "File", 
                         varying = list(c(2,4,6), c(3,5,7)), 
                         direction="long",
                         v.names = c('HOMAB','HOMAS'),sep="_")
dat_mexican_long$time<-factor(dat_mexican_long$time)
dat_mexican_long$StudyCode<-rep("Mexican",nrow(dat_mexican_long))
dat_mexican_long<-dat_mexican_long[,c(1,2,6,3:5)]
colnames(dat_mexican_long)[1]<-'key'
dat_patcatindodanfitmexi_long<-rbind(dat_patcatindodanfit_long,dat_mexican_long)
dat_patcatindodanfitmexi_long$StudyCode<-
  factor(dat_patcatindodanfitmexi_long$StudyCode,
         levels = c("Indian Cohort","Mexican","Danish Cohort", "Patcat", "Fitfor2" ))
index_noneurope<-which(dat_patcatindodanfitmexi_long$StudyCode %in% c("Indian Cohort","Mexican"))
index_ind<-which(dat_patcatindodanfitmexi_long$StudyCode=="Indian Cohort")
index_mexico<-which(dat_patcatindodanfitmexi_long$StudyCode=="Mexican")
dat_patcatindodanfitmexi_long$cohort<-NA
dat_patcatindodanfitmexi_long$cohort[-c(index_ind,index_mexico)]<-"Europe"
dat_patcatindodanfitmexi_long$cohort[index_ind]<-"Indian"
dat_patcatindodanfitmexi_long$cohort[index_mexico]<-"Mexican"
dat_patcatindodanfitmexi_long$cohort<-factor(dat_patcatindodanfitmexi_long$cohort,
                                             levels = c("Indian","Mexican","Europe"))
###################################
dat_danish<-dat_indoDan[dat_indoDan$StudyCode=="Danish Cohort",]
dat_india<-dat_indoDan[dat_indoDan$StudyCode=="Indian Cohort",]
################################
dat_LIP<-read.spss("./Data/LIP data for Pradeep n=266.sav",
                   to.data.frame = T,use.value.labels = T)
dat_LIP_long<-reshape(dat_LIP[,c(1,2,5,6,9,10,13,14)], idvar = "File", 
                            varying = list(c(3,5,7), c(4,6,8)), 
                            direction="long",
                            v.names = c('HOMAB','HOMAS'),sep="_")
dat_LIP_long$time<-factor(dat_LIP_long$time)
dat_LIP_long<-dat_LIP_long[,-6]
dat_India<-read.spss("./Data/Serial glucose_INDO-DANISH & IAEA-B12_n=248.sav",
                     to.data.frame = T,use.value.labels = T)
dat_IAEA<-dat_India[dat_India$Study_Code=="IAEA-B12",]
dat_IndiaGDM<-dat_India[dat_India$Study_Code=="INDO-DANISH",]
dat_Europe_long<-rbind(dat_patcat_long,dat_fitfor_long,dat_LIP_long)
dat_fitforLIP_long<-rbind(dat_fitfor_long,dat_LIP_long)
###################### z score data #######################
#### India #####################
dat_India_z<-read.spss("./Data/Z_score_data/INDO-DANISH & IAEA-B12_n=248_Pradeep.sav",
                       to.data.frame = T,use.value.labels = T)
dat_India_z_long<-reshape(dat_India_z[,c(1:4,17:22)], idvar = "File", 
                          varying = list(c(5:7), c(8:10)), 
                          direction="long",
                          v.names = c('HOMAB','HOMAS'),sep="_")
###### Mexico ###############
dat_mexican_z<-read.spss("./Data/Z_score_data/Mexican Study for Pradeep.sav",
                         to.data.frame = T, use.value.labels = T)
dat_mexican_z_long<-reshape(dat_mexican_z[,c(1,2,14:20)], idvar = "File", 
                          varying = list(c(4:6), c(7:9)), 
                          direction="long",
                          v.names = c('HOMAB','HOMAS'),sep="_")
dat_mexican_z_long$time<-factor(dat_mexican_z_long$time)
######## Danish data ############
dat_danish_z<-read.spss("./Data/Z_score_data/LIP data for Pradeep n=266.sav",
                        to.data.frame = T,use.value.labels = T)
dat_danish_z_long<-reshape(dat_danish_z[,c(1,2,15:20)], idvar = "ID", 
                            varying = list(c(3:5), c(6:8)), 
                            direction="long",
                            v.names = c('HOMAB','HOMAS'),sep="_")
dat_danish_z_long$time<-factor(dat_danish_z_long$time)
######## fitfor@####################
dat_fitfor2_z<-read.spss("./Data/Z_score_data/FITFOR2_study_Pradeep.sav",
                        to.data.frame = T,use.value.labels = T)
dat_fitfor2_z_long<-reshape(dat_fitfor2_z[,c(1,14,15:21)], idvar = "rspnr", 
                           varying = list(c(4:6), c(7:9)), 
                           direction="long",
                           v.names = c('HOMAB','HOMAS'),sep="_")
dat_fitfor2_z_long$time<-factor(dat_fitfor2_z_long$time)
####### patcat ###################
dat_patcat_z<-read.spss("./Data/Z_score_data/Catalano Data.sav",
                         to.data.frame = T,use.value.labels = T)
dat_patcat_z_long<-reshape(dat_patcat_z[,c(1:3,11,12,14,15)], idvar = "ID", 
                            varying = list(c(4:5), c(6:7)), 
                            direction="long",
                            v.names = c('HOMAB','HOMAS'),sep="_")
dat_patcat_z_long$time<-factor(dat_patcat_z_long$time)
dat_preg_meanmedian<-read.csv("Pregnancy_HOMABS_meanmedian_all_population.csv",header=T)
dat_preg_meanmedian_1<-read.csv("Pregnancy_HOMABS_meanmedian_indmexeur_patcat.csv",header=T)
dat_preg_meanmedian_1$Visit<-gsub("3","Late-pregnancy",dat_preg_meanmedian_1$Visit)
dat_preg_meanmedian_1$Visit<-gsub("2","Mid-pregnancy",dat_preg_meanmedian_1$Visit)
dat_preg_meanmedian_1$Visit<-gsub("1","Early-pregnancy",dat_preg_meanmedian_1$Visit)

dat_preg_meanmedian_1$Visit<-factor(dat_preg_meanmedian_1$Visit,
                                    levels = c("Pre-pregnancy","Early-pregnancy",
                                               "Mid-pregnancy","Late-pregnancy"))
                                                                           )