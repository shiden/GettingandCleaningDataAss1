## 1. Merges the training and the test sets to create one data set.
##Extracts only the measurements on the mean and standard deviation for each measurement.
##Uses descriptive activity names to name the activities in the data set
##Appropriately labels the data set with descriptive variable names.
##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## load library files data.table, dplyr)
library(data.table, dplyr)

## Variables
fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'


## Check if the file exists, if not download it and unzip the file currrent working directory

if (!file.exists('./Dataset.zip')){
  download.file(fileurl,destfile='./Dataset.zip')
  unzip("Dataset.zip", exdir = getwd())
}


## - 'features_info.txt': Shows information about the variables used on the feature vector.
## - 'features.txt': List of all features.
## - 'activity_labels.txt': Links the class labels with their activity name.
## - 'train/X_train.txt': Training set.
## - 'train/y_train.txt': Training labels.
## - 'test/X_test.txt': Test set.
## - 'test/y_test.txt': Test labels.

## load activity data
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt",  fill = TRUE , header = FALSE )

##load features data
features <- read.table("UCI HAR Dataset/features.txt",  fill = TRUE , header = FALSE )
f_info <- read.table("UCI HAR Dataset/features_info.txt",  fill = TRUE , header = FALSE )

## Load test data
x_test<- read.table("UCI HAR Dataset/test/X_test.txt",  fill = TRUE , header = FALSE )
y_test<- read.table("UCI HAR Dataset/test/y_test.txt",  fill = TRUE , header = FALSE )
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt",  fill = TRUE , header = FALSE )

## Load train data
x_train<- read.table("UCI HAR Dataset/train/X_train.txt",  fill = TRUE , header = FALSE )
y_train<- read.table("UCI HAR Dataset/train/y_train.txt",  fill = TRUE , header = FALSE )
subject_train <-read.table("UCI HAR Dataset/train/subject_train.txt",  fill = TRUE , header = FALSE )

#bind the rows into one dataset

subject_data <- rbind(subject_train,subject_test)
setnames(subject_data, "V1", "Subject")
y_data <- rbind(y_train,y_test)
setnames(y_data,"V1", "activityNum")
x_data <- rbind(x_train,x_test)

##merging columns

par_data <- cbind(subject_data, y_data)
all_data <- cbind(par_data,x_data)

##setkey(all_data, Subject, activityNum)

print(dim(x_data))
print(dim(y_data))
print(dim(subject_data))

##print(head(all_data))
##part 2 mean and standard deviation

## use regex to grep out the mean and std deavation. find the length

feat_index <- grep("mean\\(\\)|std\\(\\)", features[,2])
print(length(feat_index))

x_data <- x_data[,feat_index] 
print(dim(x_data))


##part 3 - activity names
## replace the numbers with the values from activity_label.txt
y_data[,1]<-activity_label[y_data[,1],2]
print(head(y_data))


##part4 - labels
## grab the variables for the names and update the column names with the new values

names <- features[feat_index,2]
names(x_data) <- names
names(subject_data) <- "Subject_ID"
names(y_data) <- "Activity_Type"

clean <- cbind(subject_data, y_data,x_data)
print(head(clean[,c(1:9)]))


##part 5 average

clean <- data.table(clean)
tidydata <- clean[, lapply(.SD, mean), by = 'Subject_ID,Activity_Type']
print(dim(tidydata))

write.table(tidydata,file="Tidy.txt",row.names = FALSE)

print(head(tidydata[order(Subject_ID)][,c(1:4), with = FALSE],12)) 

