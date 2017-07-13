library(readr)
library(ggplot2)
library(dplyr)

# This is pre-processed in cluster_hist.R
cluster_hist <- read_csv("data/clusters_hist_100.csv", col_types = "ddid")

g <- cluster_hist %>%
  filter(counts > 0) %>%
  ggplot() +
  geom_point(aes(x = exp(mids), y = counts)) +
  scale_x_log10(
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  scale_y_log10(
    labels = scales::trans_format("log10", scales::math_format(10^.x))
  ) +
  labs(x = "Cluster Size, N", y = "Count") +
  theme_bw()

ggsave("fig-clusters.pdf", g, width = 3.5, height = 3.5, units = "in")
