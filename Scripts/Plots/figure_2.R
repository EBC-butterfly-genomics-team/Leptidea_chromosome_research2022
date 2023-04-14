
library(ggplot2)
library(ggpattern)
library(ggpubr)
library(cowplot)


setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS")

ff <- read.csv("fission_fusion_counts.txt", sep = "\t")

name_size <- 4
text_size <- 3
mya_size <- 3
light_grey <- "grey"
dark_grey <- "grey50"
node_grey <- "grey30"
fusion_col <- "firebrick3"
fission_col <- "blue"
line_size <- 1.5
node_size <- 3
just <- 0.5
just_up <- 0.5
just_down <- 0.5

ggplot() +
  theme_void() +
  annotate("segment", y=4, yend=4, x=0, xend=3.5, size=line_size, color = light_grey) +
  annotate("segment", y=3, yend=3, x=1.45, xend=3.5, size=line_size, color = dark_grey) +
  annotate("segment", y=2, yend=2, x=1.65, xend=3.5, size=line_size, color = dark_grey) +
  annotate("segment", y=1, yend=1, x=1.65, xend=3.5, size=line_size, color = dark_grey) +
  
  annotate("segment", y=3.125, yend=4, x=0, xend=0, size=line_size, lineend="round", color=light_grey) +
  annotate("segment", y=2.25, yend=3.125, x=0, xend=0, size=line_size, lineend="round", color=light_grey) +
  annotate("segment", y=1.5, yend=2.25, x=1.45, xend=1.45, size=line_size, lineend="round", color = dark_grey) +
  annotate("segment", y=2.25, yend=3, x=1.45, xend=1.45, size=line_size, lineend="round", color = dark_grey) +
  annotate("segment", y=1, yend=2, x=1.65, xend=1.65, size=line_size, lineend="round", color = dark_grey) +
  
  annotate("segment", y=1.5, yend=1.5, x=1.45, xend=1.65, size=line_size, color=dark_grey) +
  annotate("segment", y=2.25, yend=2.25, x=0, xend=1.45, size=line_size, color=light_grey) +
  annotate("segment", y=3.125, yend=3.125, x=-1, xend=0, size=line_size, color=light_grey) +
  
  geom_point(aes(x=0, y=3.125), colour=light_grey, size = node_size) +
  geom_point(aes(x=1.45, y=2.25), colour="grey50", size = node_size) +
  geom_point(aes(x=1.65, y=1.5), colour="grey50", size = node_size) +

  
  annotate("text", label="  2.5 - 3.6 Mya", y=3.125, x=0, size=mya_size, hjust=0) +
  annotate("text", label="  1 - 2 Mya", y=2.25, x=1.45, size=mya_size, hjust=0) +
  annotate("text", label="  1 - 1.8 Mya", y=1.5, x=1.65, size=mya_size, hjust=0) +
  
  annotate("text", label="L. juvernica", fontface= "italic", y=4, x=3.6, size=name_size, hjust=0) +
  annotate("text", label="L. reali", fontface= "italic", y=3, x=3.6, size=name_size, hjust=0) +
  annotate("text", label="~italic(L.~sinapis)~(Swe)", y=2, x=3.6, size=name_size, hjust=0, parse=TRUE) +
  annotate("text", label="~italic(L.~sinapis)~(Cat)", y=1, x=3.6, size=name_size, hjust=0, parse=TRUE) +
  annotate("text", label="", y=1, x=5, size=text_size, hjust=0, parse=TRUE) +
  
  
  annotate("text", label="Outgroup breakpoints: 44 (6)", fontface= "italic", y=4.1, x=0.1, size=text_size, hjust=0) +
  annotate("text", label="Ingroup breakpoints: 51", fontface= "italic", y=2.35, x=0.1, size=text_size, hjust=0) +
  
  annotate("text", label="20 (2)", y=3.15, x=(1.45+3.5)/2, size=text_size, hjust=just, vjust=just_up, color = fusion_col) +
  annotate("text", label="6", y=2.85, x=(1.45+3.5)/2, size=text_size, hjust=just, vjust=just_down, color = fission_col) +
  
  annotate("text", label="11 (2)", y=2.15, x=(1.65+3.5)/2, size=text_size, hjust=just, vjust=just_up, color = fusion_col) +
  annotate("text", label="0", y=1.85, x=(1.65+3.5)/2, size=text_size, hjust=just, vjust=just_down, color = fission_col) +

  annotate("text", label="2", y=1.15, x=(1.65+3.5)/2, size=text_size, hjust=just, vjust=just_up, color = fusion_col) +
  annotate("text", label="14 (6)", y=0.85, x=(1.65+3.5)/2, size=text_size, hjust=just, vjust=just_down, color = fission_col) +
  
  annotate("text", label="5", y=1.65, x=(1.45+1.65)/2, size=text_size, hjust=just, vjust=just_up, color = fusion_col) +
  annotate("text", label="0", y=1.35, x=(1.45+1.65)/2, size=text_size, hjust=just, vjust=just_down, color = fission_col) +

  theme(aspect.ratio=1/2.5)

  ggsave(filename = ("Figure_2.jpeg"), width = 174, height = 70, units = "mm", dpi = 600, limitsize = F)
  
