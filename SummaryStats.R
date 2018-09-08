# Converting the collection of data into a frequency table

# making the collection of different colors using "c" function

groups <- c(rep("blue", 3990),
            rep("red", 4110),
            rep("orange", 1890),
            rep("green", 3770),
            rep("purple", 855))

# Frequency table creation using table function
groups.t1 <- table(groups)
groups.t1

# Modifying the frequency table to create frequency in a specific order(increasing/decreasing number
groups.t2 <- sort(groups.t1, decreasing = TRUE)
groups.t2

# Proportion of table, to find the each color contribution percentage among all the frequency table
prop.table(groups.t2)
round(prop.table(groups.t2), 2)
round(prop.table(groups.t2), 2) * 100

# Calculating Descriptive statistics on cars dataset, where data is about "Speed and Stopping Distances of Cars"

require("datasets")
?cars
head(cars)	# get first few data items from large amount of data to see the data organizationation
str(cars)	# to get the structure of data

summary(cars$speed)	# summary function gives the all the boundaries of data (min, max, mean, median, 1st and 3rd quartile)

# this function can be used on individual variable or on entire dataframe on a single run
summary(cars)

fivenum(cars$speed)	# this function also can be used to compute five number summary of data (min, lower hinge, median, upper-hinge, max)

boxplot.stats(cars$speed)	# to get the exact number of boxplot summary, function boxplot.stats can be used

# psych is a package which can be used to perform all kind of summary statistics on the entire dataset using a single function "describe"

help(package = "psych")	# help function can get document which is available on web for the package
install.packages("psych")
require(psych)

describe(cars)

detach("package:psych", unload = TRUE)	# detaching the attached package after use

rm(list = ls())