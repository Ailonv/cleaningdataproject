
#The scripts performs the following steps: 

*Joining the trainning data sets into a single table .

*Joining the test data sets into a single table.

*Merging the training and test data sets into a single data set.

*Loading the entire features list and filtering out all the features that don't aren't the mean or standard deviation. 

*Selecting only the columns that belong to the selected features list.

*Renaming the columns to meaningful names. 

*Joinning the activity translation. 

*Filtering out the resultId column. 

*Merging the subject Id and activity name to a single column called activityBySubject.

*Groupping by activityBySubject and selecting the mean for every column.

*Saving the result to the result.txt file.

#Variables 
*"train_subject", "train_x", "train_y", "test_subject", "test_x", "test_y" contains the original data as it was downloaded.

*"train_dataset", "test_dataset", "full_dataset" contains the appropriate merged sets.

*"Features" contains the full list of columns the dataset holds

*"rel_features" contains the filtered list of columns that is either mean or std as well as the subject's id and activity id

*"filtered_column" contains data set only holding relevant.

*"mergedTable" contains the dat set with the translation of the activity name
