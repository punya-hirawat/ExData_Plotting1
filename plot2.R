##Reading all the data from the txt file
all_data = read.csv("household_power_consumption.txt", sep=";", na.strings = "?")


##Subsetting only the required dates
df = subset(all_data, Date %in% c('1/2/2007', '2/2/2007'))


##Converting to POSIXct datetime
df$Date = as.POSIXct(paste(as.Date(df$Date, format="%d/%m/%Y"), df$Time)) 


##Plotting the line graph
with(df, plot(Global_active_power~Date, type='l', ylab="Global Active Power (kilowatts)", xlab=""))


##Saving as png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
