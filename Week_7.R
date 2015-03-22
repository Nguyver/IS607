#Vuthy Nguy
#Week 7 Assignment
#Tidying and Transforming Data


#1)Write down 3 questions that you might want to answer based on this data.
#a. Who votes more, 16-24 or 25+\
#b. Does age group determine preferences
#c. Does location determine preferences

install.packages("tidyr")
install.packages("dplyr")

require("RCurl")
require(tidyr)
require(dplyr)

#2)Create an R data frame with 2 observations to store this data 
#in its current messy state.

url <- "https://raw.githubusercontent.com/Nguyver/IS607/master/vote_data.csv"
myData <- getURL(url, ssl.verifypeer=FALSE)
votes <- read.csv(textConnection(myData))

#3) Use the functionality in tidyr package to convert the date 
#frame to be "tidy data"
View(votes2)
votes <- slice(votes, 2:4)
colnames(votes) <- c("Vote","E.16-24", "E.25+", "G.16-24", "G.25+")

votes2 <- votes %>%
  gather(age, count, 2:5)

tidy <- votes2 %>%
  separate(age, into = c("location", "Age"), sep = "\\.") 

View(tidy)
tidy$location[tidy$location == 'E'] <- 'Edinburgh'
tidy$location[tidy$location == 'G'] <- 'Glasgow'

#4) Use the functionality in dplyr package to answer the 
#questions that you asked in step 1

filer(tidy, Age)

#5)Having gone through the process, would you ask different 
#questions and/or change the way that you structured your data frame?
