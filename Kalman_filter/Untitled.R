library(tidyverse)
library(KFAS)
library(ggplot2)


set.seed(2);n=1500
df <- tibble(t=1:n, y=cumsum(rnorm(n)), x=cumsum(rnorm(n)))
ggplot(df,mapping = aes(x=t) )+
  geom_line(mapping = aes( y=y), colour="red")+
  geom_line(mapping = aes( y=x), colour="blue")
ggplot(df)+
  geom_point(mapping = aes( y=y,x=x))
lm(formula = y~x, data = df) %>% summary
# 目的変数
target <- df$y
# 説明変数
x <- df$x

# ローカルレベルモデル + 回帰
## 観測方程式, 状態方程式の定義
build_trend <- SSModel(
  H = NA,
  target ~
    SSMtrend(degree = 1, Q = c(list(NA))) +
    SSMregression(~x,Q=0)
  #SSMseasonal(period = 7, sea.type = "dummy", Q=NA)
)
## 分散パラメ-タ推定とFiltering とSmoothing
# 最尤法で分散パラメータを推定10,10,10は初期値
fit <- fitSSM(build_trend, inits = c( 0, 0, 0))
# filtering and smoothing
fil_smth <- KFS(fit$model)
# 結果
## 結果を整理
res_df <-
  data.frame(
    time = select(df,!!yyyymmdd)[[1]],
    y = target,
    smooth_level  = fil_smth$alphahat[, "level"] %>% c(),
    smooth_x = fil_smth$alphahat[, "x"] %>% c()
  ) %>%
  as_tibble()
res_df %>% head()


## 可視化
#ggplot()+
#  geom_line(data = res_df, mapping=aes(x = time, y = smooth_level  ), colour="red" ) +
#  geom_line(data = res_df, mapping=aes(x = time, y = y  ) )+
#  geom_line(data = res_df, mapping=aes(x = time, y = smooth_x +smooth_level  ),colour="blue")
#