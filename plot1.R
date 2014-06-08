# plot1.R - Code required for a simple histogram

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
power$Date = as.Date(power$Date, format = "%d/%m/%Y")
pwr = with(power, subset(power, Date == "2007-02-01" | Date == "2007-02-02"))


# Set up output to png, create histogram, turn off png output
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE
    )

hist(pwr$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)",
     col = "red", ylim = c(0, 1200))

dev.off() 