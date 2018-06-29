# R script for "Getting and Cleaning Data Course" Week 4 Project
#load dplyr package
library(dplyr)

#Read the test and train data sets into R

x_test <- read.table("test/x_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

x_train <- read.table("train/x_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

#Merge test and train data 
x_merge <- rbind(x_test, x_train)
y_merge <- rbind(y_test, y_train)
subject_merge <- rbind(subject_test, subject_train)

#Read the features data into R
features <- read.table("features.txt", col.names = c("index", "features"))

#Find the features index list that featurer names contain mean() or std()
mean_std_index <- grep("mean()|std()", features$features)

#extract only the feature columns that are related to the Mean() or Std() from the merged x data frame
x_mean_std <- select(x_merge, mean_std_index)

#Read the activity label into R
activities <- read.table("activity_labels.txt", col.names = c("index", "activities"))

#Convert the activity index to the descriptive labels
y_label <- sapply(y_merge, function(x) activities$activities[match(x, activities$index)])

#bind the x data set with the subject and activity label
x_subject_activity <- cbind(subject_merge, y_label, x_mean_std)

#Create the variable names
variabl_names <- gsub("[()]","",features$features[mean_std_index])

#Assign variable names to the data set
names(x_subject_activity) <- c("subject", "activity", variabl_names)

#Group by the subject and activity, then summarize with mean for all varibles
x_mean_subject_activity <- x_subject_activity %>% group_by(subject, activity) %>% summarize_all(mean)

#Write out the final tidy data set
write.table(x_mean_subject_activity, "x_tidy.txt")




