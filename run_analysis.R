# Load dplyr. 
library(dplyr)
# Read dataset
y_test<-tbl_df(read.table("UCI HAR Dataset/test/y_test.txt",colClasses = "character"))
X_test<-tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))
subject_test<-tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
y_train<-tbl_df(read.table("UCI HAR Dataset/train/y_train.txt", colClasses = "character"))
X_train<-tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
subject_train<-tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
features<-read.table("UCI HAR Dataset/features.txt")
features<-make.unique(as.vector(features$V2, mode="any"))
colnames(X_test)<-features
colnames(X_train)<-features
colnames(y_test)<-"y"
colnames(y_train)<-"y"
colnames(subject_test)<-"subject"
colnames(subject_train)<-"subject"
# Merge files
test<-bind_cols(subject_test, y_test, X_test)
train<-bind_cols(subject_train, y_train, X_train)

train_test<-bind_rows("train"=train, "test"=test, .id="class") 

## Put descriptive activity names for activities
mean_std<-select(train_test, class, subject, y, contains("mean()"), contains("std()")) 

run_analysis<-mean_std %>% 
    mutate(y=replace(y, y=="1", "WALKING")) %>%
    mutate(y=replace(y, y=="2", "WALKING_UPSTAIRS")) %>%
    mutate(y=replace(y, y=="3", "WALKING_DOWNSTAIRS")) %>%
    mutate(y=replace(y, y=="4", "SITTING")) %>%
    mutate(y=replace(y, y=="5", "STANDING")) %>%
    mutate(y=replace(y, y=="6", "LAYING")) 

colnames(run_analysis)[3]<-"activities"

#Select original measurement.
run_analysis_short<-select(run_analysis, -starts_with("f"), -contains("Mag"), -contains("Jerk"))

#Put descriptive names for measurements
run_analysis<-run_analysis_short %>%
    select(BodyAcc_mean = starts_with("tBodyAcc-mean"), everything()) %>%
    select(BodyAcc_std = starts_with("tBodyAcc-std"), everything()) %>%
    select(GravityAcc_mean = starts_with("tGravityAcc-mean"), everything()) %>%
    select(GravityAcc_std = starts_with("tGravityAcc-std"), everything()) %>%
    select(BodyGyro_mean = starts_with("tBodyGyro-mean"), everything()) %>%
    select(BodyGyro_std = starts_with("tBodyGyro-std"), everything()) %>%
    select(class, subject, activities, contains("BodyAcc_mean"), contains("BodyAcc_std"), 
           contains("GravityAcc_mean"),contains("GravityAcc_std"),
           contains("BodyGyro_mean"), contains("BodyGyro_std"))

#Group rows by class, subject, and activities and get the mean value to make a tidy dataset.

tidy_run_analysis<-run_analysis %>% group_by(class, subject, activities) %>%
    summarise_each(funs(mean))
