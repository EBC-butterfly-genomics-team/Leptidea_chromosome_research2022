#!/usr/bin/env Rscript


# load bioinfo-tools and R_packagesbefore running



library(ggplot2)
library(scales)

#setwd("C:/Users/larsf/Desktop/R_plots")
setwd("/home/larshook/LarsH/WHOLE_GENOME_ALIGNMENTS/AFTER_BEFORE")



#### 103 ####

df_103 <- read.csv("103_corrections.txt", sep = "\t")

ggplot(data = df_103, na.rm = TRUE) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 5) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  geom_point(data = df_103, aes(x=marker_pos, y=marker_pos), color="blue", size=1) +
  scale_color_manual(name=NULL, 
                    breaks = c("same", "inv", "pos", "marker"),
                    values = c(same="grey", inv="red", pos="green", marker="blue"), 
                    labels = c("Uncorrected", "Changed orientation", "Changed positions", "Linkage map markers")) +
  xlab(expression(atop("", "L. sinapis Swe male - linkage map corrected "))) +
  ylab(expression(atop("L. sinapis Swe male - uncorrected", ""))) +
  labs(tag = "E")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "103_lm_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 105 ####

df_105 <- read.csv("105_corrections.txt", sep = "\t")

ggplot(data = df_105, na.rm = TRUE) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 7) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  geom_point(data = df_105, aes(x=marker_pos, y=marker_pos), color="blue", size=1) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos", "marker"),
                     values = c(same="grey", inv="red", pos="green", marker="blue"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions", "Linkage map markers")) +
  xlab(expression(atop("", "L. sinapis Cat male - linkage map corrected "))) +
  ylab(expression(atop("L. sinapis Cat male - uncorrected", ""))) +
  labs(tag = "G")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "105_lm_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 104 ####

df_104 <- read.csv("104_corrections.txt", sep = "\t")

ggplot(data = df_104, na.rm = TRUE) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 5) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. sinapis Swe female - corrected "))) +
  ylab(expression(atop("L. sinapis Swe female - uncorrected", ""))) +
  labs(tag = "F")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "104_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 106 ####

df_106 <- read.csv("106_corrections.txt", sep = "\t")

ggplot(data = df_106) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 7) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. sinapis Cat female - corrected "))) +
  ylab(expression(atop("L. sinapis Cat female - uncorrected", ""))) +
  labs(tag = "H")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "106_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 111 ####

df_111 <- read.csv("111_corrections.txt", sep = "\t")

ggplot(data = df_111) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 6) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. juvernica male - corrected "))) +
  ylab(expression(atop("L. juvernica male - uncorrected", ""))) +
  labs(tag = "A")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "111_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 112 ####

df_112 <- read.csv("112_corrections.txt", sep = "\t")

ggplot(data = df_112) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 6) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. juvernica female - corrected "))) +
  ylab(expression(atop("L. juvernica female - uncorrected", ""))) +
  labs(tag = "B")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "112_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 115 ####

df_115 <- read.csv("115_corrections.txt", sep = "\t")

ggplot(data = df_115) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 5) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. reali male - corrected "))) +
  ylab(expression(atop("L. reali male - uncorrected", ""))) +
  labs(tag = "C")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "115_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)



#### 116 ####

df_116 <- read.csv("116_corrections.txt", sep = "\t")

ggplot(data = df_116) +
  theme_classic() +
  theme(strip.text=element_text(size=12),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=12),
        axis.text.y=element_text(size=12),
        plot.tag=element_text(size=20),
        legend.position="bottom") +
  facet_wrap(~ref, scales = "free", strip.position = "top", nrow = 5) +
  theme(aspect.ratio = 1) +
  scale_y_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  scale_x_continuous(labels = unit_format(unit = "", scale = 1e-6, accuracy = 1)) +
  geom_segment(aes(x=ref_start, xend=ref_end, y=que_start, yend=que_end, color=correction), size=1.25, na.rm = TRUE) +
  scale_color_manual(name=NULL, 
                     breaks = c("same", "inv", "pos"),
                     values = c(same="grey", inv="red", pos="green"), 
                     labels = c("Uncorrected", "Changed orientation", "Changed positions")) +
  xlab(expression(atop("", "L. reali female - corrected "))) +
  ylab(expression(atop("L. reali female - uncorrected", ""))) +
  labs(tag = "D")

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "116_correction_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)
