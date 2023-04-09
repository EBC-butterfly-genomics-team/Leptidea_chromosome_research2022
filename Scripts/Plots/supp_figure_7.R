library(ggplot2)

#setwd("C:/Users/larsf/Desktop/R_plots")
setwd("/home/larshook/SCRIPTS/ASSEMBLY_MS/STATS")


all_sp <- read.csv("all_aed.txt", sep = "\t")

all_sp$species <- factor(all_sp$species, levels = c("Ljuvernica", "Lreali", "LsinapisSwe", "LsinapisCat", "LsinapisDToL"))

ggplot(all_sp, aes(x=AED, y=proportion, colour=species)) +
  geom_line(size=1.3, alpha=0.75) +
  ylab(expression(atop("Cumulative fraction of annotations", ""))) +
  xlab(expression(atop("", "AED"))) +
  theme_classic() +
  theme(axis.text.x = element_text(size=14),
        axis.text.y = element_text(size=14),
        axis.title.x = element_text(size=16),
        axis.title.y = element_text(size=16),
        legend.text = element_text(size=14),
        legend.title = element_blank()) +
  guides(colour = guide_legend(order=1),
         linetype = guide_legend(order=2)) +
  theme(legend.position = c(0.85, 0.45)) +
  scale_color_manual(values = c("firebrick2", "orange1", "skyblue3", "green2", "purple"), labels = c("L. juvernica", "L. reali", "L. sinapis Swe", "L. sinapis Cat", "L. sinapis DToL"))

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "annotation_aed_plot.png", width = 15, height = 15, units = "in", dpi = 300, limitsize = F)
