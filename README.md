README
========================================================
The following process assumes you have downloaded the "getdata-projectfiles-UCI HAR Dataset.zip" file, and it is in your working directory.


Line 1: The reshape2 library is needed for melting and casting the data.
Line 2: Unzips the dataset
Lines 3-10: Reads all of the neccesary files in the dataset into R
Lines 11-12,14: Combine the test and training datasets (training set first)
Line 13: Creates factors out of the activity variables
Line 15: Labels the columns of the combined dataset with the names from "features.txt"
Lines 16-17: Filters and creates a new set out of only the measurements that have "mean" or "std" in them.
Lines 18-22: Add columns for activity and subject into the "totalsetms" data frame, and creates factors for these columns
Line 23: Creates the first tidy data set
Line 24: Creates a vector of the measurements that are in the "totalsetms" data frame
Line 25: Melts the first tidy data set by subject and activity
Line 26: Casts the previously melted data frame, with the means of the 79 variables for each subject and activity
Line 27: Changes the activity column back into names ("WALKING", etc.) from numbers
Line 28: Saves the new tidy data set