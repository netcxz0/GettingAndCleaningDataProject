# CodeBook for run_analysis.R 

## Source data 
* Test data set
	* x_test.txt
	* y_test.txt
	* suject_test.txt
* Training data set
	* x_train.txt
	* y_train.txt
	* subject_train.txt
* features.txt
* activity_labels.txt

	
## Project Output files
* Tidy data set file x_tidy.txt
* Variable name list in the output tidy data set   variables.txt
	
## Transformation
1. Merges the x, y, and subject data from the Test and Training data set.
2. Matches the x data set columns to the variable names from the features.txt file.
3. Extract the x data set columns that have the mean() or std() measurements.
4. Matches the extracted x data set rows with the subject list from the merged subject_test.txt and subject_train.txt files, 
   and the merged activity list from y_test.txt and y_train.txt files.
5. Convert the acitivity code to the descriptive activity labels based on the activity_label.txt file.
6. Group the above data set by the activity and subject, then calculate the average values on each variables for each group to generate the tidy data set.


