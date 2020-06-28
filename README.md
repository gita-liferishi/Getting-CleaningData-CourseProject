# Getting-CleaningData-CourseProject
Generating a tidy dataset from data collected from Samsung Galaxy Smartphone 

# Targets and Steps to undertake
The target is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The following work is done on the data that has been provided as per the instructions entailed in the Course Project :- 

1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names.
5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

# Data Source
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Files Contained 
1. run_analysis.R :  The code to complete the above mentioned tasks from given data source. The code is written in R and saved with the corresponding extension.
2. CodeBook.md :  A code book that describes the variables, the data, and any transformations or work that is performed to clean up the data.
3. README.md : The documentation  explains how all of the scripts work and how they are connected.
4. Average Data - SamsungdB.txt : Resultant tidy dataset containing the 66 feature variables comprising mean values.

# Brief Description and Chronology of Code
1. The dataset is downloaded and unzipped to extract all contents. 
2. The necessary data is read into R with suitable functions (read_table2, read_csv). Data read include
    - training set : X_train, y_train, subject_train
    - test set : X_test, y_test, subject_test
    - the different features of recorded values and activity labels
3. Merging the datasets of training and test data using rbind() & cbind()
4. Reducing the set of variables to those matching "mean()" or "std()"
    - Variables : Subject Data, Activity
5. Providing relevant descriptive names throughout to the activities.
    - Using 'left_join' and re-sorting
6. Appropriately labelling all data variables
    - Names : Subject Data, Labels, xtrain etc.
7. Generating a tidy data set on basis of activity_labels
8. Creating tidy data set with average of each variable
    - Using group_by to tidy data and sort
    - Result stored in : avg_dataset_samsung
9. Writing resultant data set into text file
    - Result stored in : "Average Data - SamsungdB.txt"
