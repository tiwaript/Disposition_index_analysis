##### trajectory plot ##########
require(ggplot2)
ggplot(data = dat_bergplot, aes(x = log(homa_sens_6,base = 10),  y = log(homa_beta_6,base=10)))+
  geom_point(shape = 1, size = 2,col="grey59") + 
  #geom_smooth(color = "black")+
  geom_segment( x =log(247.5,base=10), y =log(54.3,base=10), xend = log(151,base=10), 
                yend = log(80,base=10), linetype=11,
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(151,base=10), y =log(80,base=10), xend = log(82.5,base=10), 
                yend = log(102.9,base=10), linetype=11,
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  
  geom_segment( x =log(237,base=10), y =log(50.5,base=10), xend = log(143,base=10), 
                yend = log(75.3,base=10), linetype=11,color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_segment( x =log(142.4,base=10), y =log(75.3,base=10), xend = log(68.6,base=10), 
                yend = log(97.9,base=10), linetype=11,color="red",
                lineend = "round",size=1,arrow = arrow(length = unit(0.09, "inches")))+
  geom_point(aes(x=log(237.1,base=10),y=log(50.5,base=10)),col="red",shape=16,size=5.5)+
  geom_point(aes(x=log(142.4,base=10),y=log(75.3,base=10)),col="red",shape=17,size=5.5)+
  geom_point(aes(x=log(68.6,base=10),y=log(97.9,base=10)),col="red",shape=18,size=5.5)+
  geom_point(aes(x=log(248,base=10),y=log(54,base=10)),col="chartreuse4",shape=16,size=5.5)+
  geom_point(aes(x=log(150.6,base=10),y=log(80.8,base=10)),col="chartreuse4",shape=17,size=5.5)+
  geom_point(aes(x=log(82.5,base=10),y=log(102.9,base=10)),col="chartreuse4",shape=18,size=5.5)+
  ylim(c(1.68,2.05))+xlim(c(1.8,2.43))+
  xlab("log(HOMA-S,base=10)")+
  geom_segment( x =log(247.5,base=10), y =log(54.3,base=10), xend = log(150.4,base=10), 
                yend = log(80.8,base=10), linetype=5,
                lineend = "round",size=1,arrow = arrow(length = unit(0.1, "inches")))

, # See available arrow types in example above linejoin = "round", size = 2, arrow = arrow(length = unit(0.3, "inches")), colour = "#EC7014" # Also accepts "red", "blue' etc ) 

