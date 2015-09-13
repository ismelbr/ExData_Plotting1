
# load data from file
hpc <- read.table("household_power_consumption.txt", header=TRUE, 
   sep=";", na.strings="?")

# transform date and time columns 
hpc$Time <- strptime(paste(hpc$Date, hpc$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y") 

# filter and retain the records asked (from "2007-02-01" until "2007-02-02")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02", ] 

# init png device
png("plot1.png", bg = "transparent")

hist(hpc$Global_active_power, main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)", xlim = c(0,8), axes = FALSE, col = "RED")

# set axis
axis(1, at=seq(0,6,by=2), labels=seq(0,6,by=2))
axis(2, at=seq(0,1200,by=200), labels=seq(0,1200,by=200))

dev.off()

