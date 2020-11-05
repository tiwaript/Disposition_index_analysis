require(lme4)
lmer(homabeta~age+(1|key)+sex+cgly_st_18yr,data=dat_lme_long)
library(nlme)
summary(lme(homabeta~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))

summary(lme(homasens~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))
summary(lme(dispindex~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))