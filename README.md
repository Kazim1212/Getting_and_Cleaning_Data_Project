Getting and Cleaning Data Final Project

Overview
This repository contains required documents and file for the final project of Getting and Cleaning data.The documents are requested by the course instructor to complete the final project.

Description of Data

The features (561 of them and 7352 Rows) are unlabeled and can be found in the x_test.txt. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file. (There are 2947 Rows in x_text.txt)

Script and Tidy File

I have created a script called run_analysis.R which combine both all the data and create the tidy.txt. 

Requirement for this project:

1. UCI HAR Dataset must be extracted.
2. UCI HAR Dataset is stored in the "UCI HAR Dataset" Directory

All data have been merged into one dataset from testing and training as well labels and calculated the mean and standard deviation with related column.

The script will create a a file called tidy.txt, which include means of all columns per subject and per activity.

About the Code Book
The code book provide information about the variables and process and it is stored in the respository and file is called CodeBook.md.
