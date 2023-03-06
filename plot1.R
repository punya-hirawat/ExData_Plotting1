##Reading all the data from the txt file
all_data = read.csv("household_power_consumption.txt", sep=";", na.strings = "?")


##Subsetting only the required dates
df = subset(all_data, Date %in% c('1/2/2007', '2/2/2007'))


##Plotting
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")


##Saving as png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
