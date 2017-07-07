# CodeBook for Course Project 

The data is a set of measurements from the accelerometer and gyroscope of a Samsung Galaxy SII for 30 subjects while performing 6 different activities.  

The following is a list of the measured variables. Each variable has a mean and a standard deviation associated with it, 
which is what we extract from the original dataset in the R script (we ignore all other types of measurements).

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The following steps are performed when running the run_analysis.R script

The first step is to read in the data files (note that the UCI HAR Dataset folder should be extracted into your 
working directory, with the subfolder/file structure intact).  

Next we add the activity and subject identifiers to the test and training sets, and then combine the two sets to create the complete data set.  

From there we name all of the data columns using a vector that we create from the features_labels.txt file, as well as
the Activity and Subject columns.  

The next step is to only extract the mean and standard deviation for each measurement and create a new data frame with just these variables.

Then we use the activity_labels.txt file to replace the activity identifiers with the descriptive names. 

Finally, we create a tidy data set with the mean for each activity/subject combination on every measurement variable. And then write
it to a file. 
