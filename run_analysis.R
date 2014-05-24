##Prepear all test data
test_x<-read.table("UCI HAR Dataset/test/x_test.txt")
test_y<-read.table("UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("UCI HAR Dataset/test/subject_test.txt")


##Prepear all train data
train_x<-read.table("UCI HAR Dataset/train/x_train.txt")
train_y<-read.table("UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("UCI HAR Dataset/train/subject_train.txt")

##Merge all data into one
test_data<-cbind(cbind(test_x,test_y),test_subject)
train_data<-cbind(cbind(train_x,train_y),train_subject)
full_data<-rbind(test_data,train_data)

data_feature<-read.table("UCI HAR Dataset/features.txt")
mean<-grep("-mean()",data_feature[,2])
std<-grep("-std()",data_feature[,2])

data_mean<-full_data[,mean]
data_std<-full_data[,std]

##full_data$Activity<-gsub2(1:6,labels,full_data$Activity)

##Use descriptive activity names to name the activities in the data set

activ<-read.table("UCI HAR Dataset/activity_labels.txt")
activ[,2]=gsub("-","",tolower(as.character(activ[,2])))
T<-cbind(t,train_subject)
T[,1]=activ[T[,1],2]
header(T)<-"Activity"