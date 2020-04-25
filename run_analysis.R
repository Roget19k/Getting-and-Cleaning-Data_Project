# Course:  Getting and Cleaning Data  
# Course Project:  run_analysis.R


library(dplyr)



## Create initial data frames

# Features and Activities files
df_features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
df_activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Test set files
df_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
df_x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = df_features$functions)
df_y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Training set files
df_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
df_x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = df_features$functions)
df_y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")



## Step 1: Merges the training and the test sets to create one data set.

df_X <- rbind(df_x_train, df_x_test)
df_Y <- rbind(df_y_train, df_y_test)
df_Subject <- rbind(df_subject_train, df_subject_test)
df_Merged <- cbind(df_Subject, df_Y, df_X)


## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.

df_tidy <- df_Merged %>% 
        select(subject, code, contains("mean"), contains("std"))


## Step 3: Uses descriptive activity names to name the activities in the data set

df_tidy$code <- df_activities[df_tidy$code, 2]


## Step 4: Appropriately labels the data set with descriptive variable names.

names(df_tidy)[2] = "activity"
names(df_tidy)<-gsub("Acc", "Accelerometer", names(df_tidy))
names(df_tidy)<-gsub("angle", "Angle", names(df_tidy))
names(df_tidy)<-gsub("BodyBody", "Body", names(df_tidy))
names(df_tidy)<-gsub("^f", "Frequency", names(df_tidy))
names(df_tidy)<-gsub("-freq()", "Frequency", names(df_tidy), ignore.case = TRUE)
names(df_tidy)<-gsub("gravity", "Gravity", names(df_tidy))
names(df_tidy)<-gsub("Gyro", "Gyroscope", names(df_tidy))
names(df_tidy)<-gsub("Mag", "Magnitude", names(df_tidy))
names(df_tidy)<-gsub("-mean()", "Mean", names(df_tidy), ignore.case = TRUE)
names(df_tidy)<-gsub("-std()", "STD", names(df_tidy), ignore.case = TRUE)
names(df_tidy)<-gsub("^t", "Time", names(df_tidy))
names(df_tidy)<-gsub("tBody", "TimeBody", names(df_tidy))


## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

df_tidy_export <- df_tidy %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
write.table(df_tidy_export, "tidy_data.txt", row.name=FALSE)

