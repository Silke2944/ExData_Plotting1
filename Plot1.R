power <- read.table("household_power_consumption.txt",skip=1,sep=";")
head(power)
names(power)

# change the names of the variables 
names(power) <- c("Date","Time","Global_active_power", "Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
names(power)

# convert Date & Time variables to Date/Time classes 
power$Time <- strptime(power$Time, format = "%H:%M:%S")
class(power$Time)

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
class(power$Date)

# only use a subset of the data
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

# create the first plot
png("Plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()