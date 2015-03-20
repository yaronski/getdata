# Course Project
This CodeBook.md is about the data for R-Script  `run_analysis.R` created during the course project of the coursera Data Science Class "Getting and Cleaning Data". 
Here all the variables, the data, and any transformations or work  performed to clean up the data are described. 
 
### Original Data
Original data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Original description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

As described in the README.md file in the original data folder the data was derived from an experiment with people wearing a smartphone with sensors to collect the data over time during certain activities like sitting or walking.

It reads as follows:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

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

###Conclusion
The original data was collected from several files, merged together and processed into a tidy data set that is much easier to understand.