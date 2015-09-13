# load data from file

hpc <- read.table("household_power_consumption.txt", header=TRUE, 
   sep=";", na.strings="?")

# transform date and time columns 
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# filter and retain the records asked (from "2007-02-01" until "2007-02-02")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ] 

# init png device
png("plot2.png", bg = "transparent")

plot(hpc$Time, hpc$Global_active_power, type="l", xlab= "", ylab = "Global Active Power (kilowatts)")
dev.off()


