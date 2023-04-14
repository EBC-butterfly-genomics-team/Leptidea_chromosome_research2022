
library(ggplot2)
library(ggtext)
library(patchwork)
library(ggpubr)
library(scales)

setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS/REARRANGEMENTS")

# calculate mean and sd for observed bp content

# reference

ref_elements <- read.csv("ref_elements_fi_fu_distributions.txt", sep = "\t")

# fusions

ref_fu_CDS <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="CDS")]
ref_fu_LINE <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="LINE")]
ref_fu_SINE <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="SINE")]
ref_fu_LTR <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="LTR")]
ref_fu_DNA <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="DNA")]
ref_fu_RC <- ref_elements$frac[which(ref_elements$type=="fu" & ref_elements$element=="RC")]

mean_ref_fu_CDS <- mean(ref_fu_CDS)
mean_ref_fu_LINE <- mean(ref_fu_LINE)
mean_ref_fu_SINE <- mean(ref_fu_SINE)
mean_ref_fu_LTR <- mean(ref_fu_LTR)
mean_ref_fu_DNA <- mean(ref_fu_DNA)
mean_ref_fu_RC <- mean(ref_fu_RC)

sd_ref_fu_CDS <- sd(ref_fu_CDS)
sd_ref_fu_LINE <- sd(ref_fu_LINE)
sd_ref_fu_SINE <- sd(ref_fu_SINE)
sd_ref_fu_LTR <- sd(ref_fu_LTR)
sd_ref_fu_DNA <- sd(ref_fu_DNA)
sd_ref_fu_RC <- sd(ref_fu_RC)

# fissions

ref_fi_CDS <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="CDS")]
ref_fi_LINE <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="LINE")]
ref_fi_SINE <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="SINE")]
ref_fi_LTR <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="LTR")]
ref_fi_DNA <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="DNA")]
ref_fi_RC <- ref_elements$frac[which(ref_elements$type=="fi" & ref_elements$element=="RC")]

mean_ref_fi_CDS <- mean(ref_fi_CDS)
mean_ref_fi_LINE <- mean(ref_fi_LINE)
mean_ref_fi_SINE <- mean(ref_fi_SINE)
mean_ref_fi_LTR <- mean(ref_fi_LTR)
mean_ref_fi_DNA <- mean(ref_fi_DNA)
mean_ref_fi_RC <- mean(ref_fi_RC)

sd_ref_fi_CDS <- sd(ref_fi_CDS)
sd_ref_fi_LINE <- sd(ref_fi_LINE)
sd_ref_fi_SINE <- sd(ref_fi_SINE)
sd_ref_fi_LTR <- sd(ref_fi_LTR)
sd_ref_fi_DNA <- sd(ref_fi_DNA)
sd_ref_fi_RC <- sd(ref_fi_RC)


# query

que_elements <- read.csv("que_elements_fi_fu_distributions.txt", sep = "\t")

# fusions

que_fu_CDS <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="CDS")]
que_fu_LINE <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="LINE")]
que_fu_SINE <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="SINE")]
que_fu_LTR <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="LTR")]
que_fu_DNA <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="DNA")]
que_fu_RC <- que_elements$frac[which(que_elements$type=="fu" & que_elements$element=="RC")]

mean_que_fu_CDS <- mean(que_fu_CDS)
mean_que_fu_LINE <- mean(que_fu_LINE)
mean_que_fu_SINE <- mean(que_fu_SINE)
mean_que_fu_LTR <- mean(que_fu_LTR)
mean_que_fu_DNA <- mean(que_fu_DNA)
mean_que_fu_RC <- mean(que_fu_RC)

sd_que_fu_CDS <- sd(que_fu_CDS)
sd_que_fu_LINE <- sd(que_fu_LINE)
sd_que_fu_SINE <- sd(que_fu_SINE)
sd_que_fu_LTR <- sd(que_fu_LTR)
sd_que_fu_DNA <- sd(que_fu_DNA)
sd_que_fu_RC <- sd(que_fu_RC)


# fissions

que_fi_CDS <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="CDS")]
que_fi_LINE <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="LINE")]
que_fi_SINE <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="SINE")]
que_fi_LTR <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="LTR")]
que_fi_DNA <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="DNA")]
que_fi_RC <- que_elements$frac[which(que_elements$type=="fi" & que_elements$element=="RC")]

mean_que_fi_CDS <- mean(que_fi_CDS)
mean_que_fi_LINE <- mean(que_fi_LINE)
mean_que_fi_SINE <- mean(que_fi_SINE)
mean_que_fi_LTR <- mean(que_fi_LTR)
mean_que_fi_DNA <- mean(que_fi_DNA)
mean_que_fi_RC <- mean(que_fi_RC)

