
##Load in data files
##The UCI HAR Dataset folder should be in your working directory 
##(with the subsequent file structure the same as when it was downloaded)

features_labels <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_set_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_set_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_set_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_set_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

features_labels_vector <- as.vector(features_labels[,2])

##Assemble training and test data sets with labels and subjects
test_set <- cbind(test_set_subject, test_set)
test_set <- cbind(test_set_labels, test_set)

train_set <- cbind(train_set_subject, train_set)
train_set <- cbind(train_set_labels, train_set)

##Merge training and test data sets and label columns

all_data_set <- rbind(test_set, train_set)
colnames(all_data_set) <- c('Activity', 'Subject', features_labels_vector)

##Extract only the mean() and std() variables

data_mean_std <- all_data_set[,(grepl("Activity",colnames(all_data_set))|grepl("Subject",colnames(all_data_set))|grepl("mean\\(\\)",colnames(all_data_set))|grepl("std()",colnames(all_data_set)))]

##Use descriptive activity names

data_mean_std$Activity <- activity_labels$V2[match(data_mean_std$Activity,activity_labels$V1)]

##Create a tidy data set with average of each variable for each activity and subject; write results to a file

library(plyr)
library(dplyr)

tidy_data_means <- ddply(data_mean_std, .(Activity,Subject), colwise(mean))

write.table(tidy_data_means,"TidyDataSet.txt", row.names = FALSE)

