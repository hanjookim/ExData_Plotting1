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
plot(subsetData$DateTime, subsetData$Global_active_power, type="l",
     xlab=" ", ylab="Global Active Power (kilowatts)")

##Save the plot as PNG
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()

