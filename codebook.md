# CodeBook

This codebook describes the data source and  transformation  made in order to clean the data in the analysis.

## The data source and the description

* Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Information about the origin of the data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its 
embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was 
selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec
 and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
 Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore
 a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The data

The dataset use in this analysis includes the following files:

* README.txt

* features_info.txt: Shows information about the variables used on the feature vector.

* features.txt: List of all features.

* activity_labels.txt: Links the class labels with their activity name.

* train/X_train.txt: Training set.

* train/y_train.txt: Training labels.

* test/X_test.txt: Test set.

* test/y_test.txt: Test labels.

* subject_test.txt

* subject_train.txt

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
* 'test/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 

* 'test/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'test/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


In this analysis, we have not use any data included in the inertia folder 

## Transformation details

There are 5 parts:

1. Merges the training and the test sets to create one data set.
In this part we begin by:
 1.1 - Creating the feature data frame combining 2 data frame :train data frame feature  and test frame feature by rows. 
We obtain train data frame feature  and test frame feature respectively from the files ./UCI HAR Dataset/test/X_test.txt and ./UCI HAR Dataset/train/X_train.txt.
To name the columns in feature data frame, we take the data from the ./UCI HAR Dataset/features.txt file

 1.2 - Combining train activity and test activity in order to  build the activity data frame which contain just one column

 1.3 - Combining train subject and test subject in order to  build the subject data frame which contain just one column

 After creating the three preceding data frame, we combine subject data frame on the left with the feature data frame by column 
 generating my_dataset data frame. This data frame is column combined with activity data frame on the right to create the final data frame : my_df1 
 
 2. The value in the activity column have been renamed with the descriptive activity names as follow:
    1 -> WALKING, 
	2 -> WALKING_UPSTAIRS
    3 -> WALKING_DOWNSTAIRS
	4 -> SITTING
	5 -> STANDING
	6 -> LAYING

3. Labelling the data set with descriptive variable names
To do this all minus "-" has been replaced with with  underscore "_" in all column name and the X, Y and Z suffix in all column name 
respectively with XAXIS, YAXIS and ZAXIS to ease readability





