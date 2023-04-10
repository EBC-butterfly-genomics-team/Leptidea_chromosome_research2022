
library(ggplot2)
library(plotly)

setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS/REARRANGEMENTS/juv_fusion_poly")

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


# get breakpoints in alignments from mid of midpoints from alignments

chr_103_27_bp <- (21319782+21400157)/2


karyotype <- read.csv("juv_fusion_poly_karyotype.txt", sep="\t")
karyotype$assembly <- factor(karyotype$assembly, levels=c("P14502_115", "P14502_105", "DToL", "P14502_103", "P14502_111", "P14502_112"))

chr_112_111_20_37 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_37.coords.txt", sep = "\t")
chr_112_111_20_27 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_20_27.coords.txt", sep = "\t")
chr_112_111_40_27 <- read.csv("P14502_112_CHR-P14502_111_CHR-filtered_1.CHR_40_27.coords.txt", sep = "\t")

chr_111_103_27_17 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_27_17.coords.txt", sep = "\t")
chr_111_103_37_23 <- read.csv("P14502_111_CHR-P14502_103_CHR-filtered_1.CHR_37_23.coords.txt", sep = "\t")

chr_103_DToL_23_47 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_23_47.coords.txt", sep = "\t")
chr_103_DToL_17_8 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_8.coords.txt", sep = "\t")
chr_103_DToL_17_33 <- read.csv("P14502_103_CHR-Lsin_DToL-filtered_1.CHR_17_33.coords.txt", sep = "\t")

chr_DToL_105_47_45 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_47_45.coords.txt", sep = "\t")
chr_DToL_105_8_26 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_8_26.coords.txt", sep = "\t")
chr_DToL_105_33_32 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_33_32.coords.txt", sep = "\t")

chr_105_115_45_21 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_45_21.coords.txt", sep = "\t")
chr_105_115_26_19 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_19.coords.txt", sep = "\t")
chr_105_115_26_25 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_26_25.coords.txt", sep = "\t")
chr_105_115_32_19 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_32_19.coords.txt", sep = "\t")



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

geom_segment(data = chr_112_111_20_27, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_112_111_20_37, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_112_111_40_27, aes(x=start_112, xend=end_111, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
  
##### 111-103 #####
  
geom_segment(data = chr_111_103_27_17, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=ifelse(chr_111_103_27_17$ref_midpoint < chr_103_27_bp, col1, col2), alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_111_103_37_23, aes(x=start_111, xend=end_103, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +
  

##### 103-DToL #####

geom_segment(data = chr_103_DToL_23_47, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +  
  
geom_segment(data = chr_103_DToL_17_8, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +  

geom_segment(data = chr_103_DToL_17_33, aes(x=start_103, xend=end_DToL, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  

##### DToL-105 #####

geom_segment(data = chr_DToL_105_47_45, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_DToL_105_8_26, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_DToL_105_33_32, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
  

##### 105-115 #####

geom_segment(data = chr_105_115_45_21, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col3, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_26_25, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col2, alpha=alpha_par, size=line_size) +

geom_segment(data = chr_105_115_32_19, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint), 
             color=col1, alpha=alpha_par, size=line_size) +
  
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

ggsave(filename = ("juv_fusion_poly_plot.png"), width = 15, height = 15, units = "in", dpi = 300, limitsize = F)

