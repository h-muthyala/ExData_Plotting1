filename <- "../Raw Data/household_power_consumption.txt";

orig_data <- read.table(filename, sep=";", header= T, na.strings = "?", check.names = F, stringsAsFactors = F);
reqd_data <- orig_data[orig_data$Date %in% c("1/2/2007", "2/2/2007") , ];

datetime <- strptime(paste(reqd_data$Date, reqd_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");

png("plot4.png", width = 480, height = 480);
par(mfrow = c(2, 2));

# graph 1
plot(datetime, reqd_data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power", col = "black");

# graph 2
plot(datetime, reqd_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage");

# graph 3
plot(datetime, as.numeric(reqd_data$Sub_metering_1), type = "l", col = "black", xlab = "", ylab = "Energy sub metering");
lines(datetime, as.numeric(reqd_data$Sub_metering_2), type = "l", col = "red");
lines(datetime, as.numeric(reqd_data$Sub_metering_3), type = "l", col = "blue");
legend("topright", legend = c("Sub_metering_1", "sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1);

# graph 4
plot(datetime, reqd_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power");

dev.off();

rm(filename);
rm(datetime);
rm(orig_data);
rm(reqd_data);
