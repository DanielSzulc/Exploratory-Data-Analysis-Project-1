##plot1

##loading data
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,"power_consump.zip")
unzip("power_consump.zip")
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)



##conversion of date into R date format
hpc[,"Date"]<-as.Date(hpc[,"Date"],format="%d/%m/%Y")


##creating subset of data including only relevant dates:  2007-02-01 and 2007-02-02
sub_hpc<-data[hpc$Date>=as.Date("2007-02-01") & hpc$Date<=as.Date("2007-02-02"),]


##converting format of relevant variable to numeric
sub_hpc[,"Global_active_power"]<-as.numeric(sub_hpc[,"Global_active_power"])


## creating plot and saving in png file
png(filename="plot1.png",width=480,height=480,units="px")
hist(sub_hpc$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
