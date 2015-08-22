# cleaningdataproject

Data cleaning script for the final project in the coursera data cleaning course.

The scripts performs the following steps:
Joining the trainning data sets into a single table
Joining the test data sets into a single table
merging the training and test data sets into a single data set

Loading the entire features list and filtering out all the features that don't aren't the mean or standard deviation.
Selecting only the columns that belong to the selected features list.

renaming the columns to meaningful names.
Joinning the activity translation. 
Filtering out the resultId column
Merging the subject Id and activity name to a single column called activityBySubject
Groupping by activityBySubject and selecting the mean for every column
saving the result to the result.txt file.
