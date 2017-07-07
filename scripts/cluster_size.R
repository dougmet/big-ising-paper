library(readr)
library(ggplot2)
library(dplyr)

clusters <- read_csv("data/clusters.csv", 
                     col_names = FALSE, 
                     col_types = "d")[[1]]

h <- hist(clusters, breaks = 100)

df <- data.frame(ClusterSize = 10^h$mids, Count = h$counts)

df %>%
  filter(Count > 0) %>%
  ggplot(aes(x = ClusterSize, y = Count)) +
  geom_point() + 
  scale_x_log10() + scale_y_log10() + 
  theme_bw()
