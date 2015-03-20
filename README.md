# Course Project
This repo is about the course project of the coursera Data Science Class "Getting and Cleaning Data". 
For details about the project, the data or the variables please read the CodeBook.md.

### Preparation
- Download the data and unzip it into your current working directory.
- Make sure the libraries `reshape2`, `dplyr` and `data.table` are installed.

###The script
`run_analysis.R` does the following:
- load the test and train data as well as the features and the activity labels
- rename the columns of the train and test data
- Extract only the measurements on the mean and standard deviation for each measurement.
- Merge the training and the test sets to create one data set.
- reorganize the data set so that the Subject_ID column is followed by the Activity_Label followed by all the processed data.
-  calculate the average of each variable for each activity and each subject
- substitute name parts of the processed data columns with more descriptive variable names. 
- write the data set to a file called `coursProject_data.txt`