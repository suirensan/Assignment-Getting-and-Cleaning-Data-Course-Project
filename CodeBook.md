==================================================================
Human Activity Recognition Using Smartphones Dataset Code Book
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

These signals were used to estimate variables of the feature vector for each pattern:  
‘-1 2 3’ is used to denote 3-axial signals in the X, Y and Z directions.

- ‘class’ identifies ‘test’ data and ‘training’ data.

- ‘subject’ identifies each volunteer. 

- ‘activities’ corresponds to their activity name.

- ‘BodyAcc_mean1, 2, 3’  denote the average value of body acceleration signal for each activity and each subject in XYZ 
axis in unit ‘g’.

- ‘GravityAcc_mean1, 2, 3’  denote the average value of gravity acceleration signal for each activity and each subject in XYZ axis in unit ‘g’.

- ‘BodyGyro_mean1, 2, 3’  denote the average value of signal from gyroscope for each activity and each subject in XYZ axis in unit ‘radians/second’.

- Each measurement was accompanied by its standard deviation ‘_std123’.
