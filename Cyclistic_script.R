#__________________________PREPARE AND CLEANING_________________________________
#Import all datasets
df20191<-read.csv("C:\\Users\\Usuario\\Documents\\Data Analytics\\Case Study Bikes\\df2019\\df2019.csv")
df20192<-read.csv("C:\\Users\\Usuario\\Documents\\Data Analytics\\Case Study Bikes\\df2019\\df2019_2.csv")
df20193<-read.csv("C:\\Users\\Usuario\\Documents\\Data Analytics\\Case Study Bikes\\df2019\\df2019_3.csv")
df20194<-read.csv("C:\\Users\\Usuario\\Documents\\Data Analytics\\Case Study Bikes\\df2019\\df2019_4.csv")

#Install packages
install.packages("dplyr") 
install.packages("janitor") 
install.packages("lubridate") 
install.packages("tidyr")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("reshape2")
install.packages("knitr")

#Load packages
library("dplyr") 
library("janitor") 
library("lubridate") 
library("tidyr")
library("tidyverse")
library("ggplot2")
library("reshape2")
library("knitr")

#Check column names to bind all datasets into one
colnames(df20191)
colnames(df20192)
colnames(df20193)
colnames(df20194)

#Fix column names to match
df20192<-df20192 %>% 
  rename(trip_id = X01...Rental.Details.Rental.ID) %>% 
  rename(start_time = X01...Rental.Details.Local.Start.Time) %>% 
  rename(end_time = X01...Rental.Details.Local.End.Time) %>% 
  rename(bikeid = X01...Rental.Details.Bike.ID) %>% 
  rename(tripduration = X01...Rental.Details.Duration.In.Seconds.Uncapped) %>% 
  rename(from_station_id = X03...Rental.Start.Station.ID) %>% 
  rename(from_station_name = X03...Rental.Start.Station.Name) %>% 
  rename(to_station_id = X02...Rental.End.Station.ID) %>%   
  rename(to_station_name = X02...Rental.End.Station.Name) %>% 
  rename(usertype = User.Type) %>% 
  rename(gender = Member.Gender) %>% 
  rename(birthyear= X05...Member.Details.Member.Birthday.Year)

#Check column names match
colnames(df20191)
colnames(df20192)
colnames(df20193)
colnames(df20194)

#bind all dataframes into one
Cyclistic_data_2019 <- rbind(df20191, df20192, df20193, df20194)

#View the new dataframe with all information combined
View(Cyclistic_data_2019)


#Hide previous dataframes
rm(df20191, df20192, df20193, df20194)


#Clean names and remove empty rows
Cyclistic_data_2019<-clean_names(Cyclistic_data_2019)
remove_empty(Cyclistic_data_2019, which = c ())


#Review and correct the data type of each column.
str(Cyclistic_data_2019)
Cyclistic_data_2019$start_time<-as.POSIXct(Cyclistic_data_2019$start_time)
Cyclistic_data_2019$end_time<-as.POSIXct(Cyclistic_data_2019$end_time)

#The 'tripduration' column has many N/A values, so I'll assign a formula to it to confirm that all values are accurate.
Cyclistic_data_2019$tripduration <- difftime(Cyclistic_data_2019$end_time, Cyclistic_data_2019$start_time, units = "secs")



#Specify in the column name "tripduration" that the unit is seconds
Cyclistic_data_2019<-Cyclistic_data_2019 %>% 
  rename(tripduration_seconds=tripduration)
Cyclistic_data_2019$tripduration_seconds <- as.integer(Cyclistic_data_2019$tripduration_seconds)


#Check that all values in "tripduration_seconds" are > 0
negative_tripdurations<- any(Cyclistic_data_2019$tripduration_seconds < 0)

# Assign a minimum value of 0 to negative values in 'tripduration_seconds'
Cyclistic_data_2019$tripduration_seconds[Cyclistic_data_2019$tripduration_seconds < 0] <- 0

#Check that all values in "tripduration_seconds" are > 0
negative_tripdurations<- any(Cyclistic_data_2019$tripduration_seconds < 0)

#Check that there are only 2 user types to avoid type errors
unique_usertypes<-unique(Cyclistic_data_2019$usertype)
print(unique_usertypes)

#Create new columns necessary for the analysis
Sys.setlocale("LC_TIME", "en_US.UTF-8")
Cyclistic_data_2019$day_of_week <- weekdays(Cyclistic_data_2019$start_time)
Cyclistic_data_2019$month <- format(Cyclistic_data_2019$start_time, "%B")
Cyclistic_data_2019$hour <- hour(Cyclistic_data_2019$start_time)

