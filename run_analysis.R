# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(data.table)
library(reshape2)

#File paths
testFileS <- "./UCI HAR Dataset/test/subject_test.txt"
testFileX <- "./UCI HAR Dataset/test/X_test.txt"
testFileY <- "./UCI HAR Dataset/test/y_test.txt"

trainFileS <- "./UCI HAR Dataset/train/subject_train.txt"
trainFileX <- "./UCI HAR Dataset/train/X_train.txt"
trainFileY <- "./UCI HAR Dataset/train/y_train.txt"

featuresFile <- "./UCI HAR Dataset/features.txt"
actLabelFile <- "./UCI HAR Dataset/activity_labels.txt"

#Load data
testS <- read.table(testFileS, header = FALSE)
testX <- read.table(testFileX, header = FALSE)
testY <- read.table(testFileY, header = FALSE)

trainS <- read.table(trainFileS, header = FALSE)
trainX <- read.table(trainFileX, header = FALSE)
trainY <- read.table(trainFileY, header = FALSE)

features <- read.table(featuresFile, header = FALSE)[,2]
actLabels <- read.table(actLabelFile, header = FALSE)[,2]

#Clean Data
names(testX) = features
names(trainX) = features

#Extracts only the measurements on the mean and standard deviation for each measurement. 
goodVal <- grep("-mean()|-std()", features)
featuresGood <- features[goodVal]
featuresGood <- as.character(featuresGood)

testX <- testX[,featuresGood]
trainX <- trainX[,featuresGood]

testY[,2] = actLabels[testY[,1]]
names(testY) = c("Activity_ID", "Activity_Label")
names(testS) = "Subject_ID"

trainY[,2] = actLabels[trainY[,1]]
names(trainY) = c("Activity_ID", "Activity_Label")
names(trainS) = "Subject_ID"

mergedTest <- cbind(testX, as.data.table(testS), testY)
mergedTrain <- cbind(trainX, as.data.table(trainS), trainY)

# Merges the training and the test sets to create one data set.
mergedData <- rbind(mergedTrain, mergedTest)

id_vars = c("Activity_ID", "Activity_Label", "Subject_ID") #namestrainy+namesrtrains
data_labels = setdiff(colnames(mergedData), id_vars)
meltedData <- melt(mergedData, id = id_vars, measure.vars = data_labels)
castData <- dcast(meltedData, Subject_ID + Activity_Label ~ variable, mean) 

# castData <- aggregate(mergedData, by=list(), mean)

names(castData) <- gsub("BodyBody", "Body", names(castData))
names(castData) <- gsub("Acc", "Accelerometer", names(castData))
names(castData) <- gsub("^t", "Time", names(castData))
names(castData) <- gsub("Mag", "Magnitude", names(castData))
names(castData) <- gsub("^f", "Frequency", names(castData))
names(castData) <- gsub("Gyro", "Gyroscope", names(castData))
names(castData) <- gsub("std", "StandardDeviation", names(castData))
names(castData) <- gsub("\\(\\)", "", names(castData))

write.table(castData, file = "./coursProject_data.txt", col.names = TRUE, row.names = FALSE)