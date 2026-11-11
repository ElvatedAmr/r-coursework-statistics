require(openintro)
require(ggplot2)
data(ncbirths)

#Q.1
weight_model <- lm(weight ~ weeks, data = ncbirths)
summary(weight_model)

#Q.2
coef(weight_model)["weeks"]

#Q.3
coef(weight_model)["(Intercept)"]

#Q.4
weight_model2 <- lm(weight ~ weeks + visits, data = ncbirths)
summary(weight_model2)

#Q.5
plot(weight_model)

cor(ncbirths$weeks, ncbirths$weight, use = "complete.obs")
