# Loading data.table package which contains the fread() function we are using to read files 
library(data.table)

#1 - Merging  the training and the test sets to create one data set.

#Reading files from the Working Directory to build the data sets
df_featature_test <-fread("./UCI HAR Dataset/test/X_test.txt")
df_featature_train <-fread("./UCI HAR Dataset/train/X_train.txt")
df_y_test <-fread("./UCI HAR Dataset/test/y_test.txt")
df_y_train <-fread("./UCI HAR Dataset/train/y_train.txt")
df_subject_train <-fread("./UCI HAR Dataset/train/subject_train.txt")
df_subject_test <-fread("./UCI HAR Dataset/test/subject_test.txt")

#combining train data frame feature  and test frame feature by rows to create the feature data frame
df_feature <- rbind(df_featature_train,df_featature_test)

# Reading features name from the file ./UCI HAR Dataset/features.txt
df_feature_names <- fread("./UCI HAR Dataset/features.txt")

# Storing feature name in the variable feature_name 
feature_names <- df_feature_names$V2

# Name the columns of the feature data frame  
names(df_feature) <- feature_names

#Combining train activity and test activity in order to  build the activity data frame which contain just one column
df_y <- rbind(df_y_train,df_y_test)

# name of the activity data frame
names(df_y) <- "activity"

#Combining train subject and test subject in order to  build the subject data frame which contain just one column
df_subject <- rbind(df_subject_train,df_subject_test)

#name of the subject data frame
names(df_subject) <- "subject"

#combining subject data frame  and feature data frame by column 
my_dataset <- cbind.data.frame(df_subject, df_feature)

#combining activity data frame by column on the right side
my_df1 <- cbind.data.frame(my_dataset, df_y)

#2 - Extracting the measurements on the mean and standard deviation for each measurement

# Loading dplyr package 
library(dplyr)
#extracting the mean and standard deviation from my_df1
df_mean_std <- cbind(select(my_df1, contains("mean()")),select(my_df1, contains("std()")))


#3 - Using descriptive activity names to name the activities in the data set

# Renaming the activity column in my_df1 dataset with the descriptive activity names 
my_df1$activity <- factor(my_df1$activity,
levels = c(1,2,3,4,5,6),
labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING", "STANDING", "LAYING")) 

#4 - Labelling the data set with descriptive variable names

# Replacing  minus "-" with  underscore "_" in all column name
names(df_mean_std) <- gsub("-","_",names(df_mean_std))

# Labelling X, Y and Z suffix in all column name respectively with XAXIS, YAXIS and ZAXIS to ease readability
names(df_mean_std) <- gsub("_X","_XAXIS",names(df_mean_std))
names(df_mean_std) <- gsub("_Y","_YAXIS",names(df_mean_std))
names(df_mean_std) <- gsub("_Z","_ZAXIS",names(df_mean_std))

#5 - Creating a second, independent tidy data set with the average of each variable for each activity and each subject

# First, we ,need to be able to identify any subject. We combine subject data frame on the left side with df_mean_std data 
# frame in a new data frame my_df5 data frame
my_df5 <- cbind.data.frame(df_subject, df_mean_std)

# Second, we need to information about the corresponding activity. We use mutate function from dplyr package to add the 
# activity data column on the right side of my_df5 data frame
my_df5 <- mutate (my_df5, activity =my_df1$activity)

# Creating the tidy data set with the average of each variable for each activity and each subject
my_tidydataset <- my_df5 %>% arrange (subject, activity) %>% group_by(subject, activity) %>% summarise_each(funs(mean))

# Writing the tidy dataset to the file tydy_dateset.txt
write.table(my_tidydataset, "tydy_dateset.txt", row.name=FALSE)