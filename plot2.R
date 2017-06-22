library(lubridate)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- dmy(df$Date)
dates <- df$Date <= "2007-02-02" & df$Date >= "2007-02-01"
df1 <- df[dates,]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)

par(mfrow=c(1,1))

plot(df1$Global_active_power~df1$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()