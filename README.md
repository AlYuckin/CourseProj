# CourseProj
The script reads the various text files into R that were a part of the zip file provided in the Course
Raw text files were read to dataframes, and column names added as needed.
Subsetted columns to extract only measurements on the mean and standard deviation.  Result was dataframes train and test.
Joined activity fields to test and train datasets with dplyr.  Result was Test_act_id2 and Train_act_id2.
Bind the subject field to the test and train dataframes respectively.  Result was test_act_id3 and train_act_id3.
Bind the test and train data frame rows together.  Result was Final.
Use dplyr package to group and then summarize Final by Subj_id and activity using mean function.  Result was MeanSubjByAct.
Removed unnecessary objects.
