require(foreign)
dat_ihoma<-read.spss("./Data/PMNS PREDIABETES DATA_27JUNE2019.sav",to.data.frame = T,use.value.labels = T)
df_labels<-data.frame(attr(dat_ihoma,"variable.labels"))
###### data for bergman plot ########
dat_bergplot<-readRDS("./Data/data_bergman_plot.RDS")
