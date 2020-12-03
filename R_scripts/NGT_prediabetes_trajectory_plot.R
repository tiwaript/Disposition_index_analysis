##### trajectory plot ##########
require(ggplot2)
png("Trajectory_plot_full_data.png",height=6,width=8,units = 'in',res=300)
ggplot(data = dat_bergplot, aes(x = log(homa_sens_6,base = 10),  y = log(homa_beta_6,base=10)))+
  geom_point(shape = 1, size = 2,col="grey59") + 
  #geom_smooth(color = "black")+
  geom_segment( x =log(247.5,base=10), y =log(54.3,base=10), xend = log(151,base=10), 
                yend = log(80,base=10), linetype=11,#color="chartreuse4",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(151,base=10), y =log(80,base=10), xend = log(82.5,base=10), 
                yend = log(102.9,base=10), linetype=11,#color="chartreuse4",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  
  geom_segment( x =log(237,base=10), y =log(50.5,base=10), xend = log(143.1,base=10), 
                yend = log(75,base=10), linetype=11,#color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(142.4,base=10), y =log(75.3,base=10), xend = log(68.6,base=10), 
                yend = log(97.9,base=10), linetype=11,#color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  
  geom_point(aes(x=log(237.1,base=10),y=log(50.5,base=10)),col="red",shape=16,size=6)+
  geom_point(aes(x=log(142.4,base=10),y=log(75.3,base=10)),col="red",shape=17,size=6)+
  geom_point(aes(x=log(68.6,base=10),y=log(97.9,base=10)),col="red",shape=18,size=6)+
  geom_point(aes(x=log(248,base=10),y=log(54,base=10)),col="chartreuse4",shape=16,size=6)+
  geom_point(aes(x=log(150.6,base=10),y=log(80.8,base=10)),col="chartreuse4",shape=17,size=6)+
  geom_point(aes(x=log(82.5,base=10),y=log(102.9,base=10)),col="chartreuse4",shape=18,size=6)+
  ylim(c(1.68,2.05))+xlim(c(1.8,2.43))+
  xlab("log(HOMA-S,base=10)")+ylab("log(HOMA-B,base=10)")+
  theme(
    axis.title.x = element_text(face="bold"),
    axis.title.y = element_text(face="bold")
  )
  dev.off()
##############################################################################
  p<-ggplot(df,aes(x = log(homa_sens,base = 10),  y = log(homabeta,base=10),
                shape= factor(Time),color=factor(Class)))+ 
           geom_point(size=6)+
  scale_shape_manual(values = c(16, 17, 18) )+
  scale_color_manual(values = c("chartreuse4","red"))
library(cowplot)
library(grid)
library(gridExtra) 
legend <- get_legend(p)
grid.newpage()
grid.draw(legend) 
#####################################################################################
ggplot(data = dat_indiaGDM, aes(x =log(HOMA_S_V1,base=10) ,  y =log(HOMA_B_V1,base=10 )))+
  geom_point(shape = 1, size = 2,col="grey59") + 
  geom_point(aes(x=log(154.90,base=10),y=log(82.35,10)),col="black",shape=16,size=6)+
  geom_point(aes(x=log(149.60,10),y=log(96.15,10)),col="black",shape=17,size=6)+
  geom_point(aes(x=log(156.45,10),y=log(94.25,10)),col="black",shape=18,size=6)+
  xlim(c(2,2.3))+ylim(c(1.8,2.1))
  #geom_smooth(color = "black")+
  geom_segment( x =log(247.5,base=10), y =log(54.3,base=10), xend = log(151,base=10), 
                yend = log(80,base=10), linetype=11,#color="chartreuse4",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(151,base=10), y =log(80,base=10), xend = log(82.5,base=10), 
                yend = log(102.9,base=10), linetype=11,#color="chartreuse4",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  
  geom_segment( x =log(237,base=10), y =log(50.5,base=10), xend = log(143.1,base=10), 
                yend = log(75,base=10), linetype=11,#color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(142.4,base=10), y =log(75.3,base=10), xend = log(68.6,base=10), 
                yend = log(97.9,base=10), linetype=11,#color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  
  geom_point(aes(x=154.90,y=82.35,col="red",shape=16,size=6))+
  geom_point(aes(x=log(142.4,base=10),y=log(75.3,base=10)),col="red",shape=17,size=6)+
  geom_point(aes(x=log(68.6,base=10),y=log(97.9,base=10)),col="red",shape=18,size=6)+
  geom_point(aes(x=log(248,base=10),y=log(54,base=10)),col="chartreuse4",shape=16,size=6)+
  geom_point(aes(x=log(150.6,base=10),y=log(80.8,base=10)),col="chartreuse4",shape=17,size=6)+
  geom_point(aes(x=log(82.5,base=10),y=log(102.9,base=10)),col="chartreuse4",shape=18,size=6)+
  # ylim(c(1.68,2.05))+xlim(c(1.8,2.43))+
  xlab("log(HOMA-S,base=10)")+ylab("log(HOMA-B,base=10)")+
  theme(
    axis.title.x = element_text(face="bold"),
    axis.title.y = element_text(face="bold")
  )

