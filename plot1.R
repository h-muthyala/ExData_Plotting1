filename <- "../Raw Data/household_power_consumption.txt";

orig_data <- read.table(filename, sep=";", header= T, na.strings = "?", check.names = F, stringsAsFactors = F);
reqd_data <- orig_data[orig_data$Date %in% c("1/2/2007", "2/2/2007") , ] 

png("plot1.png", width = 480, height = 480);
hist(reqd_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red");
dev.off();

rm(orig_data);
rm(reqd_data);

