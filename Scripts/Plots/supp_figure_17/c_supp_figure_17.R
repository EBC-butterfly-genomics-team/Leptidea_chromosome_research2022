
library(ggplot2)
library(plotly)

setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS")

alpha_par = 0.4
nudge_left <- -0.04
nudge_right <- 0.04
tick_size <- 2
line_size <- 0.2

col1 <- "#493829"
col2 <- "#668D3C"
col3 <- "#8F3B1B"
col4 <- "#D57500"

start_103 <- 5.92
end_104 <- 5.08
start_104 <- 4.92
end_DToL <- 4.08
start_DToL <- 3.92
end_105 <- 3.08
start_105 <- 2.92
end_115 <- 2.08
start_115 <- 1.92
end_111 <- 1.08


karyotype <- read.csv("sin_intra_fusion_karyotype.txt", sep="\t")
karyotype$assembly <- factor(karyotype$assembly, levels=c("P14502_111", "P14502_115", "P14502_105", "DToL", "P14502_104", "P14502_103"))

chr_103_104_19_3 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_19_3.coords.txt", sep = "\t")
chr_103_104_25_3 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_25_3.coords.txt", sep = "\t")
chr_103_104_21_6 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_21_6.coords.txt", sep = "\t")
chr_103_104_28_6 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_28_6.coords.txt", sep = "\t")

chr_104_DToL_3_38 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_38.coords.txt", sep = "\t")
chr_104_DToL_3_39 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_39.coords.txt", sep = "\t")
chr_104_DToL_3_12 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_3_12.coords.txt", sep = "\t")
chr_104_DToL_6_4 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_4.coords.txt", sep = "\t")
chr_104_DToL_6_23 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_6_23.coords.txt", sep = "\t")

chr_DToL_105_39_34 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_39_34.coords.txt", sep = "\t")
chr_DToL_105_38_38 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_38_38.coords.txt", sep = "\t")
chr_DToL_105_12_48 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_48.coords.txt", sep = "\t")
chr_DToL_105_12_52 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_12_52.coords.txt", sep = "\t")
chr_DToL_105_4_35 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_35.coords.txt", sep = "\t")
chr_DToL_105_4_44 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_4_44.coords.txt", sep = "\t")
chr_DToL_105_23_20 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_23_20.coords.txt", sep = "\t")

chr_105_115_34_10 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_34_10.coords.txt", sep = "\t")
chr_105_115_38_10 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_38_10.coords.txt", sep = "\t")
chr_105_115_48_15 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_15.coords.txt", sep = "\t")
chr_105_115_48_21 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_48_21.coords.txt", sep = "\t")
chr_105_115_52_21 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_52_21.coords.txt", sep = "\t")
chr_105_115_35_6 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_35_6.coords.txt", sep = "\t")
chr_105_115_44_6 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_44_6.coords.txt", sep = "\t")
chr_105_115_20_5 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_20_5.coords.txt", sep = "\t")

chr_115_111_10_2 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_2.coords.txt", sep = "\t")
chr_115_111_10_28 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_10_28.coords.txt", sep = "\t")
chr_115_111_15_15 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_15_15.coords.txt", sep = "\t")
chr_115_111_21_13 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_13.coords.txt", sep = "\t")
chr_115_111_21_15 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_21_15.coords.txt", sep = "\t")
chr_115_111_6_8 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_8.coords.txt", sep = "\t")
chr_115_111_6_13 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_13.coords.txt", sep = "\t")
chr_115_111_6_22 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_22.coords.txt", sep = "\t")
chr_115_111_6_26 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_6_26.coords.txt", sep = "\t")
chr_115_111_5_14 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_14.coords.txt", sep = "\t")
chr_115_111_5_17 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_17.coords.txt", sep = "\t")
chr_115_111_5_21 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_21.coords.txt", sep = "\t")


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
  annotate("text", label="~italic(L.~sinapis)~Swe~M", x=6, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Swe~F", x=5, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Ast", x=4, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Cat", x=3, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~reali)", x=2, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~juvernica)", x=1, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  coord_flip() +

  ##### 103-104 #####

geom_segment(data = chr_103_104_19_3, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_25_3, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_21_6, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_103_104_28_6, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint), 
               color=col4, alpha=alpha_par, size=line_size) +

  ##### 104-DToL #####
  
geom_segment(data = chr_104_DToL_3_38, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_3_39, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
               color=col1, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_3_12, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
               color=col2, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_104_DToL_6_4, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
               color=col3, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_6_23, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
               color=col4, alpha=alpha_par, size=line_size) +

  ##### DToL-105 #####
  
geom_segment(data = chr_DToL_105_39_34, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_38_38, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_12_48, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_12_52, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_4_35, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_4_44, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_23_20, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
               color=col4, alpha=alpha_par, size=line_size) +

  ##### 105-115 #####

geom_segment(data = chr_105_115_34_10, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_38_10, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col1, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_48_15, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_48_21, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_52_21, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_35_6, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_44_6, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_105_115_20_5, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
               color=col4, alpha=alpha_par, size=line_size) +
  
  ##### 115-111 #####

geom_segment(data = chr_115_111_10_2, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col1, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_115_111_10_28, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col1, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_15_15, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_21_13, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_21_15, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_6_8, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_6_13, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_6_22, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_6_26, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_5_14, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_5_17, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_5_21, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
               color=col4, alpha=alpha_par, size=line_size) +

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
  expand_limits(y = c(-30000000, 20000000)) +
  annotate("text", label="~italic(L.~sinapis)~Swe~M", x=6, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Swe~F", x=5, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Ast", x=4, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Cat", x=3, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~reali)", x=2, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~juvernica)", x=1, y=-2000000, color="black", size=5, hjust=1, parse = TRUE) +
  coord_flip()

ggsave(filename = ("sin_swe_intra_fusion.png"), width = 15, height = 15, units = "in", dpi = 300, limitsize = F)
