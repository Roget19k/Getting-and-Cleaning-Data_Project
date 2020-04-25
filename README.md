# Getting-and-Cleaning-Data_Project
Course project for Getting and Cleaning Data from Coursera
Course:  Getting and Cleaning Data
Peer-graded Assignment: Getting and Cleaning Data Course Project


Project Description
Use the source data to demonstrate our ability to collect, work with, and clean a data set.

Source data:  Human Activity Recognition Using Smartphones
Source data website:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Source data files:  http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip


Data Processing
Data preprocessing and processing is accomplished using R script file 'run_analysis.R'.


Data preprocessing takes place when loading the source data files and creating initial data frames.  8 files in total are loaded into 3 categories of data frames (Features and Activities files, Test set files, and Training set files).

After source data preprocessing the training set and test set files are merged into one data file (Step 1/5).  
The next step extracts only the first two descriptive columns (subject, code) and those column names containing mean and standard deviation (Step 2/5).
Values from the activity column of the features source dataset are then substituted in place of the values in the code column to provide a more meaningful description (Step 3/5).
Remaining column names (containing 'mean' and 'std' are renamed to provide more meaningful descriptions (Step 4/5).
The final step creates a second tidy data set named 'tidy_data.txt' (Step 5/5). 


Files Used
Select files from source data set:  UCI HAR Dataset 
Output file: tidy_data.txt
Codebook:  CodeBook.md
