

### Install packages###
install.packages(c("haven", "ggplot2", "dplyr", "readxl", "writexl", "tidyr"))
library(haven)
library(tidyverse)
###Loading the dataset#####
growgam1 <- read_dta("growgam1.dta")
View(growgam1)
dat_gg <- growgam1
# Convert sex to factor#####
dat_gg$sex <- as_factor(dat_gg$sex)

# Check data structure
str(dat_gg)

###(a)(ii) Count observations and missing values######

# Number of observations
nrow(dat_gg)
ncol(dat_gg
# Count missing values for each variable
colSums(is.na(dat_gg))

#####################
A#A II, Check for implausible values::; This means checking whether any variable has impossible values (e.g. negative weight, zero length, unrealistic ages).
########################################

summary(dat_gg)

# Example logic check

dat_gg %>% filter(age < 0 | wt < 1 | len < 30)

##########b) Boxplot comparing length by sex##############

ggplot(dat_gg, aes(x = sex, y = len, fill = sex)) +
  geom_boxplot() +
  labs(title = "Child Length by Sex", x = "Sex", y = "Length (cm)") +
  theme_minimal()

##########Interpretation:;;;;If the box for males is higher, males are on average taller; if they overlap strongly,
there’s little difference.###

#####(c) Summary statistics by sex#################

sum_by_sex <- dat_gg %>%
  group_by(sex) %>%
  summarise(
    mean_len = mean(len, na.rm = TRUE),
    median_len = median(len, na.rm = TRUE),
    sd_len = sd(len, na.rm = TRUE))

sum_by_sex

###########d) Linear regression model (length ~ sex)#########

lm_sex <- lm(len ~ sex, data = dat_gg)
summary(lm_sex)


#######e) One-way ANOVA (length by sex)##########

anova_mdl <- aov(len ~ sex, data = dat_gg)
summary(anova_mdl)

########E),  Weight vs. length scatterplot and regression#######

ggplot(dat_gg, aes(x = wt, y = len)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  labs(title = "Association between Weight and Length",
       x = "Weight (kg)", y = "Length (cm)") +
  theme_minimal()

lm_wt_len <- lm(len ~ wt, data = dat_gg)
summary(lm_wt_len)




