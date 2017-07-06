library(ggplot2)
library(yaml)

em <- read.csv("data/em.csv", header = FALSE, col.names = c("M", "E"))

metadata <- yaml.load_file("~/Cprogs/big-ising/metadata.yaml")
N <- as.integer(metadata$N)


g <- qplot(M / N, data = em, bins = 100) + 
  labs(x = "Magnetisation per spin", y = "Count") +
  theme_bw()

ggsave("fig-density.pdf", g)
