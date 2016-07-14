title: Codebook for Getting_and_Cleaning_Data Course Project
author: Mike N
date: 7/14/16
Project Description: This project demonstrates a student's ability to collect, work with, and clean a data set using publicly available experiment data.
The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Raw data is availble here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The README.txt file fully describes the raw data files. 

Codebook: 
Raw text files were read to dataframes, and column names added as needed.
Subsetted columns to extract only measurements on the mean and standard deviation.  Result was dataframes train and test.
Joined activity fields to test and train datasets with dplyr.  Result was Test_act_id2 and Train_act_id2.
Bind the subject field to the test and train dataframes respectively.  Result was test_act_id3 and train_act_id3.
Bind the test and train data frame rows together.  Result was Final.
Use dplyr package to group and then summarize Final by Subj_id and activity using mean function.  Result was MeanSubjByAct.
Removed unnecessary objects.

Variables in Final:
10299 obs. of  89 variables:
Note all are numeric except "Subj_id" and  "Act_id" are integer, and "activity"  is  a Factor with 6 levels
The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Unit of measurement is time:
and the time domain signals were captured at a constant rate of 50 Hz.

> names(Final)
 [1] "Subj_id"                              "Act_id"                               "activity"                             "tBodyAcc.mean...X"                    "tBodyAcc.mean...Y"                    "tBodyAcc.mean...Z"                   
 [7] "tBodyAcc.std...X"                     "tBodyAcc.std...Y"                     "tBodyAcc.std...Z"                     "tGravityAcc.mean...X"                 "tGravityAcc.mean...Y"                 "tGravityAcc.mean...Z"                
[13] "tGravityAcc.std...X"                  "tGravityAcc.std...Y"                  "tGravityAcc.std...Z"                  "tBodyAccJerk.mean...X"                "tBodyAccJerk.mean...Y"                "tBodyAccJerk.mean...Z"               
[19] "tBodyAccJerk.std...X"                 "tBodyAccJerk.std...Y"                 "tBodyAccJerk.std...Z"                 "tBodyGyro.mean...X"                   "tBodyGyro.mean...Y"                   "tBodyGyro.mean...Z"                  
[25] "tBodyGyro.std...X"                    "tBodyGyro.std...Y"                    "tBodyGyro.std...Z"                    "tBodyGyroJerk.mean...X"               "tBodyGyroJerk.mean...Y"               "tBodyGyroJerk.mean...Z"              
[31] "tBodyGyroJerk.std...X"                "tBodyGyroJerk.std...Y"                "tBodyGyroJerk.std...Z"                "tBodyAccMag.mean.."                   "tBodyAccMag.std.."                    "tGravityAccMag.mean.."               
[37] "tGravityAccMag.std.."                 "tBodyAccJerkMag.mean.."               "tBodyAccJerkMag.std.."                "tBodyGyroMag.mean.."                  "tBodyGyroMag.std.."                   "tBodyGyroJerkMag.mean.."             
[43] "tBodyGyroJerkMag.std.."               "fBodyAcc.mean...X"                    "fBodyAcc.mean...Y"                    "fBodyAcc.mean...Z"                    "fBodyAcc.std...X"                     "fBodyAcc.std...Y"                    
[49] "fBodyAcc.std...Z"                     "fBodyAcc.meanFreq...X"                "fBodyAcc.meanFreq...Y"                "fBodyAcc.meanFreq...Z"                "fBodyAccJerk.mean...X"                "fBodyAccJerk.mean...Y"               
[55] "fBodyAccJerk.mean...Z"                "fBodyAccJerk.std...X"                 "fBodyAccJerk.std...Y"                 "fBodyAccJerk.std...Z"                 "fBodyAccJerk.meanFreq...X"            "fBodyAccJerk.meanFreq...Y"           
[61] "fBodyAccJerk.meanFreq...Z"            "fBodyGyro.mean...X"                   "fBodyGyro.mean...Y"                   "fBodyGyro.mean...Z"                   "fBodyGyro.std...X"                    "fBodyGyro.std...Y"                   
[67] "fBodyGyro.std...Z"                    "fBodyGyro.meanFreq...X"               "fBodyGyro.meanFreq...Y"               "fBodyGyro.meanFreq...Z"               "fBodyAccMag.mean.."                   "fBodyAccMag.std.."                   
[73] "fBodyAccMag.meanFreq.."               "fBodyBodyAccJerkMag.mean.."           "fBodyBodyAccJerkMag.std.."            "fBodyBodyAccJerkMag.meanFreq.."       "fBodyBodyGyroMag.mean.."              "fBodyBodyGyroMag.std.."              
[79] "fBodyBodyGyroMag.meanFreq.."          "fBodyBodyGyroJerkMag.mean.."          "fBodyBodyGyroJerkMag.std.."           "fBodyBodyGyroJerkMag.meanFreq.."      "angle.tBodyAccMean.gravity."          "angle.tBodyAccJerkMean..gravityMean."
[85] "angle.tBodyGyroMean.gravityMean."     "angle.tBodyGyroJerkMean.gravityMean." "angle.X.gravityMean."                 "angle.Y.gravityMean."                 "angle.Z.gravityMean."                
