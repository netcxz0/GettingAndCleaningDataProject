# run_analysis.R

### R script progrm for the "Getting and Cleaning Data" course project.

### Data set:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This program perform the following functions:
1. Merges the training and the test data set to create one data set.
2. Extracts only the measuremetns on the mean and standard deviation from the merged data set.
3. Group the data set by activities then subjects.
4. Calculate the average values for each variable for each activity and subject.

This script assigns the original data column name from the features.txt file, uses the regular expression to select the columns that have mean() and std() in the names.
It also uses the sapply function and activity index and label list to convert the activity index in the data set to the activity label.
Last, it uses the pipe %>% functions to group the data set by activity and subject, then summarize and mean functions to get the average for each group. 