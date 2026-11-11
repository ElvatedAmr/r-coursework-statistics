songs <- read.csv("~/Desktop/INST 314/MillionSongsFinal.csv")

#question 1
key_tab <- table(songs$key)
print(key_tab)

key_test <- chisq.test(key_tab, correct = FALSE)
print(key_test)

print(key_test$expected)

#question 2
mode_key_tab <- table(songs$mode, songs$key)
print(mode_key_tab)

mode_key_test <- chisq.test(mode_key_tab, correct = FALSE)
print(mode_key_test)

print(mode_key_test$expected)

#question 3
key_time_tab <- table(songs$key, songs$time_signature)
print(key_time_tab)

key_time_test <- chisq.test(key_time_tab, correct = FALSE)
print(key_time_test)

print(key_time_test$expected)
