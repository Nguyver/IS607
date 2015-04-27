install.packages("rmongodb")

library(jsonlite)
library(rmongodb)

help("mongo.create")
mongo <- mongo.create()
mongo

#Test for connection to mongoDB
if(mongo.is.connected(mongo)==TRUE) {
  print("Connected")
}

#Get all Databases from MongoDB Connection
mongo.get.databases(mongo)


#Get all collections from MongoDB DB, test
db <- "test"
mongo.get.database.collections(mongo,db)

collection <- "test.nyt_hc"

#Get Count 
help("mongo.count")
mongo.count(mongo,collection)

test <- mongo.find.one(mongo, collection)
print(test)
btest <- mongo.bson.to.list(test)
print(btest)

