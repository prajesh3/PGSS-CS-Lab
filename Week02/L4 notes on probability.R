simulated_normalDistData <- rnorm(n = 10000, mean = 0, sd = 1)
# a greater n gives a more symmetrical and well distributed plot
plot(density(simulated_normalDistData))


# > qnorm(.05, mean = 0, sd = 1)    if the area in the tails should be .05, the x value each way is -1.645...
# [1] -1.644854
# > qnorm(.025, mean = 0, sd = 1)
# [1] -1.959964
# > pnorm(6*1, mean = 0, sd = 1)
# [1] 1
# > pnorm(2*1, mean = 0, sd = 1)    if the two ends of acceptable data (tolerance), then the prob that you are within tolerance is .977...
# [1] 0.9772499
# > pnorm(1*1, mean = 0, sd = 1)
# [1] 0.8413447