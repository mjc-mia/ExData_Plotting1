# plot3.R - Code required for an overlaid plot of 3 sub-metering metrics

# Create directory for data files, download file from UCI, unzip and load it into data frame
if (!file.exists("data")) {
        dir.create("data")
}
url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="./data/power.zip")
list.files("./data")

unzip("./data/power.zip", exdir="./data")
list.files("./data")

power = read.delim("./data/household_power_consumption.txt", sep=";", header=T, 
                   stringsAsFactor = F, na.strings = "?")

# Convert date to more convenient format and extract two days' data into new data frame
power$DateTime = paste(power$Date, power$Time)
power$DateTime2 = strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

pwr = with(power, subset(power, Date == "1/2/2007" | Date == "2/2/2007"))


# Set up output to png, create histogram
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE
    )
par(mfrow = c(1,1))
with(pwr, plot(DateTime2, Sub_metering_1, type="l", 
               ylab="Energy sub metering", xlab=""))
with(pwr, lines(DateTime2, Sub_metering_2, type="l", xlab="", col="red"))
with(pwr, lines(DateTime2, Sub_metering_3, type="l", xlab="", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), pch="____")
dev.off() 
