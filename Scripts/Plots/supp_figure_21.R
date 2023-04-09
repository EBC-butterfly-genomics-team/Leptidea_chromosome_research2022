
# load bioinfo-tools and R_packages before running

library(ggplot2)
library(tidyverse)
library(dplyr)
library(showtext)
library(scales)

#setwd("C:/Users/larsf/Desktop/R_plots")
setwd("/home/larshook/SCRIPTS/ASSEMBLY_MS/PLOTS")


df <- read.csv("repeat_summary_for_plot.csv", sep = ";")

df$Type <- factor(df$Type, levels = c("Unclassified", "Rolling-circles", "DNA transposons", "LTR elements", "SINEs", "LINEs"))
df$Species <- factor(df$Species, levels = c("L. juvernica", "L. reali", "L. sinapis Swe", "L. sinapis Cat", "L. sin. DToL"))

percent <- function(x, digits = 2, format = "f", ...) {
  paste0(formatC(x * 100, format = format, digits = digits, ...))
}

df$Tot_perc <- percent(df$Tot_perc)
df$Tot_perc <- as.numeric(df$Tot_perc)

df$Genome.fraction <- percent(df$Genome.fraction)
df$Genome.fraction <- as.numeric(df$Genome.fraction)

df <- df %>%
  group_by(Species, Sex) %>%
  mutate("cum_sum" = cumsum(Genome.fraction))

df$ypos <- ((df$cum_sum)-(df$Genome.fraction)+(df$Genome.fraction/2)-0.5)

male <- intToUtf8(9794)
female <- intToUtf8(9792)

ggplot(df, aes(x=Sex, y=Genome.fraction, fill=Type)) +
  geom_bar(position="stack", stat="identity", size=2, width = 0.9) +
  facet_grid(~Species, scales = "free_x", space = "free", switch = "both") +
  scale_fill_manual(values = c("#A9A18C", "#DBCA69", "#D57500", "#BDD09F", "#668D3C", "#404F24")) +
  geom_text(aes(label = paste0(Tot_perc, "%"), y= Tot_perc), size=6, stat= "identity", vjust = -1) +
  geom_text(aes(label = paste0(Genome.fraction, "%"),  y = ypos), size=5, stat= "identity", vjust = 0) +
  theme(strip.text=element_text(size=14),
        axis.title=element_text(size=18),
        legend.text=element_text(size=14),
        axis.text.x=element_text(size=16),
        axis.text.y=element_text(size=16),
        legend.title=element_blank()) +
  scale_y_continuous(labels = unit_format(unit = "%", scale = 1, accuracy = 1)) +
  xlab("") +
  ylab(expression(atop("Percent of genome", "")))

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "repeat_content_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)
