rm(list=ls())
library(tidyverse)
#-------------------------------------------
# 関数定義
#-------------------------------------------
# 状態方程式(x_{t-1}->x_tへのマップ；恒等写像)
f <- function(x_pre){x_pre}
# 観測方程式(x_{t}->ypred_tへのマップ；恒等写像)
g <- function(x_now){x_now}
# カルマンフィルタ((y_t, ypred_t) -> x_tへのマップ)
K_fil <- function(x_now, dy, K_gain, V_v){x_now + K_gain*dy}
# prediction and filtering
ssm <- function(y, x_pre, Vxpre, V_w, V_v){
  #--------------
  # prediction
  #--------------
  x_now  <- f(x_pre)
  y_pred <- g(x_now)
  #--------------
  # 変数定義
  #--------------  
  dy      <- y-y_pred
  Vypre   <- Vxpre + V_w
  V_dy    <- Vypre + V_v
  K_gain  <- Vypre/V_dy
  #--------------
  # filtering
  #--------------
  x_fil <- K_fil(x_now, dy, K_gain, V_v)
  Vxpre_fil<- (1- K_gain )*Vypre
  #--------------
  # save result
  #--------------
  res <- tibble(x_now, y_pred, y, x_fil, K_gain, Vxpre, Vxpre_fil, Vypre,V_dy)
  return(res)
}
# predictions and filtering
do_fitting <- function(y, x0, Vx0, Vwv){
  # 出力先確保
  Vxpre_fil <- vector(mode = "double", length = length(y))
  x_fil     <- vector(mode = "double", length = length(y))
  y_pred    <- vector(mode = "double", length = length(y))
  x_now     <- vector(mode = "double", length = length(y)) 
  
  # 初期値
  x_pre <- x0;Vxpre <- Vx0;res <- tibble()
  for (i in seq_along(y)) {
    #--------------
    # prediction and filtering
    #--------------
    res_tmp <- ssm(y[i], x_pre, Vxpre, Vwv[1],Vwv[2])
    res <- bind_rows(res, res_tmp)
    #--------------
    # 入力値の更新
    #--------------
    x_pre <- res$x_fil[i]
    Vxpre <- res$Vxpre_fil[i]
  }
  #--------------
  # 尤度計算
  #--------------
  obj_value <- 
    res %>% 
    mutate(log_lklhd = log(V_dy) + (y-y_pred)^2/V_dy ) %>% 
    summarise(obj_value=1/2*sum(log_lklhd)) %>% .$obj_value
   res <- list(res, "obj_value"=obj_value)
  return(res)
}

#-------------------------------------
# MAIN 処理
#-------------------------------------
# Nile river
y     <- Nile
setwd("~/Desktop/状態空間モデル/")
df <- read_csv("./UKdriversKSI.txt") %>% 
  mutate(yyyy=seq(as.Date("1969-01-01"), as.Date("1984-12-01"), by = "month")) 
 colnames(df)[1] <- ("cnt") 
y <- log(df$cnt)

# 最適化
opt_res <- 
  optim(  function(Vwv){do_fitting(y, 0, 1, Vwv)[["obj_value"]]}
        , par=c(10,10)
        , method = "L-BFGS-B" 
        , lower=c(1,1)
)
res <- do_fitting(y, 0, 1, opt_res$par)

year=start(y)[1]:end(y)[1]
ggplot()+
  geom_line(data=res[[1]],aes(x=year, y=y))+
  geom_line(data=res[[1]],aes(x=year, y=x_fil), colour="red")+
  geom_ribbon(  data=res[[1]]
                , aes( x    = year
                       ,ymin = x_fil-1.97*sqrt(Vxpre_fil)
                       ,ymax = x_fil+1.97*sqrt(Vxpre_fil))
                ,alpha=0.2)
