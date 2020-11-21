
test<-na.omit(dat_bergplot[,c("key","homa_beta_18","homa_sens_18","class")])
colnames(test)[2:3]<-c("homa_beta","homa_sens")
test$pred<-NA
index_prediabetes<-which(test$class=="Prediabetes")
test$pred[index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test[index_prediabetes,], span=0.9) )
test$pred[-index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test[-index_prediabetes,], span=0.9) )

ggplot(test,aes(homa_sens,pred))+
  geom_line(aes(color=factor(class),linetype=factor(class)),size=1)+
  scale_linetype_manual(values=c("solid", "solid"))
test$time<-18
##############################################################################
test1<-na.omit(dat_bergplot[,c("key","homa_beta_12","homa_sens_12","class")])
colnames(test1)[2:3]<-c("homa_beta","homa_sens")
test1$pred<-NA
index_prediabetes<-which(test1$class=="Prediabetes")
test1$pred[index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test1[index_prediabetes,], span=0.9) )
test1$pred[-index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test1[-index_prediabetes,], span=0.9) )

ggplot(test1,aes(homa_sens,pred))+
  geom_line(aes(color=factor(class),linetype=factor(class)),size=1)+
  scale_linetype_manual(values=c("solid", "solid"))

test1$time<-12
###################################
test2<-na.omit(dat_bergplot[,c("key","homa_beta_6","homa_sens_6","class")])
colnames(test2)[2:3]<-c("homa_beta","homa_sens")
test2$pred<-NA
index_prediabetes<-which(test2$class=="Prediabetes")
test2$pred[index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test2[index_prediabetes,], span=0.9) )
test2$pred[-index_prediabetes]<-predict(loess(homa_beta ~ homa_sens, data=test2[-index_prediabetes,], span=0.9) )
test2$time<-6
ggplot(test2,aes(homa_sens,pred))+
  geom_line(aes(color=factor(class),linetype=factor(class)),size=1)+
  scale_linetype_manual(values=c("solid", "solid"))

dat_lineplot<-rbind(test,test1,test2)
ggplot(dat_lineplot,aes(homa_sens,pred))+
  geom_line(aes(color=factor(class),linetype=factor(time)))+
  scale_linetype_manual(values=c("solid", "dashed","dotted"))+
  scale_color_manual(values = c('chartreuse4', 'red'))+
  ylab("HOMA-B")+xlab("HOMA-S")+facet_wrap(.~class)+scale_size_manual(c(1:3))

############################################
png("6_12_18_year_lineplot_logbeta.png",height=5,width=8,units = 'in',res=300)
ggplot(dat_lineplot,aes(homa_sens,log(pred,base=10)))+
  #ggplot(dat_lineplot,aes(homa_sens,pred))+
  geom_line(aes(color=factor(class),linetype=factor(time)),size=0.9)+
  scale_linetype_manual(values=c("solid", "dashed","dotted"))+
  scale_color_manual(values = c('chartreuse4', 'red'))+
  ylab("log(HOMA-B)")+xlab("HOMA-S")+facet_wrap(.~class)
  #ylab("HOMA-B")+xlab("HOMA-S")+facet_wrap(.~class)
dev.off()