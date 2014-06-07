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
power$Date = as.Date(power$Date, format = "%d/%m/%Y")

pwr = with(power, subset(power, Date == "2007-02-01" | Date == "2007-02-02"))
