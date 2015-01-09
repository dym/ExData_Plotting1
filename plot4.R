library(dplyr)

# read
mydf <- read.csv("data/household_cleandata.txt", sep=";", stringsAsFactors=FALSE)
household <- tbl_df(mydf)
rm(mydf)

# modify
household <- mutate(household, Datetime = as.POSIXct(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")))
household <- select(household, -(Date:Time))

# paint
png(filename = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
par(mfrow = c(2, 2))
## Global Active Power
with(household, plot(Datetime, Global_active_power,
                     ylab = "Global Active Power",
                     xlab = "",
                     type = "n"))
with(household, lines(Datetime, Global_active_power))                     
## Voltage
with(household, plot(Datetime, Voltage,
                     xlab = "datetime",
                     type = "n"))
with(household, lines(Datetime, Voltage))
## Energy sub metering
with(household, plot(Datetime, Sub_metering_1,
                     ylab = "Energy sub metering",
                     xlab = "",
                     type = "n"))
with(household, lines(Datetime, Sub_metering_1))
with(household, lines(Datetime, Sub_metering_2, col = "red"))
with(household, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1), bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Global Reactive Power
with(household, plot(Datetime, Global_reactive_power,
                     xlab = "datetime",
                     type = "n"))
with(household, lines(Datetime, Global_reactive_power))
dev.off()
