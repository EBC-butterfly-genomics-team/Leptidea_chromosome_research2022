

# load bioinfo-tools and R_packages before running

library(ggplot2)
library(scales)

setwd("/home/larshook/SCRIPTS/ASSEMBLY_MS/STATS")
#setwd("~/Desktop/Plots/ASSEMBLY_MS_PLOTS")

df <- read.csv("breakpoint_resampling_distribution.txt")

ggplot(df, aes(x=frac)) +
  geom_histogram(binwidth = 0.03, fill="grey70", color="grey40") +
  geom_segment(aes(x = 33/37, xend = 33/37, y = 0,  yend = 40000), color="red", size=1.3) +
  theme_classic() +
  theme(axis.title=element_text(size=18),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14)) +
  xlab("\nProportion") +
  ylab("Frequency\n") +
  annotate("text", x=0.60, y=20000, label = bquote('p < 1'*x10^-5), size=6.5) +
  xlim(0, 0.99) +
  ylim(0, 40000)

ggsave(filename = ("resampling_breakpoint_overlaps.png"), width = 15, height = 10, units = "in", dpi = 300, limitsize = F)
