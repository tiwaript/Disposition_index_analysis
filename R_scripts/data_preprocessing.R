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
                         varying = list(c(6,8), c(7,9)), 
                         direction="long",
                         v.names = c('HOMAB','HOMAS'),sep="_")
dat_patcat_long$StudyCode<-rep("Patcat",nrow(dat_patcat_long))