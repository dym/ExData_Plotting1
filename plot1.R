library(dplyr)

# read
mydf <- read.csv("data/household_cleandata.txt", sep=";", stringsAsFactors=FALSE)
household <- tbl_df(mydf)
rm(mydf)

# modify
household <- mutate(household, Datetime = as.POSIXct(strptime(paste(Date, Time, sep=" "), "%d/%m/%Y %H:%M:%S")))
household <- select(household, -(Date:Time))

# paint
png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
with(household, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off()
