
library(ggplot2)
library(plotly)

setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS")

karyotype <- read.csv("sin_fusion_poly_karyotype.txt", sep="\t")
karyotype$assembly <- factor(karyotype$assembly, levels=c("P14502_111", "P14502_115", "P14502_105", "DToL", "P14502_104", "P14502_103"))

chr_103_104_5_4 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_5_4.coords.txt", sep = "\t")
chr_103_104_27_4 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_27_4.coords.txt", sep = "\t")
chr_103_104_5_27 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_5_27.coords.txt", sep = "\t")
chr_103_104_11_10 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_11_10.coords.txt", sep = "\t")
chr_103_104_11_26 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_11_26.coords.txt", sep = "\t")
chr_103_104_26_10 <- read.csv("P14502_103_CHR-P14502_104_CHR-filtered_1.CHR_26_10.coords.txt", sep = "\t")

chr_104_DToL_4_22 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_4_22.coords.txt", sep = "\t")
chr_104_DToL_4_21 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_4_21.coords.txt", sep = "\t")
chr_104_DToL_4_13 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_4_13.coords.txt", sep = "\t")
chr_104_DToL_27_13 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_27_13.coords.txt", sep = "\t")
chr_104_DToL_10_30 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_10_30.coords.txt", sep = "\t")
chr_104_DToL_10_26 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_10_26.coords.txt", sep = "\t")
chr_104_DToL_10_6 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_10_6.coords.txt", sep = "\t")
chr_104_DToL_26_6 <- read.csv("P14502_104_CHR-Lsin_DToL-filtered_1.CHR_26_6.coords.txt", sep = "\t")

chr_DToL_105_22_11 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_22_11.coords.txt", sep = "\t")
chr_DToL_105_21_12 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_21_12.coords.txt", sep = "\t")
chr_DToL_105_13_7 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_13_7.coords.txt", sep = "\t")
chr_DToL_105_30_29 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_30_29.coords.txt", sep = "\t")
chr_DToL_105_26_25 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_26_25.coords.txt", sep = "\t")
chr_DToL_105_6_51 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_6_51.coords.txt", sep = "\t")
chr_DToL_105_6_5 <- read.csv("Lsin_DToL-P14502_105_CHR-filtered_1.CHR_6_5.coords.txt", sep = "\t")

chr_105_115_11_4 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_11_4.coords.txt", sep = "\t")
chr_105_115_12_4 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_12_4.coords.txt", sep = "\t")
chr_105_115_25_13 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_25_13.coords.txt", sep = "\t")
chr_105_115_51_13 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_51_13.coords.txt", sep = "\t")
chr_105_115_29_23 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_29_23.coords.txt", sep = "\t")
chr_105_115_25_14 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_25_14.coords.txt", sep = "\t")
chr_105_115_25_5 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_25_5.coords.txt", sep = "\t")
chr_105_115_51_14 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_51_14.coords.txt", sep = "\t")
chr_105_115_5_14 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_5_14.coords.txt", sep = "\t")
chr_105_115_7_3 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_7_3.coords.txt", sep = "\t")
chr_105_115_7_4 <- read.csv("P14502_105_CHR-P14502_115_CHR-filtered_1.CHR_7_4.coords.txt", sep = "\t")

chr_115_111_4_6 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_6.coords.txt", sep = "\t")
chr_115_111_4_24 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_24.coords.txt", sep = "\t")
chr_115_111_4_3 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_3.coords.txt", sep = "\t")
chr_115_111_4_33 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_33.coords.txt", sep = "\t")
chr_115_111_4_20 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_20.coords.txt", sep = "\t")
chr_115_111_3_22 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_3_22.coords.txt", sep = "\t")
chr_115_111_4_10 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_4_10.coords.txt", sep = "\t")
chr_115_111_23_10 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_23_10.coords.txt", sep = "\t")
chr_115_111_13_16 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_13_16.coords.txt", sep = "\t")
chr_115_111_13_9 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_13_9.coords.txt", sep = "\t")
chr_115_111_5_7 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_5_7.coords.txt", sep = "\t")
chr_115_111_14_5 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_14_5.coords.txt", sep = "\t")
chr_115_111_14_14 <- read.csv("P14502_115_CHR-P14502_111_CHR-filtered_1.CHR_14_14.coords.txt", sep = "\t")


# breakpoints in alignments from mid of midpoints from alignments

chr_104_10_bp1 <- (164861000+164913000)/2

chr_DToL_13_bp1 <- (106963000+107148695)/2
chr_DToL_6_bp1 <- (227393687+227505500)/2

chr_105_25_bp1 <- (166930000+167044000)/2

chr_115_4_bp1 <- (31244864+31359200)/2
chr_115_14_bp1 <- (239933000+239993846)/2



alpha_par = 0.3
nudge_left <- -0.04
nudge_right <- 0.04
line_size <- 0.2

