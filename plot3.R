##Reading all the data from the txt file
all_data = read.csv("household_power_consumption.txt", sep=";", na.strings = "?")


##Subsetting only the required dates
df = subset(all_data, Date %in% c('1/2/2007', '2/2/2007'))


##Converting to POSIXct datetime
df$Date = as.POSIXct(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time)) 


#Plotting the line graph
with(df, {
  plot(Sub_metering_1~Date, type='l', ylab='Global Active Power (kilowatts)', xlab='') 
  lines(Sub_metering_2~Date, col="red")
  lines(Sub_metering_3~Date, col="blue")})


##Adding the legend
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)


##Saving as png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
