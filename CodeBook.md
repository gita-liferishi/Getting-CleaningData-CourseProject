# Original Data
The original data contains
- A 561-feature vector with time and frequency domain variables, entailing relevant units and info
- Two sets of data : Training & Testing 
- The available features and the activity labels of the recorded data

# Locally stored data 
- Samsung Data.zip : the file path that contains the downloaded zip file
- UCI HAR Dataset : extracted contents of zip file which is the original data set

# Intermediary Variables & Transformations 
[Class : data.frame/tibble/"tbl_df"]
- xtrain & xtest : store the recorded data from both sets
- subject_test & subject_train : store the individual subjects from both sets
- ytrain & ytest : stores the corresponding activity undertaken by subject
- activity_labels : store the activities recorded and the corresponding code
- features : the features of the accelerometer that are recorded in table form
- total_data : the merged datasets of all the three variables; subject, X_, y_ from the two sets
- full_feature & feature_find : subsequent steps to extract variables with "mean()" or "std()" and issue the recorded TRUE findings in tabular form
- mean_std_find : resultant penultimate tidy data set stored 

Transformative steps & functions  : 
- rbind()/cbind() - to merge all required available data into a cumulative set[total_data]
- mutate() - to form a new column and keep track of findings as per condition
- group_by()/summarise() - to generate resultant tidy data set 

Information about intermediary datasets
- total_data : data frame containing columns "Subject Data", "Activity" and 561 feature variables 
- mean_std_find : concised data frame containing columns "Subject Data", "Activity" and 66 feature variables having average or std recordings 

# Resultant Tidy Data set 
- avg_dataset_samsung : Tidy dataset having dimensions - 180 * 68
- Columns/Variables : "Subject Data", "Activity" and 66 other avergae featured variables

