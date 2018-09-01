# Script to overlay the plots, showing histogram and overlay the normal distribution, kernel density distribution and rug in histogram
# Swiss Fertility and Socioeconomic Indicators (1888) Data, from datasets package
# Standardized fertility measure and socio-economic indicators for each of 47 French-speaking provinces of Switzerland at about 1888.

require("datasets")
?swiss
data("swiss")

fertility <- swiss$Fertility

# Initial parameters to export the graph as png file

png("HistogramWithCurve.png",
    width = 888,
    height = 571)
	
par(oma = c(1, 1, 1, 1))
par(mar = c(4, 5, 2, 1))


# Plot1: Histogram
h <- hist(fertility,
          probability = TRUE,
          ylim = c(0, 0.04),
          xlim = c(30, 100),
          breaks = 11,
          col = "#E5E5E5",
          border = 0,
          main = "Fertility for 47 French-Speaking\nSwiss Provinces, C. 1888")

# Plot2: Normal Curve (if Prob = TRUE), overlaying over histogram, however by generating box plot we can find if the data is distributed evenly or not

curve(dnorm(x, mean = mean(fertility), sd = sd(fertility)),
      col = "red",
      lwd = 3,
      add = TRUE)

# Plot 3 & 4: Kernel Density lines (if Prob = TRUE)

lines(density(fertility), col = "Blue")	# simple density curve over plotted histogram
lines(density(fertility, adjust = 3), col = "darkgreen")	# density function adjusted for making the curve smooth

# Plot 5: Rug (lineplot under histogram)
rug(fertility, col = "red")

dev.off()  # turn of the png file

# Another example for overlayed curves, generated on the Edgar Anderson's Iris Data from datasets package

# This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, versicolor, and virginica.

# generating the histogram
h <- hist(iris$Petal.Length,
          probability = TRUE,
          # ylim = c(0, 0.04),
          # xlim = c(0, 8),
          breaks = 12,
          col = "#E5E5E5",
          border = 0,
          main = "Iris Petal Length",
          xlab = "Petal length of iris species")

# Plot 2 & 3: Kernel Density lines (if Prob = TRUE)
lines(density(iris$Petal.Length), col = "Blue")
lines(density(iris$Petal.Length, adjust = 3), col = "darkgreen")

# Plot 4: Rug (Lineplot under histogram)
rug(iris$Petal.Length, col = "red")

rm(list = ls())		# to clear out the working environment
