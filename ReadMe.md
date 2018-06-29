# run_analysis.R

### R script progrm for the "Getting and Cleaning Data" course project.

This program perform the following functions:
1. Merges the training and the test data set to create one data set.
2. Extracts only the measuremetns on the mean and standard deviation from the merged data set.
3. Group the data set by subject then activities.
4. Calculate the average values for each variable for each subject and activity.

This script assigns the original data column name from the features.txt file, uses the regular expression to select the columns that have mean() and std() in the names.
It also uses the sapply function and activity index and label list to convert the activity index in the data set to the activity label.
Last, it uses the pipe %>% functions to group the data set by subject and activity, then summarize and mean functions to get the average for each group. 