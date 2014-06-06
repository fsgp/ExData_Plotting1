## read the file
file <- "household_power_consumption.txt"
household_data <- read.csv(file, header=T, sep=';', na.strings="?", 
                           nrows=2075259, stringsAsFactors=FALSE)

## get only the date range needed for the plots
household_data$Date <- as.Date(household_data$Date, format="%d/%m/%Y") # change the date format
plot_data <- subset(household_data, Date >= "2007-02-01" & Date <= "2007-02-02")

## create datetime variable
datetime <- paste(as.Date(plot_data$Date), plot_data$Time)
plot_data$Datetime <- as.POSIXct(datetime)

#remove household_data from memory
rm(household_data)

## generate Plot 3
with(plot_data, {
                    plot(Sub_metering_1 ~ Datetime, 
                         type="l",
                         ylab="Energy sub metering", 
                         xlab="")
                    lines(Sub_metering_2 ~ Datetime, col='Red')
                    lines(Sub_metering_3 ~ Datetime, col='Blue')
                })

legend("topright", 
       col=c("black", "red", "blue"), 
       lty=1, 
       lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )

##remove plot_data from memory
rm(plot_data)

## create the .png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()