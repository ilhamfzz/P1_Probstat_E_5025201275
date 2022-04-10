p = 0.20
n = 3
#1a exact
dgeom(x = n, prob = p)

#1b
mean(rgeom(n = 10000, prob = p) == 3)

#1c
#we know that 1a and 1b have the same result

#1c histogram
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probability of X = 3 Failures Prior to First Success",
       subtitle = "Geometric(.2)",
       x = "Failures prior to first success (x)",
       y = "Probability") 

#1d mean and variance
1/p #mean
(1 - p) / p^2 #variance