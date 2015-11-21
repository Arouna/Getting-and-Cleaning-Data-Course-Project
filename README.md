## Getting-and-Cleaning-Data-Course-Project
This repository contains lesson 3 assigment files 
#  ```run_analysis.R``` 

* Require  ``data.table`` and ``dplyr`` libraries.
 All the source data files must be in the sub-directory /UCI HAR Dataset/ of the working directory. 
 The code contains  in ``run_analysis.R`` implements the above steps:
* 1. The data are loaded from the files using fread function from the ``data.table`` library to build three data frames: feature data frame (df_feature), subject data frame (df_subject) and activity data frame (df_y). This three data frames are merged together to create the main data frame my_df1.
* 2. Extract all the columns containing "mean()" and  "sdt()" from the main data frame using select from ``dplyr`` package in conjunction with contains function. 
* 3. Process data to rename the activity column with the descriptive activity names
* 4. Process by labelling the main data frame my_df1 with descriptive variable names: all minus "-"  are replaced with  underscore "_" in all column names  and the X, Y and Z suffix in all column names are respectively replaced with XAXIS, YAXIS and ZAXIS to ease readability
* 5.  Create a second, independent tidy data set with the average of each variable for each activity and each subject.
	This date frame is output to a file in working directory named tydy_dateset.txt

The source code ``run_analysis.R`` contains all the necesary comments on each oh this step.
