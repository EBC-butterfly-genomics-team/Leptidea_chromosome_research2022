

library(ggplot2)
library(plotly)

setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS/REARRANGEMENTS/juv_intra_fusion")


alpha_par = 0.4
nudge_left <- -0.04
nudge_right <- 0.04
tick_size <- 2
line_size <- 0.2

col1 <- "#855723" #brown
col2 <- "#D57500" #orange
col3 <- "#668D3C" #green 
col4 <- "#DBCA69" #yellow 
col5 <- "#83929F" #blue
col6 <- "#8F3B1B" #red
#...

start_112 <- 5.92
end_111 <- 5.08
start_111 <- 4.92
end_103 <- 4.08
start_103 <- 3.92
end_DToL <- 3.08
start_DToL <- 2.92
end_105 <- 2.08
start_105 <- 1.92
end_115 <- 1.08

karyotype <- read.csv("juv_intra_fusion_karyotype.txt", sep="\t")
karyotype$assembly <- factor(karyotype$assembly, levels=c("P14502_115", "P14502_105", "DToL", "P14502_103", "P14502_111", "P14502_112"))


chr_112_111_5_24 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_24.coords.txt", sep = "\t")
chr_112_111_5_25 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_5_25.coords.txt", sep = "\t")
chr_112_111_28_17 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_28_17.coords.txt", sep = "\t")
chr_112_111_38_17 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_38_17.coords.txt", sep = "\t")
chr_112_111_42_41 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_42_41.coords.txt", sep = "\t")
chr_112_111_43_41 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_43_41.coords.txt", sep = "\t")

chr_111_103_24_5 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_24_5.coords.txt", sep = "\t")
chr_111_103_25_13 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_25_13.coords.txt", sep = "\t")
chr_111_103_17_8 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_8.coords.txt", sep = "\t")
chr_111_103_17_28 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_17_28.coords.txt", sep = "\t")
chr_111_103_41_8 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_8.coords.txt", sep = "\t")
chr_111_103_41_9 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_41_9.coords.txt", sep = "\t")

chr_103_DToL_5_21 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_5_21.coords.txt", sep = "\t")
chr_103_DToL_13_14 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_13_14.coords.txt", sep = "\t")
chr_103_DToL_8_7 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_7.coords.txt", sep = "\t")
chr_103_DToL_8_24 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_8_24.coords.txt", sep = "\t")
chr_103_DToL_28_23 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_28_23.coords.txt", sep = "\t")
chr_103_DToL_9_16 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_9_16.coords.txt", sep = "\t")

chr_DToL_105_21_12 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_21_12.coords.txt", sep = "\t")
chr_DToL_105_14_14 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_14_14.coords.txt", sep = "\t")
chr_DToL_105_24_19 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_24_19.coords.txt", sep = "\t")
chr_DToL_105_23_20 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt", sep = "\t")
chr_DToL_105_16_10 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_16_10.coords.txt", sep = "\t")
chr_DToL_105_7_17 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_7_17.coords.txt", sep = "\t")

chr_105_115_12_4 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_12_4.coords.txt", sep = "\t")
chr_105_115_14_26 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_14_26.coords.txt", sep = "\t")
chr_105_115_19_6 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_19_6.coords.txt", sep = "\t")
chr_105_115_10_5 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_10_5.coords.txt", sep = "\t")
chr_105_115_20_5 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_20_5.coords.txt", sep = "\t")
chr_105_115_17_8 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_17_8.coords.txt", sep = "\t")





ggplot(data = karyotype) + 
  geom_segment(aes(x=assembly, xend=assembly, y=start, yend=end), color=karyotype$colz, size=8, lineend="butt") +
  geom_point(aes(x=assembly, y=start), size=7.4, color=karyotype$colz) +
  geom_point(aes(x=assembly, y=end), size=7.4, color=karyotype$colz) +
  theme_classic() +
  theme(legend.position = "none",
        aspect.ratio=1/1.75,
        axis.title.y=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank(),
        panel.border =element_blank(),
        axis.line.y = element_blank(),
        axis.line.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) +
  geom_point(x=karyotype$assembly, y=karyotype$start, shape=21, size=7, color="grey30", fill="grey", alpha=0.5) +
  annotate("text", label=karyotype$chr, x=karyotype$assembly, y=karyotype$start, color="black") +
  ylab("") +
  xlab("") +
  expand_limits(y = c(-19000000, 19000000)) +
  annotate("text", label="~italic(L.~juvernica)~F", x=6, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~juvernica)~M", x=5, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Swe", x=4, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Ast", x=3, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Cat", x=2, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~reali)", x=1, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  coord_flip() +


##### 112-111 #####

geom_segment(data = chr_112_111_5_24, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_112_111_5_25, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_112_111_28_17, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_112_111_38_17, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_112_111_42_41, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col5, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_112_111_43_41, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col6, alpha=alpha_par, size=line_size) +
  
##### 111-103 #####

geom_segment(data = chr_111_103_24_5, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_111_103_25_13, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_111_103_17_8, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_111_103_17_28, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_111_103_41_8, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col6, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_111_103_41_9, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col5, alpha=alpha_par, size=line_size) +


##### 103-DToL #####

geom_segment(data = chr_103_DToL_5_21, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_103_DToL_13_14, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_103_DToL_8_7, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col6, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_103_DToL_8_24, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_103_DToL_28_23, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_103_DToL_9_16, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col5, alpha=alpha_par, size=line_size) +
  

##### DToL-105 #####
  
geom_segment(data = chr_DToL_105_21_12, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_14_14, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_24_19, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_23_20, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_16_10, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col5, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_7_17, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col6, alpha=alpha_par, size=line_size) +
  
  
##### 105-115 #####

geom_segment(data = chr_105_115_12_4, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_14_26, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_19_6, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_20_5, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col4, alpha=alpha_par, size=line_size) +
 
geom_segment(data = chr_105_115_10_5, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col5, alpha=alpha_par, size=line_size) +
 
geom_segment(data = chr_105_115_17_8, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col6, alpha=alpha_par, size=line_size) +
  
geom_segment(aes(x=assembly, xend=assembly, y=start, yend=end), color=karyotype$colz, size=8, lineend="butt") +
geom_point(aes(x=assembly, y=start), size=7.4, color=karyotype$colz) +
geom_point(aes(x=assembly, y=end), size=7.4, color=karyotype$colz) +
theme_classic() +
theme(legend.position = "none",
      aspect.ratio=1/1.75,
      axis.title.y=element_blank(),
      axis.text.y=element_blank(),
      axis.ticks.y=element_blank(),
      panel.border =element_blank(),
      axis.line.y = element_blank(),
      axis.line.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.text.x = element_blank()) +
geom_point(x=karyotype$assembly, y=karyotype$start, shape=21, size=7, color="grey30", fill="grey", alpha=0.5) +
annotate("text", label=karyotype$chr, x=karyotype$assembly, y=karyotype$start, color="black") +
ylab("") +
xlab("") +
expand_limits(y = c(-19000000, 19000000)) +
annotate("text", label="~italic(L.~juvernica)~F", x=6, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
annotate("text", label="~italic(L.~juvernica)~M", x=5, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
annotate("text", label="~italic(L.~sinapis)~Swe", x=4, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
annotate("text", label="~italic(L.~sinapis)~Ast", x=3, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
annotate("text", label="~italic(L.~sinapis)~Cat", x=2, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
annotate("text", label="~italic(L.~reali)", x=1, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
coord_flip()
  

  
ggsave(filename = ("juv_intra_fusion.png"), width = 15, height = 15, units = "in", dpi = 300, limitsize = F)