sd_que_fi_CDS <- sd(que_fi_CDS)
sd_que_fi_LINE <- sd(que_fi_LINE)
sd_que_fi_SINE <- sd(que_fi_SINE)
sd_que_fi_LTR <- sd(que_fi_LTR)
sd_que_fi_DNA <- sd(que_fi_DNA)
sd_que_fi_RC <- sd(que_fi_RC)


# read in resampling data...

ref_mean_elements <- read.csv("ref_mean_fraction_of_elements_in_breakpoints.txt", header = FALSE, sep = " ")
que_mean_elements <- read.csv("que_mean_fraction_of_elements_in_breakpoints.txt", header = FALSE, sep = " ")

ref_cds_fu <- read.csv("ref_resampling_distribution_fu_CDS.txt", header = FALSE)
ref_line_fu <- read.csv("ref_resampling_distribution_fu_LINE.txt", header = FALSE)
ref_sine_fu <- read.csv("ref_resampling_distribution_fu_SINE.txt", header = FALSE)
ref_ltr_fu <- read.csv("ref_resampling_distribution_fu_LTR.txt", header = FALSE)
ref_dna_fu <- read.csv("ref_resampling_distribution_fu_DNA.txt", header = FALSE)
ref_rc_fu <- read.csv("ref_resampling_distribution_fu_RC.txt", header = FALSE)

ref_cds_fi <- read.csv("ref_resampling_distribution_fi_CDS.txt", header = FALSE)
ref_line_fi <- read.csv("ref_resampling_distribution_fi_LINE.txt", header = FALSE)
ref_sine_fi <- read.csv("ref_resampling_distribution_fi_SINE.txt", header = FALSE)
ref_ltr_fi <- read.csv("ref_resampling_distribution_fi_LTR.txt", header = FALSE)
ref_dna_fi <- read.csv("ref_resampling_distribution_fi_DNA.txt", header = FALSE)
ref_rc_fi <- read.csv("ref_resampling_distribution_fi_RC.txt", header = FALSE)


que_cds_fu <- read.csv("que_resampling_distribution_fu_CDS.txt", header = FALSE)
que_line_fu <- read.csv("que_resampling_distribution_fu_LINE.txt", header = FALSE)
que_sine_fu <- read.csv("que_resampling_distribution_fu_SINE.txt", header = FALSE)
que_ltr_fu <- read.csv("que_resampling_distribution_fu_LTR.txt", header = FALSE)
que_dna_fu <- read.csv("que_resampling_distribution_fu_DNA.txt", header = FALSE)
que_rc_fu <- read.csv("que_resampling_distribution_fu_RC.txt", header = FALSE)

que_cds_fi <- read.csv("que_resampling_distribution_fi_CDS.txt", header = FALSE)
que_line_fi <- read.csv("que_resampling_distribution_fi_LINE.txt", header = FALSE)
que_sine_fi <- read.csv("que_resampling_distribution_fi_SINE.txt", header = FALSE)
que_ltr_fi <- read.csv("que_resampling_distribution_fi_LTR.txt", header = FALSE)
que_dna_fi <- read.csv("que_resampling_distribution_fi_DNA.txt", header = FALSE)
que_rc_fi <- read.csv("que_resampling_distribution_fi_RC.txt", header = FALSE)


# adjust p-values

p_values <- read.csv("uncorrected_p-values.txt", sep = " ", header = TRUE)
p_values$fdr_corrected <- p.adjust(p_values$p, method = "fdr")

# round p-values

p_values$p <- sprintf((p_values$p), fmt = '%#.3f')
p_values$fdr_corrected <- sprintf((p_values$fdr_corrected), fmt = '%#.3f')



padj_ref_fu_rc <- p_values$fdr_corrected[which(p_values$test=="ref_fu_RC_resampling_p_value")]
padj_que_fi_rc <- p_values$fdr_corrected[which(p_values$test=="que_fi_RC_resampling_p_value")]




ref_cds_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='CDS' & ref_mean_elements$V3=='fu')]
ref_line_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='LINE' & ref_mean_elements$V3=='fu')]
ref_sine_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='SINE' & ref_mean_elements$V3=='fu')]
ref_ltr_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='LTR' & ref_mean_elements$V3=='fu')]
ref_dna_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='DNA' & ref_mean_elements$V3=='fu')]
ref_rc_fu_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='RC' & ref_mean_elements$V3=='fu')]

