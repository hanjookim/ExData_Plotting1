setwd("C:/My Documents/Company Work/LA County/Exploratory Data Analysis")
getwd()

##Retrieve the data
rawdata <- read.table("./household_power_consumption.txt", header=TRUE,
                      sep=";", stringsAsFactors=FALSE, na.strings="?")

##Convert Date
rawdata$Date  <- as.Date(rawdata$Date, format='%d/%m/%Y')

##Subset the data
subsetData <- subset(rawdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

##Plot
hist(subsetData$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

##Save the plot as PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

