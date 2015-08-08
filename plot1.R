#Calculating memory requirements
2075259* 9 * 8/1073741824
#0.139157 GB
#Load the data
initial <- read.table('household_power_consumption.txt', header=TRUE, nrow=2, 
                      sep=';', as.is=TRUE)
classes <- sapply(initial, class)
data <- read.table('household_power_consumption.txt', header=TRUE, sep=';', 
                   as.is=TRUE, colClasses = classes, na.strings = "?")

# extract the data from 2007-02-01 to 2007-02-02
index <- data[,1]=='1/2/2007' | data[,1]=='2/2/2007'
data <- data[index,]


#Used reference:https://stat.ethz.ch/pipermail/r-help/2004-September/057069.html

#Plot1 
png(filename = "plot1.png")

# Create plot with no x and y axis and no x axis 
hist(data[,"Global_active_power"], col = 'red' , main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

dev.off()
