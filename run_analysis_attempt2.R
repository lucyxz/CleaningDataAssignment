run_anlaysis <- function(path="./UCI HAR Dataset"){
    
    actLabPath <- paste(path, "/activity_labels.txt", sep = "")
    featuresPath <- paste(path, "/features.txt", sep = "")
    subTestPath <- paste(path, "/test/subject_test.txt", sep = "")
    subTrainPath <- paste(path, "/train/subject_train.txt", sep = "")
    setTestPath <- paste(path, "/test/X_test.txt", sep = "")
    setTrainPath <- paste(path, "/train/X_train.txt", sep = "")
    labTestPath <- paste(path, "/test/y_test.txt", sep = "")
    labTrainPath <- paste(path, "/train/y_train.txt", sep = "")
    
    activityLabels <- read.table(actLabPath, sep = " "
                                 , col.names = c("activityID", "activity"))
    features <- read.table(featuresPath, sep = " "
                           , col.names = c("featureID","feature"))
    setTest <- read.table(setTestPath)
    setTrain <- read.table(setTrainPath)
    subTest <- read.table(subTestPath, col.names = c("subjectID"))
    subTrain <- read.table(subTrainPath, col.names = c("subjectID"))
    labelsTest <- read.table(labTestPath, col.names = c("activityID"))
    labelsTrain <- read.table(labTrainPath, col.names = c("activityID"))
    
    colnames(setTest) <- features$feature
    colnames(setTrain) <- features$feature
    
    pattern <- "(mean\\(\\))|(std\\(\\))"
    
    tuncTest <- setTest[,grep(pattern, names(setTest), value = TRUE)]
    tuncTrain <- setTrain[,grep(pattern, names(setTrain), value = TRUE)]
    
    test <- cbind(subTest, labelsTest, tuncTest)
    train <- cbind(subTrain, labelsTrain, tuncTrain)
    
    allSets <- rbind(test, train)
    
    merged <- merge(activityLabels, allSets)
    
    gathered <- gather(merged, measure_metric_axis, value
                       , -(activityID:subjectID))
    
    splitCol <- strsplit(gathered$measure_metric_axis,"-")
    
    cols <- sapply(1:3
                   ,function(i) sapply(1:length(splitCol)
                                       , function(x) splitCol[[x]][i])) 
    colnames(cols) <- c("measure", "metric", "axis")
    
    rejoin <- cbind(gathered,cols)
    
    final <- select(rejoin, subjectID, activityID, activity, measure, metric
                    , axis, value)
}