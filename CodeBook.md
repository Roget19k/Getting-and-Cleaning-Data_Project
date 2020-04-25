Code Book

Source Data
Dataset downloaded from http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
and placed in folder UCI HAR Dataset.


Data Preprocessing (Create initial data frames)

Files loaded (8):

Features and Activities files

1.	df_features:  features.txt (561 obs. of 2 variables)
2.	df_activities:  activity_labels.txt (6 obs. of 2 variables)

Test set files
3.	df_subject_test:  subject_test.txt (2947 obs. of 1 variable)
4.	df_x_test:  X_test.txt (2947 obs. of 561 variables)
5.	df_y_test:  y_test.txt (2947 obs. of 1 variable)

Training set files
6.	df_subject_train:  subject_train.txt (7352 obs. of 1 variable)
7.	df_x_train: X_train.txt (7352 obs. of 561 variables)
8.	df_y_train: y_train.txt (7352 obs. of 1 variable)


Data Processing

Step 1: Merges the training and the test sets to create one data set.

rbind() functions used to combine training and test sets for x,y, and subject source data files.
•	df_X:  (10299 obs. of 561 variables)
•	df_Y:  (10299 obs. of 1 variable)
•	df_Subject:  (10299 obs. of 1 variable)
•	df_Merged:  (10299 obs. of 563 variables)


Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

Use select statement to return only columns subject, code, and those containing ‘mean’ and ‘std’.  Create df_tidy data frame.

df_tidy:  (10299 obs. of 88 variables)


Step 3: Uses descriptive activity names to name the activities in the data set

Replace ‘code’ column values with those from column ‘activity’ using df_activities data frame.

df_tidy:  (10299 obs. of 88 variables)


Step 4: Appropriately labels the data set with descriptive variable names.

Column values in data frame ‘df_tidy’ renamed:
•	Column ‘code’ renamed to ‘activity’
•	Remaining measure columns renamed to more meaningful descriptions using full names adapted from source file ‘features_info.txt’.
o	(prefix 't' to denote time)
o	('f' to indicate frequency)
o	(‘acc’ replaced with Accelerometer)
o	(‘angle’ replaced with Angle)
o	(‘BodyBody’ replaced with Body)
o	(‘^f’ replaced with Frequency)
o	(‘-freq()replaced with Frequency)
o	(‘gravity’ replaced with Gravity)
o	(‘Gyro’ replaced with Gyroscope)
o	(‘Mag’ replaced with Magnitude)
o	(‘-mean()’ replaced with Mean)
o	(‘-std’ replaced with STD)
o	(‘^t’ replaced with Time)
o	(‘tBody’ replaced with TimeBody)


Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Data frame ‘df_tidy_export’ created from ‘df_tidy’ by grouping by columns subject and activity.  The mean() function is then applied while summarizing the remaining measure columns.

df_tidy_export:  (180 obs. of 88 variables)

‘df_tidy_export’ written to ‘df_tidy_export.txt’.
