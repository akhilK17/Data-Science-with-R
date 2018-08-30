# This script is for visualization of quantitative variables using box plot
# box plot is useful to find outliers, symmetry in the distribution
# box plot shows quartile ranges, mid line is median. It shows the symmetry around median of sample data
# Quartile ranges are: Minimum, First Quartile, Median (Second Quartile), Third Quartile and Maximum (any dots before min or after max are outliers)

# "Lawyers' Ratings of State Judges in the US Superior Court" data from datasets package
?USJudgeRatings
data("USJudgeRatings")

boxplot(USJudgeRatings$RTEN)	# a simple box plot for variable worth of retention to find the symmetry of retention rating around median

# Horizontal box plot is easily understandable, and its more attentive to show information when the width of box plot also plotted in the size of quartile ranges
# By modifying the width with the size of quartile range, one can easily understand that which quartile is bigger than other

boxplot(USJudgeRatings$RTEN,
        horizontal = TRUE,
        las = 1,  # makes all the labels horizontal
        notch = TRUE,
        ylim = c(0, 10),
        col = colors()[602],
        boxwex = 0.5,  # width of the box with the proportional of the original
        whisklty = 1,
        staplelty = 0,
        outpch = 16,
        outcol = colors()[602],
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1997)",
        xlab = "Lawyers' Rating")

# We can make the boxplot for all the rating parameter with single boxplot function
boxplot(USJudgeRatings,
        horizontal = TRUE,
        las = 1,  # makes all the labels hoizontal
        notch = TRUE,
        ylim = c(0, 10),
        col = colors()[602],
        boxwex = 0.5,  # width of the box with the proportinal of the original
        whisklty = 1,
        staplelty = 0,
        outpch = 16,
        outcol = colors()[602],
        main = "Lawyers' Ratings of State Judges in the\nUS Superior Court (c. 1997)",
        xlab = "Lawyers' Rating")

rm(list = ls())		# to clear out the working environment