ref_cds_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='CDS' & ref_mean_elements$V3=='fi')]
ref_line_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='LINE' & ref_mean_elements$V3=='fi')]
ref_sine_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='SINE' & ref_mean_elements$V3=='fi')]
ref_ltr_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='LTR' & ref_mean_elements$V3=='fi')]
ref_dna_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='DNA' & ref_mean_elements$V3=='fi')]
ref_rc_fi_mean <- ref_mean_elements$V5[which(ref_mean_elements$V2=='RC' & ref_mean_elements$V3=='fi')]


que_cds_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='CDS' & que_mean_elements$V3=='fu')]
que_line_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='LINE' & que_mean_elements$V3=='fu')]
que_sine_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='SINE' & que_mean_elements$V3=='fu')]
que_ltr_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='LTR' & que_mean_elements$V3=='fu')]
que_dna_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='DNA' & que_mean_elements$V3=='fu')]
que_rc_fu_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='RC' & que_mean_elements$V3=='fu')]

que_cds_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='CDS' & que_mean_elements$V3=='fi')]
que_line_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='LINE' & que_mean_elements$V3=='fi')]
que_sine_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='SINE' & que_mean_elements$V3=='fi')]
que_ltr_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='LTR' & que_mean_elements$V3=='fi')]
que_dna_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='DNA' & que_mean_elements$V3=='fi')]
que_rc_fi_mean <- que_mean_elements$V5[which(que_mean_elements$V2=='RC' & que_mean_elements$V3=='fi')]



title_size <- 4.5
axis_size <- 3.5
axis_label_size <- 7
seg_size <- 0.4
annotation_size <- 1.4
axis_line_size <- 0.25

fill_col <- "grey80"
hist_col <- "grey50"

ypos <- 17000
ymaxi <- 18500
ref_line_fu_p_x <- mean(ref_line_fu$V1)
ref_sine_fu_p_x <- mean(ref_sine_fu$V1)
ref_ltr_fu_p_x <- mean(ref_ltr_fu$V1)
ref_rc_fu_p_x <- mean(ref_rc_fu$V1)

que_line_fu_p_x <- mean(que_line_fu$V1)
que_sine_fu_p_x <- mean(que_sine_fu$V1)
que_rc_fu_p_x <- mean(que_rc_fu$V1)

que_rc_fi_p_x <- mean(que_rc_fi$V1)




##### create labels for plot rows #####

ref_title <- ggplot() +
  theme_void() +
  geom_text(aes(0,0, label="Reference"), size=2.5)

que_title <- ggplot() +
  theme_void() +
  geom_text(aes(0,0, label="Query"), size=2.5)




##### sub plots #####

