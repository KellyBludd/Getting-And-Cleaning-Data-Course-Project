# Getting-And-Cleaning-Data-Course-Project

This repository contains my work done for the Getting and Cleaning Data Week 4 course project.  

The data required is here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

The run_analysis.R script which can be used to assemble the complete data set for mean and standard deviation variables (data_mean_std) and will write the final tidy data set (tidy_data_means) to your working directory.  Note that the UCI HAR Dataset folder needs to be extracted to your working directory for the script to work.  

There is a CodeBook.md file that lists the variables and explains what the data is.  

The following steps are performed when running the run_analysis.R script

The first step is to read in the data files (note that the UCI HAR Dataset folder should be extracted into your working directory, with the subfolder/file structure intact).

Next we add the activity and subject identifiers to the test and training sets, and then combine the two sets to create the complete data set.

From there we name all of the data columns using a vector that we create from the features_labels.txt file, as well as the Activity and Subject columns.

The next step is to only extract the mean and standard deviation for each measurement and create a new data frame with just these variables.

Then we use the activity_labels.txt file to replace the activity identifiers with the descriptive names. The resulting data frame is called data_mean_std

Finally, we create a tidy data set with the mean for each activity/subject combination on every measurement variable (called tidy_data_means). And then write it to a file.

To load the tidy data set, you can use the following command: read.table("TidyDataSet.txt", header=TRUE) from your working directory.  
