# Course Project

#load data
setwd ("H:\\Educational\\Getting_and_Cleaning_Data\\proj\\UCI HAR Dataset")
library(dplyr)
features <- 	read.table("features.txt",colClasses = "character",col.names=c("featureNum","feature")) #column names
test_act_id <- 	read.table("test\\y_test.txt",col.name="Act_id") 						#id for activity
train_act_id <- read.table("train\\y_train.txt",col.name="Act_id")						#id for activity
test_subject <- read.table("test\\subject_test.txt",col.name="Subj_id")					#for subject id column-test
train_subject<- read.table("train\\subject_train.txt",col.name="Subj_id") 				#for subject id column-train
activities <- 	read.table("activity_labels.txt",col.names = c("Act_id","activity")) 	#activity id and names
train <- 		read.table("train\\X_train.txt",col.names=features$feature) 			# Training set
test  <- 		read.table("test\\X_test.txt",col.names=features$feature)				# Test set

#keep only the columns for mean or standard deviation 
keep <- grep('Mean|std',features$feature,ignore.case=TRUE)
train <- train[,keep]
test <- test[,keep]

#make dataframes into tables for dplyr package
Test_act_id <- tbl_df(test_act_id) 
Train_act_id <- tbl_df(train_act_id) 
Activities <- tbl_df(activities) 

#Join activity fields to test and train datasets with dplyr
Test_act_id2 <-  inner_join(Test_act_id,Activities) #join for Test data
Train_act_id2 <-  inner_join(Train_act_id,Activities) #join for Train data

#bind the subject field to the test and train datasets.  
test_act_id3 <- cbind(test_subject ,Test_act_id2, test)        
train_act_id3 <-cbind(train_subject,Train_act_id2,train)

#bind the test and train data frame rows together
final <- rbind(test_act_id3,train_act_id3)

#Group by subject and activity within subjects and calculate means with dplyr for variables
Final <- tbl_df(final)
Groups <- group_by(Final,Subj_id,activity)
MeanSubjByAct <- Groups %>% summarise_each(funs(mean))

#cleanup unneeded objects
rm("activities", "Activities", "features", "final", "keep", "test","test_act_id","Test_act_id"   ,"Test_act_id2", "test_act_id3", "test_subject", "train", "train_act_id", "Train_act_id", "Train_act_id2", "train_act_id3", "train_subject")

#write dataset
write.table(MeanSubjByAct, file="H:\\Educational\\Getting_and_Cleaning_Data\\MeanSubjByAct.txt", col.names=T)