
# load bioinfo-tools and R_packages before running

library(ggplot2)
library(scales)

#setwd("C:/Users/larsf/Desktop/R_plots")
setwd("/home/larshook/SCRIPTS/ASSEMBLY_MS/STATS")



# gene sizes

swe_sizes <- read.csv("swe_gene_sizes.txt", header = FALSE)
cat_sizes <- read.csv("spa_gene_sizes.txt", header = FALSE)
dtol_sizes <- read.csv("DToL_gene_sizes.txt", header = FALSE)
juv_sizes <- read.csv("juv_gene_sizes.txt", header = FALSE)
rea_sizes <- read.csv("rea_gene_sizes.txt", header = FALSE)

swe_sizes$species <- "L. sinapis Swe"
cat_sizes$species <- "L. sinapis Cat"
dtol_sizes$species <- "L. sinapis DToL"
juv_sizes$species <- "L. juvernica"
rea_sizes$species <- "L. reali"

all_sizes <- rbind(swe_sizes, cat_sizes, dtol_sizes, rea_sizes, juv_sizes)

all_sizes$species = factor(all_sizes$species, levels=c( "L. juvernica",
							"L. reali",
							"L. sinapis DToL",
							"L. sinapis Swe",
                                                        "L. sinapis Cat"))

ggplot(all_sizes, aes(V1)) +
  geom_histogram(binwidth = 100, aes(fill=species)) +
  facet_wrap(~species, scales = "free", strip.position = "top", nrow = 2, ncol = 3) + 
  scale_x_continuous(labels = unit_format(unit = "kb", scale = 1e-3, accuracy = 3)) +
  coord_cartesian(xlim = c(0, 100000), ylim = c(0, 400)) +
  theme_bw() +
  theme(strip.text=element_text(size=18),
        axis.title=element_text(size=18),
        axis.text.x=element_text(size=14),
        axis.text.y=element_text(size=14),
        plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none") +
  scale_fill_manual(values = c("firebrick2", "orange1", "purple", "skyblue3", "green2"), labels = c("L. juvernica", "L. reali", "L. sinapis DToL", "L. sinapis Swe", "L. sinapis Cat")) +
  xlab(expression(atop("", "Size (binwidth=100)"))) +
  ylab(expression(atop("Number of genes","")))

ggsave(path = "/home/larshook/LarsH/ASSEMBLY_MS_PLOTS", filename = "gene_sizes.png", width = 15, height = 7.5, units = "in", dpi = 300, limitsize = F)
