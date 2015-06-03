setwd("C:/My Documents/Company Work/LA County/Exploratory Data Analysis")
getwd()

##Retrieve the data
rawdata <- read.table("./household_power_consumption.txt", header=TRUE,
                      sep=";", stringsAsFactors=FALSE, na.strings="?")

##Convert Date
rawdata$Date <- as.Date(rawdata$Date, format="%d/%m/%Y")

##Subset the data
subsetData <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Convert Date and Time
DateTime <- paste(as.Date(subsetData$Date), subsetData$Time)
subsetData$DateTime <- as.POSIXct(DateTime)

##Plot
plot(subsetData$DateTime, subsetData$Sub_metering_1, type="l",
     xlab=" ", ylab="Energy sub metering")
lines(subsetData$DateTime, subsetData$Sub_metering_2, col='red')
lines(subsetData$DateTime, subsetData$Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=2, cex=0.8)

##Save the plot as PNG
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

