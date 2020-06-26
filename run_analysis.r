#R Script for course project - Getting & Cleaning Data

##Loading relevant R packages required
library(tidyr)
library(readr)
library(dplyr)
library(stringr)

## downloading zip file if not downloaded
cpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
cpFilePath <- "Samsung Data.zip"

if(!file.exists(cpFilePath)){ 
   download.file(cpURL, cpFilePath, mode = "wb")
}

## If zip file exists , extracting all it's contents
if(!file.exists("Samsung Data")){
  unzip("Samsung Data.zip")
}

## Reading all data required to generate tidy dataset
### Reading activity data
xtest <- read_table2("UCI HAR Dataset/test/X_test.txt", col_names = FALSE)
xtrain <- read_table2("UCI HAR Dataset/train/X_train.txt", col_names = FALSE)

### Reading corresponding activity code
ytest <- read_csv("UCI HAR Dataset/test/y_test.txt", col_names = FALSE)
ytrain <- read_csv("UCI HAR Dataset/train/y_train.txt", col_names = FALSE)

###Reading subject data 
subject_train <- read_csv("UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)
subject_test <- read_csv("UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)

### Reading different variables of the data as vector
features <- as.vector(read_table2("UCI HAR Dataset/features.txt", 
                                  col_names = FALSE, col_types = cols(`1` = col_skip(), 
                                                                      X1 = col_skip())))

###Reading the main acctivities undertaken 
activity_labels <- read_table2("UCI HAR Dataset/activity_labels.txt", col_names = FALSE)
names(activity_labels) <- c("Serial No.","Activity")
names(features) <- "Labels"

## 1. Merging training and test sets to create one dataset
total_subject <- rbind(subject_train, subject_test)
total_y <- rbind(ytrain,ytest)
total_x <- rbind(xtrain,xtest)

names(total_subject) <- "Subject Data"
names(total_y) <- "Activity Code"
names(total_x) <- features[[1]]

total_data <- cbind(total_subject, total_y, total_x)

## 2. Extracting only the measurements on the mean and standard deviation 
## for each measurement
feature_find <- mutate(features, keep_column = str_detect(Labels, "(mean|std)\\(\\)"))
full_feature <- rbind(c("Subject", TRUE), c("Activity Code", TRUE), feature_find)

## resulting dataset is 'mean_std_find'
mean_std_find <- total_data[, as.logical(feature_find$keep_column)]


## 3. Using descriptive activity names to name the activities in the data set

tidy_dataset_Samsung <- left_join(mean_std_find, activity_labels, by=c("Activity Code" = "Serial No.") )
tidy_dataset_Samsung <- tidy_dataset_Samsung[,c(1,69,3:68)]

## 4. Appropriately labeling the data set with descriptive variable names

### Step has been done aalready throughout the script 

## 5. Generating second, independent tidy data set 
## with the average of each variable for each activity and each subject

avg_dataset_samsung <- tidy_dataset_Samsung %>% group_by(Subject Data, Activity) %>% summarise_all(mean)

write.table(avg_dataset_samsung, "Average Data - Samsungdb.txt", row.names = FALSE)

## End of script 
