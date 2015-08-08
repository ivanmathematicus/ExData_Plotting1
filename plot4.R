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

#Plot4
png(filename = "plot4.png")

par(mfrow = c(2, 2))

#PLot[1,1]
# Create plot with no x axis and no x axis label
plot(seq_along(data[,"Global_active_power"]),data[,"Global_active_power"], 
     type = 'line', xaxt = 'n', ylab = "Global Active Power",
     xlab = NA)
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Global_active_power"])),
                        length = 3),labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 0.5 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Global_active_power"])),length = 3),
     par("usr")[3] - 0.5, labels = labels, xpd = TRUE)


#Plot[1,2]
plot(seq_along(data[,"Voltage"]),data[,"Voltage"], 
     ylab = "Voltage", type = 'line', xlab = NA, xaxt="n" )
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Global_active_power"])),
                        length = 3), labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 0.5 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Voltage"])),length = 3),
     par("usr")[3] - 1, labels = labels, xpd = TRUE)
text(max(seq_along(data[,"Voltage"]))/2,
     par("usr")[3] - 3, labels = 'datetime', xpd = TRUE)

#Plot[2,1]

plot(seq_along(data[,"Sub_metering_1"]),data[,"Sub_metering_1"], 
     ylab = "Energy sub metering", xaxt = 'n', xlab = NA, type = 'line')

lines(seq_along(data[,"Sub_metering_2"]),data[,"Sub_metering_2"], 
      ylab = "Energy sub metering", col ='red' )
lines(seq_along(data[,"Sub_metering_3"]),data[,"Sub_metering_3"], 
      ylab = "Energy sub metering", col ='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1), lwd = c(2.5,2.5), col = c("black", "red", "blue"), 
       bty ="n") 
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Global_active_power"])),
                        length = 3),labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 0.5 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Sub_metering_1"])),length = 3),
     par("usr")[3] - 3, labels = labels, xpd = TRUE)

#Plot[2,2]

plot(seq_along(data[,"Global_reactive_power"]),data[,"Global_reactive_power"], 
     ylab = "Global_reactive_power", type = 'l', xaxt = 'n', xlab = NA)
# Set up x axis with tick marks alone
axis(side = 1, at = seq(0, max(seq_along(data[,"Global_reactive_power"])),
                        length = 3), labels= FALSE)
# Create labels
labels <- c('Thu', 'Fri', 'Sat')
# plot x axis labels using:
# par("usr")[3] - 1 as the vertical placement
# xpd = TRUE to allow for text outside the plot region
text(seq(0, max(seq_along(data[,"Global_reactive_power"])),length = 3),
     par("usr")[3] - 0.05, labels = labels, xpd = TRUE)
text(max(seq_along(data[,"Global_reactive_power"]))/2,
     par("usr")[3] - 0.3, labels = 'datetime', xpd = TRUE)

dev.off()
