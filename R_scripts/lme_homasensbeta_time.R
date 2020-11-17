######## rate of change of homa sens , beta with time #########
require(lme4)
library(nlme)
##################################
####### linear mixed effect model #########
summary(lme(homasens~age*cgly_st_18yr,random=~1|key,
    data=na.omit(dat_lme_long[dat_lme_long$sex=="Female",c("key","homasens","age","cgly_st_18yr")])))
summary(lme(homasens~age*cgly_st_18yr,random=~1|key,
            data=na.omit(dat_lme_long[dat_lme_long$sex=="Male",c("key","homasens","age","cgly_st_18yr")])))

#### homa beta 
summary(lme(homabeta~age*cgly_st_18yr,random=~1|key,
            data=na.omit(dat_lme_long[dat_lme_long$sex=="Female",c("key","homabeta","age","cgly_st_18yr")])))
summary(lme(homabeta~age*cgly_st_18yr,random=~1|key,
            data=na.omit(dat_lme_long[dat_lme_long$sex=="Male",c("key","homabeta","age","cgly_st_18yr")])))

#### disposition index #####
summary(lme(dispindex~age*cgly_st_18yr,random=~1|key,
            data=na.omit(dat_lme_long[dat_lme_long$sex=="Female",c("key","dispindex","age","cgly_st_18yr")])))
summary(lme(dispindex~age*cgly_st_18yr,random=~1|key,
            data=na.omit(dat_lme_long[dat_lme_long$sex=="Male",c("key","dispindex","age","cgly_st_18yr")])))
####### linear model for comparison with LME model ########################

summary(lm(homabeta~age+sex+cgly_st_18yr,data=na.omit(dat_lme_long)))
summary(lm(homasens~age+sex+cgly_st_18yr,data=na.omit(dat_lme_long)))
summary(lm(dispindex~age+sex+cgly_st_18yr,data=na.omit(dat_lme_long)))
####### ###################################################################