###########################################################
# Final Project Analysis Script
###########################################################

# set working directory
setwd("/courses/STA145/guarraa4")

library(tidyverse)

# Load data
data <- read_csv("~/FINAL PROJECT - data.csv")

# Create complete case dataset
data_complete <- data %>% 
  filter(complete.cases(.))

# Descriptive Stats
table(data_complete$gender_of_artist)
prop.table(table(data_complete$gender_of_artist))

table(data_complete$explicit_or_clean)
prop.table(table(data_complete$explicit_or_clean))

# Contingency Table
gender_explicit_table <- table(
  data_complete$gender_of_artist,
  data_complete$explicit_or_clean
)

gender_explicit_table

###########################################################
# BARPLOT (removes the 1–3 on x-axis, adds clear labels)
###########################################################

barplot(gender_explicit_table,
        beside = TRUE,
        col = c("grey40", "grey70"),
        legend = c("Explicit", "Clean"),
        names.arg = c("Female", "Male", "Group/Mixed"),
        xlab = "Gender of Artist",
        ylab = "Number of Songs",
        main = "Gender of Artist by Explicitness")

###########################################################
# Chi-Square Test
###########################################################

chisq.test(gender_explicit_table)

# Expected Counts
chisq.test(gender_explicit_table)$expected

# View variable names (optional)
names(data)


