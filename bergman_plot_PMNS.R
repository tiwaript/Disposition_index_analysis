require(ggplot2)
################ 18years ##############
plot1<-ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_18,  y = homa_beta_18, color = class)) +
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(18years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")+theme(legend.position="none")
############### 18years gender wise ###
plot1<-ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_18,  y = homa_beta_18, color = class)) +facet_grid(sex~.)+
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(18years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")+theme(legend.position="none")
################ 12 years##############
plot2<-ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_12,  y = homa_beta_12, color = class)) + 
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(12 years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")+theme(legend.position="none")
################12 years gender wise ###########
ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_12,  y = homa_beta_12, color = class)) + facet_grid(sex~.)+
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(12 years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")+theme(legend.position="none")
################ 6 years #############
plot3<-ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_6,  y = homa_beta_6, color = class)) +
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(6 years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")+theme(legend.position="bottom")
################ 6 years gender wise ##############
ggplot(data = dat_bergplot[complete.cases(dat_bergplot),], aes(x = homa_sens_6,  y = homa_beta_6, color = class)) +facet_grid(sex~.)+
  geom_point()+scale_color_manual(values=c('chartreuse4','red'))+
  geom_smooth(aes(group=class),color="black")+ggtitle("Bergman_plot(6 years)")+
  theme(plot.title = element_text(hjust = 0.5,face="bold"))+xlab("Homa_sensitivity")+ylab("Homa Beta")
################################################
require(gridExtra)
png("BergmanPlotSmooth6_12_18years.png", width = 10, height = 8, units = 'in', res = 300)
grid.arrange(plot1, plot2, plot3,ncol=3)
dev.off()
################################# get legend ########################
get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}