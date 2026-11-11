filepath <- "/Desktop/INST 314/MillionSongsFinal.csv"
songs <- read.csv(filepath)
head(songs)

songs <- MillionSongsFinal

str(songs)  #Question 1: this shows unit of observation.

ncol(songs) #Question 2: this shows numbers of clolumns.
dim(songs)[2]

nrow(songs) #Questions 3: this shows us the number of rows.
dim(songs)[1] 


str(songs) #Question 4: this will show us the types of variables and using help() could help us get more details.
help(songs)

require(dplyr) #Question 5: this will help us get the relationship between the mode and tempo.

pop_rock <- songs %>%
  filter(genre == "Classic Pop and Rock") %>%
  select(mode, tempo)
head(pop_rock)

require(dplyr) #Question 6: this is supposed to give the top 5 fastes and slowest songs in the database.
fastest_songs <- songs %>%
  arrange(desc(tempo)) %>%
  head(5)

slowest_songs <- songs %>%
  arrange(tempo) %>%
  head(5)


