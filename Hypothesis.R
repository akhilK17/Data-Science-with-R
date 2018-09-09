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