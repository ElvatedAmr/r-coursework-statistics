require(openintro)
data(gpa)

#Question 1
samp_mean <- mean(gpa$gpa)
samp_sd <- sd(gpa$gpa)
n <- nrow(gpa)
t_score <- (samp_mean - 3.2) / (samp_sd / sqrt(n))

p_value <- 1 - pt(t_score, df = n - 1)

#Question 2
lower_bound <- samp_mean - qt(0.995, n - 1) * samp_sd / sqrt(n)
upper_bound <- samp_mean + qt(0.995, n - 1) * samp_sd / sqrt(n)

t.test(gpa$gpa, conf.level = 0.99)

#Question 3
samp_mean <- mean(gpa$studyweek)
samp_sd <- sd(gpa$studyweek)
n <- nrow(gpa)
t_score <- (samp_mean - 20) / (samp_sd / sqrt(n))

p_value <- pt(t_score, df = n - 1)

#Question 4
lower_bound <- samp_mean - qt(0.95, n - 1) * samp_sd / sqrt(n)
upper_bound <- samp_mean + qt(0.95, n - 1) * samp_sd / sqrt(n)

t.test(gpa$studyweek, conf.level = 0.90)

#Question 5
samp_mean <- mean(gpa$out)
samp_sd <- sd(gpa$out)
n <- nrow(gpa)
lower_bound <- samp_mean - qt(0.975, n - 1) * samp_sd / sqrt(n)
upper_bound <- samp_mean + qt(0.975, n - 1) * samp_sd / sqrt(n)