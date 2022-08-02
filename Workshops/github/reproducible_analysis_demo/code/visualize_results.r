library(dplyr)
library(ggplot2)

## import data
phate <- read.csv("results/phate.csv", header = FALSE)
cell_labels <- read.delim("data/tasic_labels.tsv", header = FALSE)
dim(phate); dim(cell_labels)

## plot
p <- phate %>% 
  mutate(cell_labels = cell_labels$V1) %>% 
  ggplot(aes(x = V1, y = V2, color = cell_labels)) +
  geom_point() +
  theme_classic() +
  xlab("Dim 1") +
  ylab("Dim 2")

ggsave("results/phate_plot.png", p)