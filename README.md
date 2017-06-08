# CleaningDataAssignment
Coursera John Hopkins Getting &amp; Cleaning Data Assignment

### Data source
[UCI Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Key Files
* ReadMe.md
* CodeBook.md
* run_analysis.R
  * contains function `run_analysis(path = "./UCI HAR Dataset")`
  * converts source data into the HAR tidy data.csv dataset
  * requires packages dplyr and tidyr
* HAR tidy data.csv
  * final tidy dataset of averages for subject, activity and measurement
  * To read into R: `tidyData <- read.csv("HAR tidy data.csv")`
