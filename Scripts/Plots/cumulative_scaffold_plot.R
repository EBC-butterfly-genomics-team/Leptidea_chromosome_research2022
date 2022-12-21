#!/usr/bin/env Rscript


### first load bioinfo-tools and R_packages ###


library(ggplot2)
library(scales)


setwd("/home/larshook/SCRIPTS/ASSEMBLY_MS/STATS")



all_sp <- read.csv("all.cumulative_sum.txt", sep = " ")

all_sp$species <- factor(all_sp$species, levels=c("Juv", "Rea", "Swe", "Cat"))

ggplot(all_sp, aes(x=scaffold, y=sum, colour=species, linetype=sex)) +
  geom_line(size=1.4) +
  ylab(expression(atop("", "Cumulative length (bp)", ""))) +
  xlab(expression(atop("", "Number of scaffolds", ""))) +
  scale_y_continuous(labels = unit_format(unit = "mb", scale = 1e-6)) +
  scale_x_continuous(labels = unit_format(unit = "k", scale = 1e-3)) +
  theme_classic() +
  theme(axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        axis.title.x = element_text(size=18),
        axis.title.y = element_text(size=18),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15)) +
  guides(colour = guide_legend(order=1),
         linetype = guide_legend(order=2)) +
  theme(legend.position = c(0.85, 0.45)) +
  scale_linetype_manual(values=c("solid", "dotted"))+
  scale_color_manual(values = c("firebrick2", "orange1", "skyblue3", "green2"), labels = c("L. juvernica", "L. reali", "L. sinapis Swe", "L. sinapis Cat"))

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "cumulative_scaffold_length.png", width = 15, height = 10, units = "in", dpi = 300, limitsize = F)
