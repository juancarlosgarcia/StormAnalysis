library(googleVis)
library(reshape)
library(shiny)



raw.data <- read.csv(bzfile("repdata-data-StormData.csv.bz2"))

raw.data <- raw.data[(raw.data$FATALITIES>0)|(raw.data$INJURIES>0)|raw.data$PROPDMG>0|raw.data$CROPDMG>0,]

raw.data$date<-strptime(raw.data$BGN_DATE,"%m/%d/%Y")
raw.data$year<-strftime(raw.data$date,"%Y")
