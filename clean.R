
## Set the directory for the datafiles
setwd("C:/Users/jonat/coursera/DS/cleandata/data")

library(dplyr)

## data structure 
## train 7532 observations for each of:-
## X_ train 561 columns, one for each feature, 
## features specified in features.txt
## y_train identifies activity category 1 to 6
## subject identifies subject, 21 integers selected from, integers 1 to 30 
## X_ train 561 columns, one for each feature, 
## features specified in features.txt
## body_acc x,y,z;  body_gyro x,y,z ; total acc x,y,z  NOT USED
## total_acc x,y,z NOT USED
## build the train table, combining subject/activity/data

allFeatures <- read.table("features.txt", stringsAsFactors = FALSE)
colnames(allFeatures) <- c("FeatureNum","Feature")
selectFeatures <- grep(("-mean|-std"),allFeatures$Feature)

## First build training data table 



## subjects (individuals being observed)
## read the subject data
subject <- read.table("subject_train.txt")  
names(subject) <- "SubjectID"

## activities
##  read in the table of activity ID numbers and labels
activityNames <-read.table("activity_labels.txt")
## set column names
colnames(activityNames) <- c("ActivityNumber","Activity")
## format labels to lower case
activityNames$Activity <- tolower(gsub("_"," ",activityNames$Activity))
## read in activity data
activityData  <- read.table("y_train.txt")
names(activityData) <- "ActivityNumber"
## merge names to data
activities <- merge(activityData,activityNames)


## read in the data measurements
data <- read.table("X_train.txt")
## set column names from feature list
colnames(data) <- allFeatures$Feature
## select required data, means and standard deviations
selectData<- data[,selectFeatures]

## combine columns of subject, activities and selected data, add a first column label "train"
train <- cbind(subject, activities, selectData)


## test data structure similar to Train, with 2947 observations
## subject identifies subject, 9 integers selected from, integers 1 to 30 
## Second build test data table 

subject <- read.table("subject_test.txt")  
names(subject) <- "SubjectID"
activityData  <- read.table("y_test.txt")
names(activityData) <- "ActivityNumber"
activities <- merge(activityData,activityNames)
data <- read.table("X_test.txt")
colnames(data) <- allFeatures$Feature
selectData<- data[,selectFeatures]
test <- cbind(subject, activities, selectData)


## Combine train and test datasets
mean_and_sd_dataset <- rbind(train,test)

write(mean_and_sd_dataset,  "C:/Users/jonat/coursera/DS/cleandata/repos/mean_and_sd_datset.txt")

## group data by subject and activity
grouped_data <- group_by(mean_and_sd_dataset, SubjectID, ActivityNumber, Activity)
## summarise as means
averages_dataset <- summarise_all(grouped_data,funs(mean))

write(averages_dataset,  "C:/Users/jonat/coursera/DS/cleandata/repos/averages.txt")

