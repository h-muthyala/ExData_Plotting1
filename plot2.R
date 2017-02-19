filename <- "../Raw Data/household_power_consumption.txt";

orig_data <- read.table(filename, sep=";", header= T, na.strings = "?", check.names = F, stringsAsFactors = F);
reqd_data <- orig_data[orig_data$Date %in% c("1/2/2007", "2/2/2007") , ];

datetime <- strptime(paste(reqd_data$Date, reqd_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S");
global_active_power <- as.numeric(reqd_data$Global_active_power);

png("plot2.png", width = 480, height = 480);
plot(datetime, global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)");
dev.off();

rm(filename);
rm(datetime);
rm(global_active_power);
rm(orig_data);
rm(reqd_data);

