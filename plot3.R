library(lubridate)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- dmy(df$Date)
dates <- df$Date <= "2007-02-02" & df$Date >= "2007-02-01"
df1 <- df[dates,]
datetime <- paste(df1$Date, df1$Time)
df1$datetime <- as.POSIXct(datetime)

par(mfrow=c(1,1))

plot(df1$Sub_metering_1~df1$datetime, type="l", ylab="Energy sub metering", xlab="")
lines(df1$Sub_metering_2~df1$datetime,col='Red')
lines(df1$Sub_metering_3~df1$datetime,col='Blue')

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
      legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()