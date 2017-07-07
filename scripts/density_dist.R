library(ggplot2)
library(yaml)

em_raw <- read.csv("data/em.csv", header = FALSE, col.names = c("M", "E"))

# Cut off four correlation times
em <- em_raw[-(1:200), ]

metadata <- yaml.load_file("~/Cprogs/big-ising/metadata.yaml")
N <- as.integer(metadata$N)


g <- ggplot(em) +
  geom_freqpoly(aes(x = M / N, y = ..density..), bins = 100) + 
  labs(x = "Magnetisation per spin, m", y = "Density, P(m)") +
  theme_bw()

ggsave("fig-density.pdf", g)
