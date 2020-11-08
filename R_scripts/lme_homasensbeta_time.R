######## plot of homa sens , beta with time #########
ggplot(na.omit(dat_lme_long), aes(x=age, y=homasens,col=cgly_st_18yr)) +
   geom_point()
  geom_line(aes(y=predict(fm2), group=Subject, size="Subjects")) +
  geom_line(data=newdat, aes(y=predict(fm2, level=0, newdata=newdat), size="Population")) +
  scale_size_manual(name="Predictions", values=c("Subjects"=0.5, "Population"=3)) +
  theme_bw(base_size=22) 
require(lme4)
lmer(homabeta~age+(1|key)+sex+cgly_st_18yr,data=dat_lme_long)
library(nlme)
summary(lme(homabeta~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))

summary(lme(homasens~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))
summary(lme(dispindex~age+sex+cgly_st_18yr,random=~1|key,data=na.omit(dat_lme_long)))