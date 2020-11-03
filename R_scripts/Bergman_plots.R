### load library ####
require(ggplot2)
### homa beta vs homa sens 18 years  ############### smoothing ==GAM
ggplot(data = na.omit(dat_bergplot[, c("homa_sens_18","homa_beta_18","class")]), 
       aes(x = homa_sens_18,  y = homa_beta_18, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class),method="gam") + 
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
  geom_smooth(aes(group = class, color = class),method="gam") + 
  ggtitle("Bergman_plot(18years)") +xlim(c(0,250))+ylim(c(0,250))+
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
#############################################
### homa beta vs homa sens 12 years ####
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_12","homa_sens_12","class")]), 
       aes(x = homa_sens_12,  y = homa_beta_12, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class),method="gam") + 
  ggtitle("Bergman_plot(12years)") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )
### x, y limit 
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
######## 
ggplot(data = na.omit(dat_bergplot[, c("homa_beta_6","homa_sens_6","class")]), 
       aes(x = homa_sens_6,  y = homa_beta_6, color = class)) +
  geom_point(shape = 1, size = 2) + scale_color_manual(values = c('chartreuse4', 'red')) +
  geom_smooth(aes(group = class, color = class),method="gam") + 
  ggtitle("Bergman_plot (6 years)") +
  theme(plot.title = element_text(hjust = 0.5, face = "bold")) + 
  #xlab("log Homa sensitivity") +ylab("log Homa Beta") + 
  theme(
    legend.position = c(.95, .95),
    legend.justification = c("right", "top"),
    legend.box.just = "right",
    legend.margin = margin(6, 6, 6, 6)
  )