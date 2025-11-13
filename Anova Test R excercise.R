#####Anova test for the larvae 

###Install packages###
install.packages(c("haven", "ggplot2", "dplyr", "readxl", "writexl", "tidyr"))
library(haven)
library(tidyverse)

############Loading the Dataset#######

larvae <- read_dta("larvae.dta")
 View(larvae)
 
 # Summarise variables
 summary(larvae)
 
 # Make sure group is categorical
 larvae$group <- as_factor(larvae$group)
 
 # Distribution plot
 ggplot(larvae, aes(x = group, y = lcount, fill = group)) +
   geom_boxplot() +
   labs(title = "Larvae Count by Treatment Group", x = "Group", y = "Larvae Count") +
   theme_minimal()
 
 ###(a)(iv) Group means and SDs####
 
 larvae %>%
   group_by(group) %>%
   summarise(
     mean_count = mean(lcount, na.rm = TRUE),
     sd_count   = sd(lcount, na.rm = TRUE))
 
 ##########(b) One-way ANOVA
 
 anova_larvae <- aov(lcount ~ group, data = larvae)
 summary(anova_larvae)
 
########## (c) Regression with categorical groups########
 
 lm_larvae <- lm(lcount ~ group, data = larvae)
 summary(lm_larvae)
 
##########(D)
 anova_larvae <- aov(lcount ~ group, data = larvae)
 summary(anova_larvae)
 
#############
 
 
 
 
 
 