#________________________________ANALYSIS_______________________________________

#### AVERAGE TRIP DURATION BY USERTYPE ####

#Calculate the average trip duration based on user type.
average_trip_duration <- Cyclistic_data_2019 %>%
  group_by(usertype) %>%
  summarize(avg_trip_duration_seconds = round(mean(tripduration_seconds)))

#Convert result to format hh:mm:ss
average_trip_duration$avg_tripduration <- sprintf(
  "%02d:%02d:%02d",
  average_trip_duration$avg_trip_duration_seconds %/% 3600,
  (average_trip_duration$avg_trip_duration_seconds %% 3600) %/% 60,
  average_trip_duration$avg_trip_duration_seconds %% 60
)

#Create plot including usertype and avg_tripduration
ggplot(average_trip_duration, aes(x = usertype, y = avg_tripduration)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "Average Trip Duration by User Type",
       x = "User Type",
       y = "Average Trip Duration") +
  theme_minimal()

#### PERCENTAGE OF TRIPS MADE BY USERTYPE ####

percentage_data <- Cyclistic_data_2019 %>%
  group_by(usertype) %>%
  summarize(percentage = n() / nrow(Cyclistic_data_2019) * 100)

ggplot(percentage_data, aes(x = "", y = percentage, fill = usertype, label = sprintf("%.2f%%", percentage))) +
  geom_bar(stat = "identity", width = 1) +
  geom_text(aes(label = sprintf("%.2f%%", percentage)), position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  labs(title = "Percentage of trips made by usertype",
       fill = "User Type") +
  theme_minimal() +
  theme(axis.text = element_blank(),
        axis.title = element_blank(),
        panel.grid = element_blank())

#### TRIPS BY USERTYPE DURING THE WEEK ####


#DATAFRAME

trips_by_usertype_through_Week <- dcast(Cyclistic_data_2019, day_of_week ~ usertype, fun.aggregate = length, value.var = "usertype")

#PLOT

Cyclistic_data_2019$day_of_week <- factor(Cyclistic_data_2019$day_of_week, 
                                          levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

gg <- ggplot(Cyclistic_data_2019, aes(x = day_of_week, fill = usertype)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("blue", "orange")) +
  labs(title = "Trips by usertypes during the week",
       x = "Day of week",
       y = "Number of trips",
       fill = "Usertype") +
  scale_y_continuous(labels = scales::number_format())

print(gg)


#### TRIPS BY USERTYPE DURING THE YEAR ####


#DATAFRAME
Trips_by_usertype_through_year <- dcast(Cyclistic_data_2019, month ~ usertype, fun.aggregate = length, value.var = "usertype")
View(Trips_by_usertype_through_year)


#PLOT

Cyclistic_data_2019$month <- factor(Cyclistic_data_2019$month,
                                    levels = c("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))
gg2 <- ggplot(Cyclistic_data_2019, aes(x = month, fill = usertype)) +
  geom_bar(position = "dodge") +
  scale_fill_manual(values = c("blue", "orange")) +
  labs(title = "Trips by usertypes during the year",
       x = "Month",
       y = "Number of trips",
       fill = "Usertype") +
  scale_y_continuous(labels = scales::number_format())

print(gg2)

#### Trips by usertype during the day ####

#Dataframe

trips_by_usertype_through_day <- dcast(Cyclistic_data_2019, hour ~ usertype, fun.aggregate = length, value.var = "usertype")

#Plot

melted_df <- melt(trips_by_usertype_through_day, id.vars = "hour")

gg3 <- ggplot(melted_df, aes(x = hour, y = value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Trips by hour and usertype",
       x = "Hour of day",
       y = "Number of trips",
       fill = "Usertype") +
  scale_fill_manual(values = c("Customer" = "blue", "Subscriber" = "orange")) +
  scale_y_continuous(labels = scales::number_format())

print (gg3)

#### Most popular stations ####

top_10_from_stations <- head(sort(table(Cyclistic_data_2019$from_station_name), decreasing = TRUE), 10)
top_10_from_stations <- data.frame(Station = names(top_10_from_stations), Frequency = as.numeric(top_10_from_stations))


top_10_to_stations <- head(sort(table(Cyclistic_data_2019$to_station_name), decreasing = TRUE), 10)
top_10_to_stations <- data.frame(Station = names(top_10_to_stations), Frequency = as.numeric(top_10_to_stations))

top_stations <- intersect(top_10_from_stations$Station, top_10_to_stations$Station)
top_stations <- data.frame(Station = top_stations)
