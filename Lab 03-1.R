require(openintro)
require(dplyr)
require(ggplot2)

data(satgpa)

str(satgpa)
names(satgpa)
data("satgpa", package = "openintro")
head(satgpa)

#question 1
mean_v <- mean(satgpa$sat_v)
sd_v <- sd(satgpa$sat_v)
mean_m <- mean(satgpa$sat_m)
sd_m <- sd(satgpa$sat_m)

#question 2
sum(satgpa$sat_v >= mean_v - sd_v & satgpa$sat_v <= mean_v + sd_v) / nrow(satgpa)
sum(satgpa$sat_v >= mean_v - 2*sd_v & satgpa$sat_v <= mean_v + 2*sd_v) / nrow(satgpa)


pnorm(1) - pnorm(-1)
pnorm(2) - pnorm(-2)

#This is for maths part
sum(satgpa$sat_m >= mean_m - sd_m & satgpa$sat_m <= mean_m + sd_m) / nrow(satgpa)
sum(satgpa$sat_m >= mean_m - 2*sd_m & satgpa$sat_m <= mean_m + 2*sd_m) / nrow(satgpa)

#question 3
satgpa[3,]

z_v <- (560 - mean_v) / sd_v
z_m <- (600 - mean_m) / sd_m
z_v
z_m

1 - pnorm(560, mean_v, sd_v)
1 - pnorm(600, mean_m, sd_m)

#question 4
qnorm(0.95, mean_m, sd_m)

#question 5
qnorm(0.90, mean_v, sd_v)

#question 6
hist(satgpa$sat_v, main="SAT Verbal", breaks=20)
hist(satgpa$sat_m, main="SAT Math", breaks=20)

qqnorm(satgpa$sat_v)
qqline(satgpa$sat_v)

qqnorm(satgpa$sat_m)
qqline(satgpa$sat_m)
