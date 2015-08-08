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

#Plot3
png(filename = "plot3.png")

plot(seq_along(data[,"Sub_metering_1"]),data[,"Sub_metering_1"], 
     ylab = "Energy sub metering", xaxt='n', xlab = NA, type = 'line')

lines(seq_along(data[,"Sub_metering_2"]),data[,"Sub_metering_2"], 
      ylab = "Energy sub metering", col ='red' )
lines(seq_along(data[,"Sub_metering_3"]),data[,"Sub_metering_3"], 
      ylab = "Energy sub metering", col ='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), lwd = c(2.5,2.5), col = c("black", "red", "blue")) 
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Sub_metering_1"])),
                        length = 3),labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 0.5 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Global_active_power"])),length = 3),
     par("usr")[3] - 2, labels = labels, xpd = TRUE)

dev.off()
