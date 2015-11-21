## Getting-and-Cleaning-Data-Course-Project
This repository contains lesson 3 assigment files 
#  ```run_analysis.R``` 

* Require  ``data.table`` and ``dplyr`` libraries.
* All the source data files must be in the sub-directory /UCI HAR Dataset/ of the working directory. 
# The code contains  in ``run_analysis.R`` implements the above steps:
1. The data are loaded from the files using fread to build three data frames: feature data frame, subject data frame and activity data frame
2. Extract the mean and standard deviation column names from data, .
3. Process the data
 * by renaming the activity column t with the descriptive activity names
 * by labelling the data set with descriptive variable names
4.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
	This date frame is output to a file in working directory named tydy_dateset.txt
