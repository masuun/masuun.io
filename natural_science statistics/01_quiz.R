df <- tibble(death_cnt=0:4, teams=c(109, 65, 22, 3, 1)) %>% 
  mutate(nomarl = teams/sum(teams))
lmd <- sum(df$death_cnt*df$teams)/sum(df$teams)
df <- df %>% mutate(mdl = dpois(0:4,lmd))


df %>% ggplot()+
  geom_line(mapping = aes(x=death_cnt, y=nomarl))+
  geom_line(mapping = aes(x=death_cnt, y=mdl), colour="red")



df <- tibble(death_cnt=0:7, teams=c(74, 98, 90, 61, 21, 13, 7,1)) %>% 
  mutate(nomarl = teams/sum(teams))
lmd <- sum(df$death_cnt*df$teams)/sum(df$teams)
df <- df %>% mutate(mdl = dpois(0:7,lmd))
df %>% ggplot()+
  geom_line(mapping = aes(x=death_cnt, y=nomarl))+
  geom_line(mapping = aes(x=death_cnt, y=mdl), colour="red")

