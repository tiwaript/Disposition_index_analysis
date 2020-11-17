### load library ####
require(ggplot2)
### homa beta vs homa sens 18 years  ############### 
ggplot(data = na.omit(dat_bergplot[, c("homa_sens_18","homa_beta_18","class")]), 
       aes(x = homa_sens_18,  y = homa_beta_18, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class)) + 
  ggtitle("Bergman_plot(18years)") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
### 18 years x, y limit #######
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_18","homa_sens_18","class")]), 
       aes(x = homa_sens_18,  y = homa_beta_18, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class)) + 
  ggtitle("Bergman_plot(18years)") +xlim(c(0,250))+ylim(c(0,250))+
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
#####################################################################
### homa beta vs homa sens 12 years ####
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_12","homa_sens_12","class")]), 
       aes(x = homa_sens_12,  y = homa_beta_12, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class)) + 
  ggtitle("Bergman_plot(12years)") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
### 12 years  x, y limit #############
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_12","homa_sens_12","class")]), 
       aes(x = homa_sens_12,  y = homa_beta_12, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class),method="gam") + 
  ggtitle("Bergman_plot(12years)") + xlim(c(0,500))+ylim(c(0,200))+
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
###################################################################################
#### homa beta vs homa sens 6 years ####
### span need to be finailized 
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_6","homa_sens_6","class")]), 
       aes(x = homa_sens_6,  y = homa_beta_6, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class),span=1) + 
  ggtitle("Bergman_plot (6 years)") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
####### x,y limit 
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_6","homa_sens_6","class")]), 
       aes(x = homa_sens_6,  y = homa_beta_6, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class)) + 
  ggtitle("Bergman_plot (6 years)") +
  xlim(c(0,1000))+ylim(c(0,150))
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
########################################################
### matsuda index and insulogenic index wareham 18 years 
  ggplot(data = na.omit(dat_bergplot[, c("mat_ind_18","ins_index_ware18","class")]), 
         aes(x = mat_ind_18,  y = ins_index_ware18, color = class)) +
    geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
    geom_smooth(aes(group = class, color = class)) + 
    ggtitle("Bergman_plot (18 years)") +
    #xlim(c(0,1000))+ylim(c(0,150))
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
    #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
    theme(
      legend.position = c(.95, .95),
      legend.justification = c("right", "top"),
      legend.box.just = "right",
      legend.margin = margin(6, 6, 6, 6)
    )
#### x, y limit 
  ggplot(data = na.omit(dat_bergplot[, c("mat_ind_18","ins_index_ware18","class")]), 
         aes(x = mat_ind_18,  y = ins_index_ware18, color = class)) +
    geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
    geom_smooth(aes(group = class, color = class)) + 
    ggtitle("Bergman_plot (18 years)") +
    xlim(c(0,40))+ylim(c(0,2))
    theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
    #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
    theme(
      legend.position = c(.95, .95),
      legend.justification = c("right", "top"),
      legend.box.just = "right",
      legend.margin = margin(6, 6, 6, 6)
    )
####### male and female separate ############
    ggplot(data = na.omit(dat_bergplot[, c("mat_ind_18","ins_index_ware18","class","sex")]), 
           aes(x = mat_ind_18,  y = ins_index_ware18, color = class)) +
      geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
      geom_smooth(aes(group = class, color = class),span=1) + facet_grid(.~sex)+
      ggtitle("Bergman_plot (18 years)") +
      xlim(c(0,40))+ylim(c(0,2))
    theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
      #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
      theme(
        legend.position = c(.95, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6)
      )
######################################################################
#### mat ind 6 vs insulogenic index 6########################################
    ggplot(data = na.omit(dat_bergplot[, c("mat_ind_6","ins_index_ware6","class")]), 
           aes(x = mat_ind_6,  y = ins_index_ware6, color = class)) +
      geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
      geom_smooth(aes(group = class, color = class)) + 
      ggtitle("Bergman_plot (6 years)") +
      #xlim(c(0,1000))+ylim(c(0,150))
      theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
      #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
      theme(
        legend.position = c(.95, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6)
      )
    #### x, y limit 
    ggplot(data = na.omit(dat_bergplot[, c("mat_ind_6","ins_index_ware6","class")]), 
           aes(x = mat_ind_6,  y = ins_index_ware6, color = class)) +
      geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
      geom_smooth(aes(group = class, color = class)) + 
      ggtitle("Bergman_plot (18 years)") +
      #xlim(c(0,40))+ylim(c(0,2))
    theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
      #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
      theme(
        legend.position = c(.95, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6)
      )
    ####### male and female separate ############
    ggplot(data = na.omit(dat_bergplot[, c("mat_ind_18","ins_index_ware18","class","sex")]), 
           aes(x = mat_ind_18,  y = ins_index_ware18, color = class)) +
      geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
      geom_smooth(aes(group = class, color = class),span=1) + facet_grid(.~sex)+
      ggtitle("Bergman_plot (18 years)") +
      xlim(c(0,40))+ylim(c(0,2))
    theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
      #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
      theme(
        legend.position = c(.95, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6)
      )
######################India gdm plot ##################################################
png("Bergman plot IndiaGDM pregnancy visits.png",height=6,width=6,units = 'in',res=300)
        ggplot(data = na.omit(dat_indiaGDM_long), 
           aes(x = HOMAS,  y = HOMAB, color = time)) +
      geom_point(shape = 1, size = 2)  +
      geom_smooth(aes(group = time, color = time),span=1) + 
      ggtitle("Bergman Plot NGT Pregnancy Visits") +
      xlab("HOMA-S")+ylab("HOMA-B")+
      theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
      #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
      theme(
        legend.position = c(.95, .95),
        legend.justification = c("right", "top"),
        legend.box.just = "right",
        legend.margin = margin(6, 6, 6, 6)
      )    
dev.off()
