require(openintro)
require(ggplot2)

songs <- read.csv("~/Desktop/INST 314/MillionSongsFinal.csv")

songs$key <- factor(songs$key)
songs$mode <- factor(songs$mode)
songs$genre <- factor(songs$genre)

#question 1
ggplot(songs, aes(x=key, y=duration)) + geom_boxplot() + facet_wrap(~mode)

key_mode_anova <- aov(duration ~ key*mode, data=songs)
summary(key_mode_anova)

#question 2
ggplot(songs, aes(x=genre, y=duration)) + geom_boxplot() + facet_wrap(~mode)

genre_mode_anova <- aov(duration ~ genre*mode, data=songs)
summary(genre_mode_anova)
