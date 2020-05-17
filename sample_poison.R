library(ggplot2)
library(dplyr)
library(tidyr)

options(scipen = 999, digits = 2) # sig digits

n = 0:10
df <- data.frame(events = 0:10, 
                 Poisson = dpois(x = n, lambda = .007 * 500),
                 Binomial = dbinom(x = n, size = 500, p = .007))
df_tidy <- gather(df, key = "Distribution", value = "density", -c(events))
g1 <- ggplot(df_tidy, aes(x = factor(events), y = density, fill = Distribution)) +
  geom_col(position = "dodge") +
  labs(title = "Poisson(35) and Binomial(500, .007)",
       subtitle = "Poisson approximates binomial when n >= 20 and p <= .05.",
       x = "Events (x)",
       y = "Density")

plot(g1)
