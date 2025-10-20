
### installation package####

install.packages("dplyr")
install.packages("ggplot")
library(dplyr)
library(ggplot2)
###question 1 ###

pi <- seq(0.1, 0.9, by = 0.1)
L  <- pi^3 * (1 - pi)^7
q1.dta <- data.frame(pi, L)
q1.dta
# Which pi maximizes L on this coarse grid?
pi[which.max(L)]

# Q2: fine grid and plot#####

pi <- seq(0.01, 0.99, by = 0.01)
L  <- pi^3 * (1 - pi)^7

plot(pi, L, type = "l", xlab = expression(pi), ylab = "Likelihood L")
abline(v = 0.3, lty = 2)  # marks the MLE

# (optional) log-likelihood shape

ll <- 3*log(pi) + 7*log(1 - pi)         # ignores constants, concave curve
plot(pi, ll, type = "l", xlab = expression(pi), ylab = "log-likelihood")
abline(v = 0.3, lty = 2)
