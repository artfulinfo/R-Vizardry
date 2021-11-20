library(readr)
library(ggplot2)
library(ggrepel)
library(extrafont)
library(scales)
library(hms)

hp1head <- read_csv("datablog/R/HP1 Newcomers.csv", 
  col_types = cols(Date = col_datetime(format = "%d/%m/%Y %H:%M"), 
  Time = col_time(format = "%H:%M:%S")))

head(hp1head)

loadfonts(device = "win")

ggplot(data=hp1head, aes(x=Date, y=Time)) +
  geom_step(aes(color=Runner))+
  geom_point(aes(color=Runner))+
  ggtitle("Battle of the HP1 Newcomers")+
  scale_color_manual(values=c("#40e6ac", "#9a00ed"))+
  theme(text=element_text(size=11,  family="mono"),
        plot.title = element_text(size=16,face = "bold"),
        axis.title=element_text(face="bold",size=10))+
  scale_y_time(labels = label_time(format = '%k:%M'))
