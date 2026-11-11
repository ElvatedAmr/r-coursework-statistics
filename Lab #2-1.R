#Q.1
require(dplyr)
require(ggplot2)

moocs <- read.csv('~/Downloads/MoocsFinal.csv')

# Check on the dataset
head(moocs)
str(moocs)
nrow(moocs)
ncol(moocs)

# make sure that nforum_posts is numeric
moocs$nforum_posts <- as.numeric(moocs$nforum_posts)

# make sure that certification status is categorical
moocs$certified <- as.factor(moocs$certified)

# Q.2 
summary(moocs$nforum_posts)
mean(moocs$nforum_posts, na.rm = TRUE)
sd(moocs$nforum_posts, na.rm = TRUE)

table(moocs$certified)
prop.table(table(moocs$certified))

#Histogram
ggplot(moocs, aes(x = nforum_posts)) + 
  geom_histogram(binwidth = 5) +
  xlab("Number of Forum Posts") +
  ylab("Count") +
  ggtitle("Distribution of Forum Posts")

# Bar chart
ggplot(moocs, aes(x = certified)) + 
  geom_bar() +
  xlab("Certification Status") +
  ylab("Count") +
  ggtitle("Distribution of Certification Status")

# Q.3 
if("LoE_DI" %in% colnames(moocs)) {
  moocs$LoE_DI <- as.factor(moocs$LoE_DI)
  
  ggplot(moocs, aes(x = LoE_DI, fill = certified)) + 
    geom_bar() +
    labs(fill = "Certified") +
    xlab("Education Level") +
    ylab("Count") +
    ggtitle("Certification Status by Education Level")
} else {
  print("LoE_DI column not found.")
}

# Q.4
ggplot(moocs, aes(x = certified, y = nforum_posts)) + 
  geom_boxplot() +
  xlab("Certification Status") +
  ylab("Number of Forum Posts") +
  ggtitle("Forum Posts by Certification Status")

ggplot(moocs, aes(x = certified, y = nforum_posts)) + 
  geom_boxplot() +
  ylim(0, 50) +
  xlab("Certification Status") +
  ylab("Number of Forum Posts") +
  ggtitle("Forum Posts by Certification Status (Zoomed)")

# Q.5 
if("LoE_DI" %in% colnames(moocs)) {
  lower_ed_students <- moocs %>%
    filter(LoE_DI %in% c("Less than Secondary", "Secondary"))
  
  ggplot(lower_ed_students, aes(x = certified, y = nforum_posts)) + 
    geom_boxplot() +
    xlab("Certification Status") +
    ylab("Number of Forum Posts") +
    ggtitle("Forum Posts by Certification Status\nfor Students Below Bachelor's Level") +
    ylim(0, 50)
} else {
  print("LoE_DI column not found.")
}

