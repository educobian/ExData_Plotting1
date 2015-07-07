# read data file
consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = F)

# subset for dates 01-02-2007 and 02-02-2007
consumption <- subset(consumption, consumption$Date  == "1/2/2007" | consumption$Date  == "2/2/2007")

# create new field joining date & time
consumption$datetime <- strptime(paste(consumption$Date, consumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# create empty png file
png("plot3.png", width=480, height=480)

# Draw plot in png file
with(consumption, plot(consumption$datetime, as.numeric(consumption$Sub_metering_1 ), type="n", ylab="Energy sub metering", xlab=""))
lines(consumption$datetime, as.numeric(consumption$Sub_metering_1), col="black")
lines(consumption$datetime, as.numeric(consumption$Sub_metering_2), col="red")
lines(consumption$datetime, as.numeric(consumption$Sub_metering_3), col="blue")
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close file
dev.off()


