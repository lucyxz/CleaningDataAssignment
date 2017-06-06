## Set up

setwd("D:/university/Self Learning/John Hopkins Getting & Cleaning Data/Assignment/CleaningDataAssignment")

install.packages("dplyr")
library(stats)
library(dplyr)

## Get Data

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "HAR data.zip")

unzip("HAR data.zip")

## Read Reference Tables

activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = " "
                             ,col.names = c("id","activity"))
features <- read.table("./UCI HAR Dataset/features.txt", sep = " "
                       , col.names = c("id","feature_metric_axis")
                       , stringsAsFactors = FALSE)

## Read Data files
## ReadHARDataFiles function
## Parameters:
## path: filepath
## set: "test" or "train"
## measurement: "body_acc" or "body_gyro" or "total_acc"

readHARDataFiles <- function(path = ".", measurement){
    
    ## Generate file paths
    filenamePat <- paste("((subject)|(/X)|(/y)|","(",measurement,"))",sep="")
    
    testFiles <- grep(paste("test(.*)",filenamePat,sep="")
                      ,dir(path, full.names = T, recursive = T),value = T)
    trainFiles <- grep(paste("train(.*)",filenamePat,sep="")
                       ,dir(path, full.names = T, recursive = T),value = T)
    
}

