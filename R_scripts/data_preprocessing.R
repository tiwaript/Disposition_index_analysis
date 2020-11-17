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
