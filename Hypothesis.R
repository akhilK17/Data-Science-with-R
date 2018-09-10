# Single proportion: Hypothesis test and Confidence interval

# prop.test function gives the hypothesis test result that the proportion or probability of success in several groups are same
# we get 98 success in 162 trials of any random sample, run a hypothesis that to verify the probability of success is 0.5, and this result came just because of random chance

prop.test(98, 162)	

# Null Hypothesis "H0": Probability of success is 0.5, or 98 success in 162 trials is just because of random chance
# Alternate Hypothesis "Ha": Probability of success is not 0.5, or 98 success in 162 trials is not because of random chance
# take the significant level of 5% to run this hypothesis
# significant level 5% mean, if the p-value of hypothesis is less than 0.05 than we will reject the null hypothesis
# Given statement always considered as true for null hypothesis

# Outcome of this function explained below
# 1-sample proportions test with continuity correction
# data:  98 out of 162, null probability 0.5
# X-squared = 6.7222, df = 1, p-value = 0.009522
# alternative hypothesis: true p is not equal to 0.5
# 95 percent confidence interval:
#         0.5249531 0.6798650
# sample estimates:
#         p 
# 0.6049383 

# The conclusion is, getting 98 success can not because of random chance as P-value (0.009522) is much lower than 0.05

# One tailed (Greater we are specifying) test with 90% CI, the same prop.test function can be used to conduct one tailed hypothesis test
# In the above example we can't conclude that probability of the sample is higher or lower than .5 as we conducted the hypothesis test for both side of the distribution
# By one tailed test we can find if the probability is higher or lower
# a one-tailed is a statistical test in which the critical area of a distribution is one-sided, it is either greater than or less than a certain value, but not both.
# If the sample being tested falls into the one-sided critical area, the alternative hypothesis will be accepted instead of the null hypothesis.

prop.test(98, 162, alternative = "greater", conf.level = .90)

# outcome is below
# 1-sample proportions test with continuity correction
# 
# data:  98 out of 162, null probability 0.5
# X-squared = 6.7222, df = 1, p-value = 0.004761
# alternative hypothesis: true p is greater than 0.5
# 90 percent confidence interval:
#         0.5517784 1.0000000
# sample estimates:
#         p 
# 0.6049383

# Conclusion is p-value is 0.004761 < 0.05, so we reject the null hypothesis
# In other words we can say that there are less than 5% (or .46%) chance that this outcome arrived because of randomness
# It can be also stated as "it is extremely unlikely to get 98 success in 162 trials where probability of success is 0.5"


# Single mean: Hypothesis test and Confidence interval
# Hypothesis test to find the earthquake magnitude is greater than 4 on reactor scale
?quakes	# Locations of Earthquakes off Fiji
# The data set give the locations of 1000 seismic events of MB > 4.0. The events occurred in a cube near Fiji since 1964.

str(quakes)	# gives the internal structure in concise manner of the dataset quakes
head(quakes)	# gives the first few rows of dataframe

mag <- quakes$mag	# creating a collection of magnitude of quake named as vector mag

# Default t.test function runs t-test on data and compares the mean with 0
# The t test is one type of inferential statistics.
# It is used to determine whether there is a significant difference between the means of two groups.
# Null Hypothesis "H0": The magnitude of the quake is 0
# Alternate Hypothesis "Ha": The magnitude of the quake is not 4

t.test(mag)

# Using the same t.test function for one tailed t-test by saying mean of magnitude is greater 4
# Null Hypothesis "H0": The magnitude of the quake is 4
# Alternate Hypothesis "Ha": The magnitude of the quake is greater than 4

t.test(mag, alternative = "greater", mu = 4)

# p value comes after running this script is: 2.2e-16
# on significance level of 5%, we can reject the null hypothesis as the p-value is much smaller than 0.05

# Single categorical variable: One sample Chi-square test
# a statistical method assessing the goodness of fit between a set of observed values and those expected theoretically

?HairEyeColor	# Distribution of hair and eye color and sex in 592 statistics students
str(HairEyeColor)
HairEyeColor

margin.table(HairEyeColor, 1)	# Get the marginal frequency for Hair color
margin.table(HairEyeColor, 2)	# Get the marginal frequency for eye color
margin.table(HairEyeColor, 3)	# Get the marginal frequency for sex

eyes <- margin.table(HairEyeColor, 2)	# assigning the margin table for eye to a new vector
round(prop.table(eyes), 2)  # capturing the proportion of the frequency and rounding it till 2 decimal
# Pearson's Chi-squared test, Need one dimensional goodness-of-fit test
# Default test (assume equal distribution)
chiTest1 <- chisq.test(eyes)
chiTest1

# outcome of this test
# Chi-squared test for given probabilities
# 
# data:  eyes
# X-squared = 133.47, df = 3, p-value < 2.2e-16
# Hence p value is smaller than significance level, we can reject the null hypothesis against the statement that the eye color distribution is equal among the people

# Below mentioned probabilities are from population eye statistics, now conducting the chi square test against these probabilities
chiTest2 <- chisq.test(eyes, p = c(.41, .32, .15, .12))
chiTest2

# H0: Distribution of people based on eye colour in sample HairEyeColor and population are same or sample is matching with population
# Ha: Distribution of people based on eye colour in sample HairEyeColor and population are not equal same or sample is different from population
# outcome of this test
# Chi-squared test for given probabilities
# 
# data:  eyes
# X-squared = 6.4717, df = 3, p-value = 0.09079
# With these new probability the new p-value is 0.09 which is greater than significant value 0.05
# the sample which gave the probabilities in this new test is fit with the dataset HairEyeColor
# As p-value is greater than significance level 0.05 so we fail to reject the null hypothesis which says that the eye color distribution probability is matching with the sample we have