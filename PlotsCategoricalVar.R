# This script is to find the distribution of the chick weight according to type of feed using bar plot and pie chart visualization

# About the data: An experiment was conducted to measure and compare the effectiveness of various feed supplements on the growth rate of chickens.

require("datasets")	# attach package datasets in the working environment
?chickwts			# help/information can be taken from the documents, this data set is about Chicken Weights by Feed Type from datasets pacakge of R
data("chickwts")	# load the chickwts data in working environment
str(chickwts)		# dataset structure can be obtained by str function

# Barplots for categorical variable, this is chicken count vs feed barplot

plot(chickwts$feed)	# plot function will plot the feed frequency

feeds <- table(chickwts$feed)	# Creating a table feeds using reference ($)

barplot(feeds)		# Simple barplot of feeds to show frequency of different feeds

barplot(feeds[order(feeds, decreasing = TRUE)]		# barplot in decreasing frequency of feeds

par(oma = c(1, 1, 1, 1))  # sets outside margins of barplot
par(mar = c(4, 5, 2, 1))  # Sets plots margins

# Many other arguments can be used to make visually better barplot, some are used in below barplot function

barplot(feeds[order(feeds)],
        horiz  = TRUE,
        las    = 1,  	# it gives the orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  	# No boarders on bars
        main   = "Frequencies on Different Feeds\nin chickwts Dataset",  # \n is line break
        xlab   = "Number of Chicks"
        )

# Pie Charts for categorical variable, chicken count vs feed in a pie chart visualization

pie(feeds)		# a simple pie plot of the feeds
?pie			# "?" is to get help from documents

# modifying the pie chart to make this pie chart interesting and colourful to visualize in a better way

pie(feeds[order(feeds, decreasing = TRUE)], 
    init.angle = 90,  # starts at 12 o'clock instead of 3
    clockwise = TRUE,
    col = rainbow(6),
    main = "Pie Chart of Feeds from chickwts")

rm(list = ls())		# to clear out the working environment