# loading packages and importing the data
library(tidyr)
library(dplyr)
library(readxl)
titanic3 <- read_excel("~/Downloads/titanic3.xls")
View(titanic3)
# the last row is empty, so deleting it
titanic3 <- titanic3[-1310,]

# view all possible values in embark column
unique(titanic3$embarked)
# change the NA's into S's. (unique function didn't come up with any 
# spaces or empty character strings as suggested in directions)
titanic3$embarked[which(is.na(titanic3$embarked))] <- 'S'

# finding mean of ages and replacing NA values with it
mean_age <- mean(titanic3$age, na.rm = TRUE)
titanic3$age[which(is.na(titanic3$age))] <- mean_age

# locating all missing boat values and replacing with 'None'
titanic3$boat[which(is.na(titanic3$boat))] <- 'None'

# new column indicating if cabin number is known
titanic3$has_cabin_number <- as.numeric(!is.na(titanic3$cabin))

View(titanic3)