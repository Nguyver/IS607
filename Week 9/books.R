library(XML)
library(RCurl)
library(rjson)

#setwd("F:/Dropbox/MSDA/2015S/IS607/Assignments/Week 9")
#getwd()

url.html <- "https://raw.githubusercontent.com/Nguyver/IS607/master/Week%209/books.html"
url.xml <- "https://raw.githubusercontent.com/Nguyver/IS607/master/Week%209/books.xml"
url.json <- "https://raw.githubusercontent.com/Nguyver/IS607/master/Week%209/books.json"

my.html <- getURL(url.html, ssl.verifypeer=FALSE)
my.xml <- getURL(url.xml, ssl.verifypeer=FALSE)
my.json <- getURL(url.json, ssl.verifypeer=FALSE)

books.html <- readHTMLTable(my.html)
books.xml <- xmlParse(my.xml)
books.json <- fromJSON(my.json)

print(books.html)
print(books.xml)
print(books.json)


#The three file formats look completely different