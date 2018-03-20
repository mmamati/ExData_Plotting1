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


########################################  End S Downloading Data ############################################################


#############################################  Plot 3 ######################################################################
power_07$DateTime<-as.POSIXct(paste(power_07$Date,power_07$Time) ,format = "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(
      power_07$DateTime,as.numeric(as.character(power_07$Sub_metering_1))
    , type="l"
    , xlab=""
    , ylab="Energy Sub metering")
 lines(power_07$DateTime,as.numeric(as.character(power_07$Sub_metering_2)), col="red")
 lines(power_07$DateTime,as.numeric(as.character(power_07$Sub_metering_3)), col="blue")    
 legend("topright", col=c("black","red","blue"), c("Sub metering 1","Sub metering 2  ", "Sub metering 3  "),lty=1,lwd=3)
dev.off()
 ######################################  End Plot 3 #############################################################################
 