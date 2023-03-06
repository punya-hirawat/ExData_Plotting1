##Reading all the data from the txt file
all_data = read.csv("household_power_consumption.txt", sep=";", na.strings = "?")


##Subsetting only the required dates
df = subset(all_data, Date %in% c('1/2/2007', '2/2/2007'))


##Converting to POSIXct datetime
df$Date = as.POSIXct(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time)) 


##Setting parameters for Graphic device
par(mfrow=c(2,2), mar=c(4,4,2,1))


##Plotting the different data
with(df, {
          plot(Global_active_power~Date, type='l', ylab="Global Active Power (kilowatts)", xlab="")
          plot(Voltage~Date, type='l', ylab="Voltage (volt)", xlab='')
          plot(Sub_metering_1~Date, type='l', ylab='Global Active Power (kilowatts)', xlab='') 
          lines(Sub_metering_2~Date, col="red")
          lines(Sub_metering_3~Date, col="blue")
          legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)
          plot(Global_reactive_power~Date, type='l', ylab="Global Reactive Power (kilowatts)", xlab='')
          })


##Saving as png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()