text_size <- 2
chr_size <- 3.1
chr_end_size <- 2.4
chr_point_size <- 2.8
chr_label_size <- 1.4

col1 <- "#855723" #brown
col2 <- "#D57500" #orange
col3 <- "#668D3C" #green 
col4 <- "#DBCA69" #yellow 
col5 <- "#83929F" #blue
col6 <- "#8F3B1B" #red

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

ggplot(data = karyotype) + 
  geom_segment(aes(x=assembly, xend=assembly, y=start, yend=end), color=karyotype$colz, size=chr_size, lineend="butt") +
  geom_point(aes(x=assembly, y=start), size=chr_end_size, color=karyotype$colz) +
  geom_point(aes(x=assembly, y=end), size=chr_end_size, color=karyotype$colz) +
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
  geom_point(x=karyotype$assembly, y=karyotype$start, shape=21, size=chr_point_size, color="grey30", fill="grey", alpha=0.5) +
  annotate("text", label=karyotype$chr, x=karyotype$assembly, y=karyotype$start, color="black", size=chr_label_size) +
  ylab("") +
  xlab("") +
  expand_limits(y = c(-19000000, 19000000)) +
  coord_flip() +


# alignment bands...

geom_segment(data = chr_103_104_5_4, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint), 
               color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_27_4, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint),
             color=col3, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_5_27, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint),
             color=col2, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_11_10, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_11_26, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint),
             color=col5, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_103_104_26_10, aes(x=start_103, xend=end_104, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_4_22, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col3, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_4_21, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_4_13, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_104_DToL_27_13, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col2, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_104_DToL_10_30, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_104_DToL_10_26, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_104_DToL_10_26$ref_midpoint < chr_104_10_bp1, col4, col6), alpha=alpha_par, size=line_size)  +  
  
geom_segment(data = chr_104_DToL_10_6, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_104_DToL_26_6, aes(x=start_104, xend=end_DToL, y=ref_midpoint, yend=que_midpoint),
             color=col5, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_22_11, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=col3, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_21_12, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_13_7, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_DToL_105_13_7$ref_midpoint < chr_DToL_13_bp1, col1, col2), alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_DToL_105_30_29, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_26_25, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_DToL_105_26_25$que_midpoint < chr_105_25_bp1, col4, col6), alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_6_51, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_DToL_105_6_51$ref_midpoint < chr_DToL_6_bp1, col6, col5), alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_DToL_105_6_5, aes(x=start_DToL, xend=end_105, y=ref_midpoint, yend=que_midpoint),
             color=col5, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_11_4, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col3, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_12_4, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_105_115_25_13, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_25_14, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_25_5, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_29_23, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_5_14, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col5, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_51_13, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_105_115_51_14, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col5, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_7_3, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col2, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_105_115_7_4, aes(x=start_105, xend=end_115, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_4_6, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_115_111_4_24, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_115_111_4_3, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_115_111_4_33, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_115_111_4_33$ref_midpoint < chr_115_4_bp1, col1, col3), alpha=alpha_par, size=line_size)  + 
  
geom_segment(data = chr_115_111_4_20, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col3, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_3_22, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col2, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_4_10, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col1, alpha=alpha_par, size=line_size)  +

geom_segment(data = chr_115_111_23_10, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_13_16, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_13_9, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_5_7, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col6, alpha=alpha_par, size=line_size)  +
  
geom_segment(data = chr_115_111_14_14, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=col4, alpha=alpha_par, size=line_size) +
  
geom_segment(data = chr_115_111_14_5, aes(x=start_115, xend=end_111, y=ref_midpoint, yend=que_midpoint),
             color=ifelse(chr_115_111_14_5$ref_midpoint < chr_115_14_bp1, col4, col5), alpha=alpha_par, size=line_size)  +    
  
  geom_segment(aes(x=assembly, xend=assembly, y=start, yend=end), color=karyotype$colz, size=chr_size, lineend="butt") +
  geom_point(aes(x=assembly, y=start), size=chr_label_size, color=karyotype$colz) +
  geom_point(aes(x=assembly, y=end), size=chr_label_size, color=karyotype$colz) +
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
  geom_point(x=karyotype$assembly, y=karyotype$start, shape=21, size=chr_point_size, color="grey60", fill="grey") +
  annotate("text", label=karyotype$chr, x=karyotype$assembly, y=karyotype$start, color="black", size=chr_label_size) +
  ylab("") +
  xlab("") +
  expand_limits(y = c(-40000000, 20000000)) +
  annotate("text", label="~italic(L.~sinapis)~Swe~M", x=6, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Swe~F", x=5, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Ast", x=4, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~sinapis)~Cat", x=3, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~reali)", x=2, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  annotate("text", label="~italic(L.~juvernica)", x=1, y=-2000000, color="black", size=text_size, hjust=1, parse = TRUE) +
  coord_flip()
  

ggsave(filename = ("Figure_3.jpeg"), width = 174, height = 100, units = "mm", dpi = 600, limitsize = F)