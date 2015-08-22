train_subject <- read.delim("train\\subject_train.txt",header=FALSE)
train_x <- read.delim("train\\x_train.txt",header=FALSE,strip.white = TRUE, sep="")
train_y <- read.delim("train\\y_train.txt",header=FALSE,strip.white = TRUE, sep="")
train_dataset<- cbind(train_x,train_subject,train_y)

test_subject <- read.delim("test\\subject_test.txt",header=FALSE)
test_x <- read.delim("test\\x_test.txt",header=FALSE,strip.white = TRUE, sep="")
test_y <- read.delim("test\\y_test.txt",header=FALSE,strip.white = TRUE, sep="")
test_dataset<- cbind(test_x,test_subject,test_y)

full_dataset<- rbind(train_dataset,test_dataset)
features <- read.delim("features.txt",header=FALSE,strip.white = TRUE, sep="",stringsAsFactors = FALSE)
rel_features <- features[(grepl("mean()",features$V2) | grepl("std()",features$V2)), ]

filtered_columns<-full_dataset[,c(rel_features$V1,562,563)]
activity <- read.delim("activity_labels.txt",header=FALSE,strip.white = TRUE, sep="",stringsAsFactors = FALSE)
colnames(filtered_columns) <- c(rel_features$V2,"subjectId","resultId")
mergedTable <- merge(filtered_columns,activity, by.x="resultId", by.y="V1")
mergedTable<-mergedTable[,(2:(ncol(mergedTable)))]
colnames(mergedTable) <- c(rel_features$V2,"subjectId","result")


mergedTable <- mutate(mergedTable, activityBySubject = paste(mergedTable$subjectId,"-",mergedTable$result))
mergedTable<-mergedTable[,c(1:(ncol(mergedTable)-3),ncol(mergedTable))]
mergedTable %>% group_by(activityBySubject) %>% summarise_each(funs(mean)) %>% write.table("result.txt",row.names=FALSE)