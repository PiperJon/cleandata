

Codebook
--------
Getting and Cleaning Data Week 4 Project 
----------------------------------------
The following steps outline the process applied to produce two tidy datasets from the data 

1 Downloaded and unzipped the data files to "C:/Users/jonat/coursera/DS/cleandata/data", and set this as working directory.

2 Carried out exploratory analysis of dat files to gain insight of data structure

3 Loaded feature names, and identified names including "mean" or std.
  Feature names includes combinatioan of signals and vraibles estimated from them.
  Signals: 
	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag
    variables:
	mean(): Mean value
	std(): Standard deviation
	Note- list of variables in data includes severla more.  Only mean and standard deviation are used in this exercise.	
	Features are normalized and bounded within [-1,1]  	

4 Loaded dplyr  

5 Build training data table 
 
6 Read in subject data, adding header "Subject ID".  Each subject ID represents one of 30 volunteers observed.

7 Read in the table of activity ID numbers and labels

8 Read in activity data and merge to add activity labels

9 Read in training data output tables with all variables

10 Label training data output variables from features file

11 Select training data subset of variables including mean and std

12 Combine subject, activity and output tables to produce on training data frame.

13 Repeat steps 5-12 with test data in place of training data, t oproduce test data frame

14 Combine training and test data frames to produce single data frame in tidy format,	
	each variable in one column and each observation in one row. 

15 Write dataset to file

16 Use group_by and summarise to produece second dataset of averages of all variables, groupedd by subject and activity

17 Write averages data frame to file
