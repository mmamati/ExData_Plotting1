### Script for Johns Hopkins Data Science Course 4
## Produces the four required graphs. 

#################################  Download data from website and Prepare ########################################################
# This step downloads the raw data and unzips it

# Set the working directory where the project is stored.
Dir<-  "C:/Users/Mike/Documents/Coursera/JohnsHopkinsDataScience/Course4EDA/Project1"
setwd(Dir)
#set the link to the data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#set the name of the outfile
zipfile<-paste(Dir,"Power_Consumption",sep="/")
#download the data
download.file(fileURL,zipfile)
#unzip
unzip(zipfile, files = NULL, list = FALSE, overwrite = TRUE)

#Open file
power<-read.table("household_power_Consumption.txt",sep=";", header=TRUE)

#Convert Date to a date
power$Date<-as.Date(power$Date,"%d/%m/%Y")

#Filter to dates of interest
power_07<-power[power$Date>="2007-02-01"& power$Date<="2007-02-02",]


########################################  End Downloading Data ############################################################

#############################################  Plot 1   ###############################################################
#Convert Global Active Power to a numeric. Note that it needs to go through character first because it's a factor

power_07$Global_active_power<-as.numeric(as.character(power_07$Global_active_power))

png("plot1.png", width=480, height=480)

hist(power_07$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

###########################################  End Plot 1 #############################################################################

