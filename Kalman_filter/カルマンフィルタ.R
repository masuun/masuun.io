set.seed(10)
# 10点サンプリング
x <- rnorm(10)
# 11点目のサンプリング
x1 <- rnorm(1)

# 描画用のためのx軸
x_point <- seq(-1,2.5,0.001)
# 測定値の確率密度関数のデータ
dat1 <- 
  x_point%>%  
  as_tibble() %>% 
  mutate(likelihood=dnorm(value,0,1), label="true")
# サンプリングで得られる尤度関数
dat2 <- x_point%>%  as_tibble() %>% 
  mutate(likelihood=dnorm(value,mean(x),1/length(x))) %>% 
  mutate(label="x1-xnまでのデータの尤度")
# サンプリングで得られる尤度関数
dat3 <-x_point%>%  as_tibble() %>% 
  mutate(likelihood=dnorm(value,mean(x1),1/length(x1))) %>% 
  mutate(label="xn+1のデータの尤度")
# サンプリングで得られる尤度関数
dat4 <-x_point%>%  as_tibble() %>% 
  mutate(likelihood=dnorm(value,mean(c(x1,x)),1/length(c(x1,x)))) %>% 
  mutate(label="xn+1までのデータの尤度")

dat <- bind_rows(dat1, dat2, dat3, dat4)

ggplot(dat %>% filter(label !="true"))+geom_line(aes(x=value,y=likelihood, colour=label))+
  labs(title="Fig1", x="μ")



