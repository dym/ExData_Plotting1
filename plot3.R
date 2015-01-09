library(dplyr)

# read
mydf <- read.csv("data/household_cleandata.txt", sep=";", stringsAsFactors=FALSE)
household <- tbl_df(mydf)
rm(mydf)

# modify
household <- mutate(household, Datetime = as.POSIXct(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")))
household <- select(household, -(Date:Time))

# paint
png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(household, plot(Datetime, Sub_metering_1,
                     ylab = "Energy sub metering",
                     xlab = "",
                     type = "n"))
with(household, lines(Datetime, Sub_metering_1))
with(household, lines(Datetime, Sub_metering_2, col = "red"))
with(household, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty=c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
