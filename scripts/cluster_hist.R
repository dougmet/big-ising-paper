library(readr)

clusters <- read_csv("data/clusters.csv", 
                     col_names = FALSE, 
                     col_types = "d")[[1]]

# Normally wouldn't overwrite but really need the memory back
clusters <- log(clusters)

# Use evenly spaced bins. Might be nice to better cover the integers at low N.
h100 <- hist(clusters, breaks = 100)

h100_df <- data.frame(left = h100$breaks[-length(h100$breaks)],
                      mids = h100$mids,
                      counts = h100$counts,
                      density = h100$density)

write_csv(h100_df, "data/clusters_hist_100.csv")
