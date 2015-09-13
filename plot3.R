# load data from file

hpc <- read.table("household_power_consumption.txt", header=TRUE, 
   sep=";", na.strings="?")

# transform date and time columns 
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# filter and retain the records asked (from "2007-02-01" until "2007-02-02")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ] 

# init png device
png("plot3.png", bg = "transparent")

plot(hpc$Time, hpc$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2, type="l", col= "red")
lines(hpc$Time, hpc$Sub_metering_3, type="l", col= "blue")

# add legend
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=c(1,1), col = c('black', 'red', 'blue'))

dev.off()


