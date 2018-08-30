# This script is for visualization of quantitative variables using histogram

# Histogram for quantitative data, dataset used "Annual Canadian Lynx trappings 1821–1934" from R datasets package
# Annual numbers of lynx trappings for 1821–1934 in Canada. Taken from Brockwell & Davis (1991), this appears to be the series considered by Campbell & Walker (1977).
 
data("lynx")
hist(lynx)	# a simple histogram using hist function

#saving a histogram as an object
h <- hist(lynx,
     breaks = 11,	# Suggested bins explicitly but not bounded
     # bin breaks can be bounded explicitly using collection of values, below are two example
     # breaks = seq(0, 7000, by = 100),
     # breaks = c(0, 100, 300, 500, 3000, 3500, 7000),
     freq = FALSE,	# to generate proportional percentage or relative frequency, it allows superposition of bell curve
     col = "thistle1",
     main = "Histogram of annual Canadian Lynx Trappings\n1821-1934",
     xlab = "Number of Lynx Trapped")

# adding the distribution curve to the histogram using curve function to visualize the distribution of number of lynx trapped
# width of bin affects the distribution curve

curve(dnorm(x, mean = mean(lynx), sd = sd(lynx)), 
      col = "thistle4",
      lwd = 2,
      add = TRUE)
rm(list = ls()) 	# to clear out the working environment