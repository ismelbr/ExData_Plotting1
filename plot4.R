# load data from file

hpc <- read.table("household_power_consumption.txt", header=TRUE, 
   sep=";", na.strings="?")

# transform date and time columns 
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# filter and retain the records asked (from "2007-02-01" until "2007-02-02")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ] 

# init png device
png("plot4.png", bg = "transparent")

# create a grid of 2x2 plots
par(mfcol = c(2, 2))

with(hpc, {
	plot(Time, Global_active_power, type="l", xlab= "", ylab = "Global Active Power")
	
	plot(Time, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
	lines(Time, Sub_metering_2, type="l", col= "red")
	lines(Time, Sub_metering_3, type="l", col= "blue")

	legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1), col = c('black', 'red', 'blue'), bty= "n")	
	
	plot(Time, Voltage, type="l", xlab = "datetime")
	
	plot(Time, Global_reactive_power, type="l", xlab = "datetime")
})

dev.off()


