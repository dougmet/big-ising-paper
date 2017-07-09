library(readr)
library(ggplot2)
library(dplyr)

cluster_hist <- read_csv("data/clusters_hist_100.csv", col_types = "ddid")

g <- cluster_hist %>%
  filter(counts > 0) %>%
  ggplot() +
  geom_point(aes(x = exp(mids), y = counts)) +
  scale_y_log10() +
  scale_x_log10() +
  labs(x = "Cluster Size, N", y = "Count") +
  theme_bw()

ggsave("fig-clusters.pdf", g)
