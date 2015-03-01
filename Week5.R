#install.packages("RPostgreSQL", dep=TRUE)

library("RPostgreSQL")

dbname <-"flights"
dbuser <-"postgres"
dbhost <-"localhost"
dbpass <-"vuthy"
dbport <-5432

#Create Connection
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, host=dbhost, port=dbport, dbname=dbname, user=dbuser, password=dbpass)

#Read DB tables
flights_df <- dbReadTable(con, "flights")
planes_df <- dbReadTable(con, "planes")
weather_df <- dbReadTable(con, "weather")

# View (flights_df)
# View (planes_df)
# View (weather_df)
# View (flight.plane.df)
# View (flight.plane.weather.df)
# View (flight.data)
# View (flight.data.lax)
# View (flight.data.lax.dates1)
# View (flight.data.lax.dates2)

#Keeping only wanted information
planes_df <- subset(planes_df, select = c(1,7))
weather_df <- subset(weather_df, select = c(1:6))

weather <- c("origin", "year", "month", "day", "hour")
keeper <- c("origin", "dest", "year", "month", "day", "carrier", "temp", "dep_delay", "arr_delay", "air_time", "seats")

#Merge the Datasets
flight.plane.df <- merge(flights_df, planes_df, by="tailnum")
flight.plane.weather.df <- merge(flight.plane.df, weather_df, by=weather)

flight.data <- subset(flight.plane.weather.df, select = keeper)

#Keep only flights going to LAX
flight.data.lax <- flight.data[flight.data$dest=='LAX',]
(flight.data.lax[flight.data.lax$origin=='JFK',])

#Keep only flights between 2/23/2013 and 3/1/2013
flight.data.lax.dates1 <- subset(flight.data.lax, month==2 & day >=22)
flight.data.lax.dates2 <- subset(flight.data.lax, month==3 & day ==1)

i.finally.got.it <-rbind (flight.data.lax.dates1, flight.data.lax.dates2)
View (i.finally.got.it)

#cleanup and closes connection
dbClearResult(rs)
dbDisconnect(con)
dbUnloadDriver(drv)
