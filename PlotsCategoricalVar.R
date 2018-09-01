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
	
# Any chart can be exported in an image of format either png or jpeg by using png/jpeg function in R, example is below:
png("Barplot.png",	# Creating a dummy file named Barplot
    width = 888,	# define the size of the image
    height = 571)

# Set up the margins of image
par(oma = c(1, 1, 1, 1))
par(mar = c(4, 5, 2, 1))

# run the same barplot function with same parameter (described aboce) to plot the chart in the dummy file named Barplot.png
# any plot can be exported by using png/jpeg function

barplot(feeds[order(feeds)],
        horiz  = TRUE,
        las    = 1,  	# it gives the orientation of axis labels
        col    = c("beige", "blanchedalmond", "bisque1", "bisque2", "bisque3", "bisque4"),
        border = NA,  	# No boarders on bars
        main   = "Frequencies on Different Feeds\nin chickwts Dataset",  # \n is line break
        xlab   = "Number of Chicks"
        )

dev.off()	# this is mandatory parameter to close the file, without using this, the plot exporte process will not be compled.

rm(list = ls())		# to clear out the working environment