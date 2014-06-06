
#path <- "C:/_Data/_Data Science Courses/_DS Johns Jopkins/04 - Exploratory Data Analysis/Project 1"
#setwd(path)

## read the file
file <- "household_power_consumption.txt"
household_data <- read.csv(file, header=T, sep=';', na.strings="?", 
                      nrows=2075259)

## get only the date range needed for the plots
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y") # change the date format
data <- subset(household_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#remove household_data from memory
rm(household_data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## generate Plot 1
hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

## create the .png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
