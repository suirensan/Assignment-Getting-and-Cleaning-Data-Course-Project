# Assignment-Getting-and-Cleaning-Data-Course-Project

dplyr was loaded.
Datasets were read from UCI HAR Dataset one by one and they were put into tbl_df.
In case of features dataset, it was read as a vector to be used as column names.

Then files were merged to make a large data set.

The columns with names containing "mean()" and "std()" were selected.

Activity names were assigned.

Only the columns containing means and standard deviations of tBodyAcc, tGravityAcc, and tBodyGyro measurements were selected and remaned.

Finally, the average of each variable for each activity and each subject were calculated and the file was made as "tidy_run_analysis".
