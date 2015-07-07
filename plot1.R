#read data file
consumption <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors = F)

# subset for dates 01-02-2007 and 02-02-2007
consumption <- subset(consumption, consumption$Date  == "1/2/2007" | consumption$Date  == "2/2/2007")

# create png file
png("plot1.png", width=480, height=480)

# Draw histogram
hist(as.numeric(consumption$Global_active_power ), xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")

# close file
dev.off()