ref_cds_fu_plot <- ggplot(ref_cds_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_CDS, xend = mean_ref_fu_CDS, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
      axis.text.x=element_text(size=axis_size),
      axis.text.y=element_text(size=axis_size),
      axis.ticks = element_line(size = axis_line_size),
      title = element_text(size=title_size),
      axis.line = element_line(size = axis_line_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("Count") +
  labs(title = "\n\n   CDS")


ref_line_fu_plot <- ggplot(ref_line_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_LINE, xend = mean_ref_fu_LINE, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        axis.line = element_line(size = axis_line_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=ref_line_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = bquote("\n\n   LINE"))


ref_sine_fu_plot <- ggplot(ref_sine_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_SINE, xend = mean_ref_fu_SINE, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        axis.line = element_line(size = axis_line_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("Density") +  
  ylab("") +
  annotate("text", hjust=0, x=ref_sine_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = "\n\n   SINE")


ref_ltr_fu_plot <- ggplot(ref_ltr_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_LTR, xend = mean_ref_fu_LTR, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        axis.line = element_line(size = axis_line_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=ref_ltr_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = "\n\n   LTR")


ref_dna_fu_plot <- ggplot(ref_dna_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_DNA, xend = mean_ref_fu_DNA, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   DNA")


ref_rc_fu_plot <- ggplot(ref_rc_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fu_RC, xend = mean_ref_fu_RC, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=ref_rc_fu_p_x, y=ypos, label = paste("p =", padj_ref_fu_rc), size=annotation_size, fontface = "bold") +
  labs(title = "\n\n   RC")





ref_cds_fi_plot <- ggplot(ref_cds_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_CDS, xend = mean_ref_fi_CDS, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("Count") +
  labs(title = "\n\n   CDS")


ref_line_fi_plot <- ggplot(ref_line_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_LINE, xend = mean_ref_fi_LINE, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        plot.subtitle = element_text(hjust = 1)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   LINE")


ref_sine_fi_plot <- ggplot(ref_sine_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_SINE, xend = mean_ref_fi_SINE, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        plot.subtitle = element_text(hjust = 1)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("Density") +
  ylab("") +
  labs(title = "\n\n   SINE")


ref_ltr_fi_plot <- ggplot(ref_ltr_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_LTR, xend = mean_ref_fi_LTR, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   LTR")


ref_dna_fi_plot <- ggplot(ref_dna_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_DNA, xend = mean_ref_fi_DNA, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   DNA")


ref_rc_fi_plot <- ggplot(ref_rc_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_ref_fi_RC, xend = mean_ref_fi_RC, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size),
        plot.subtitle = element_text(hjust = 1)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   RC")





##### query #####

que_cds_fu_plot <- ggplot(que_cds_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_CDS, xend = mean_que_fu_CDS, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.ticks = element_line(size = axis_line_size),
        axis.line = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("Count") +
  labs(title = "\n\n   CDS")


que_line_fu_plot <- ggplot(que_line_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_LINE, xend = mean_que_fu_LINE, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=que_line_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = "\n\n   LINE")


que_sine_fu_plot <- ggplot(que_sine_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_SINE, xend = mean_que_fu_SINE, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("Density") +
  ylab("") +
  annotate("text", hjust=0, x=que_sine_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = "\n\n   SINE")


que_ltr_fu_plot <- ggplot(que_ltr_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_LTR, xend = mean_que_fu_LTR, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   LTR")


que_dna_fu_plot <- ggplot(que_dna_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_DNA, xend = mean_que_fu_DNA, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   DNA")


que_rc_fu_plot <- ggplot(que_rc_fu, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fu_RC, xend = mean_que_fu_RC, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=que_rc_fu_p_x, y=ypos, label = bquote('p < 2'*x10^-5), size=annotation_size) +
  labs(title = "\n\n   RC")





que_cds_fi_plot <- ggplot(que_cds_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_CDS, xend = mean_que_fi_CDS, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("Count") +
  labs(title = "\n\n   CDS")


que_line_fi_plot <- ggplot(que_line_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_LINE, xend = mean_que_fi_LINE, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   LINE")


que_sine_fi_plot <- ggplot(que_sine_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_SINE, xend = mean_que_fi_SINE, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("Density") +
  ylab("") + 
  labs(title = "\n\n   SINE")


que_ltr_fi_plot <- ggplot(que_ltr_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_LTR, xend = mean_que_fi_LTR, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   LTR")


que_dna_fi_plot <- ggplot(que_dna_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_DNA, xend = mean_que_fi_DNA, y = 0,  yend = 15000), color="black", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  labs(title = "\n\n   DNA")


que_rc_fi_plot <- ggplot(que_rc_fi, aes(x=V1)) +
  geom_histogram(fill=fill_col, color=hist_col) +
  geom_segment(aes(x = mean_que_fi_RC, xend = mean_que_fi_RC, y = 0,  yend = 15000), color="red", size=seg_size) +
  theme_classic() +
  theme(axis.title=element_text(size=axis_label_size),
        axis.text.x=element_text(size=axis_size),
        axis.text.y=element_text(size=axis_size),
        axis.line = element_line(size = axis_line_size),
        axis.ticks = element_line(size = axis_line_size),
        title = element_text(size=title_size)) +
  scale_y_continuous(limits=c(0, ymaxi), labels = unit_format(unit = "k", scale = 1e-3, accuracy = 1)) +
  xlab("") +
  ylab("") +
  annotate("text", hjust=0, x=que_rc_fi_p_x, y=ypos, label = paste("p =", padj_que_fi_rc), size=annotation_size, fontface = "bold") +
  labs(title = "\n\n   RC")








fu_plots <- ref_title + ref_cds_fu_plot + ref_line_fu_plot + ref_sine_fu_plot + 
  ref_ltr_fu_plot + ref_dna_fu_plot + ref_rc_fu_plot +
  que_title + que_cds_fu_plot + que_line_fu_plot + que_sine_fu_plot + 
  que_ltr_fu_plot + que_dna_fu_plot + que_rc_fu_plot +
  plot_layout(ncol = 7, nrow = 2)

fi_plots <- ref_title + ref_cds_fi_plot + ref_line_fi_plot + ref_sine_fi_plot + 
  ref_ltr_fi_plot + ref_dna_fi_plot + ref_rc_fi_plot + 
  que_title + que_cds_fi_plot + que_line_fi_plot + que_sine_fi_plot + 
  que_ltr_fi_plot + que_dna_fi_plot + que_rc_fi_plot +
  plot_layout(ncol = 7, nrow = 2)

ggarrange(fu_plots, fi_plots, nrow = 2, labels = c("A: Fusions", "B: Fissions"), font.label = list(size = 8))



ggsave(filename = ("Figure_5.jpeg"), width = 174, height = 115, units = "mm", dpi = 600, limitsize = F)


