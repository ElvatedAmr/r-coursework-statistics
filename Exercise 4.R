cars_data <- read.csv("/Users/amr/Downloads/USA_cars_datasets.csv")

str(cars_data)

head(cars_data)

unique(cars_data$title_status)
unique(cars_data$brand)

colSums(is.na(cars_data[, c("price", "title_status", "brand")]))

table(cars_data$title_status)
table(cars_data$brand)

summary(cars_data)

# Set alpha level
alpha <- 0.05

# Question 1: t-test for comparing the average price between clean and salvage title cars
clean_salvage <- cars_data %>%
  filter(title_status %in% c("clean vehicle", "salvage insurance")) %>%
  select(price, title_status)

# t-test
t_test_result <- t.test(price ~ title_status, data = clean_salvage)

# Print t-test result
print(t_test_result)

# Check if p-value is less than alpha level
if (t_test_result$p.value < alpha) {
  print("Reject the null hypothesis. The price difference is significant.")
} else {
  print("Fail to reject the null hypothesis. The price difference is not significant")
}

# Question 2: Chi-squared test between car brand and title status
brand_title_table <- table(cars_data$brand, cars_data$title_status)

# Perform the Chi-squared test
chi_result <- chisq.test(brand_title_table, simulate.p.value = TRUE, B = 10000)

# Print chi-squared test result
print(chi_result)

# Check if p-value is less than alpha level
if (chi_result$p.value < alpha) {
  print("Reject the null hypothesis. A significant association exists between car brand and title status.")
} else {
  print("Fail to reject the null hypothesis. There is no connection between the brand of the car and title status.")
}
