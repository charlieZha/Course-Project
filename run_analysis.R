##Prepear all test data
test_x<-read.table("UCI HAR Dataset/test/x_test.txt")
test_y<-read.table("UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")


##Prepear all train data
train_x<-read.table("UCI HAR Dataset/train/x_train.txt")
train_y<-read.table("UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")


##Prepear column names
labels<-read.table("UCI HAR Dataset/activity_labels.txt")
features<-read.table("UCI HAR Dataset/features.txt")
cnames<-features[,2]

##Assign relavent names as headers
names(test_x)<-c(cnames)
names(train_x)<-c(cnames)
names(test_subject)<-"Subject"
names(train_subject)<-"Subject"
names(test_y)<-"Activity"
names(train_y)<-"Activity"

##Merge the trainning and test data as one data set
test_data<-cbind(test_x,test_y,test_subject)
train_data<-cbind(train_x,train_y,train_subject)
full_data<-rbind(test_data,train_data)
