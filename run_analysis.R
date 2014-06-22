library(reshape2)
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
feat<-read.table("./UCI HAR Dataset/features.txt")
actlbl<-read.table("./UCI HAR Dataset/activity_labels.txt")
totalset<-rbind(xtrain,xtest)
totallab<-rbind(ytrain,ytest)
totallab[,1]<-as.factor(totallab[,1])
totalsub<-rbind(subtrain,subtest)
colnames(totalset)<-feat[,2]
mscols<-grep("-mean()|-std()",names(totalset))
totalsetms<-totalset[,mscols]
totalsetms$activity<-totallab
totalsetms$subject<-totalsub
totalsetms$subject[[1]]<-factor(totalsetms$subject[[1]])
totalsetms$activity<-totalsetms$activity[[1]]
totalsetms$subject<-totalsetms$subject[[1]]
write.csv(totalsetms,file="tidyset1.txt")
labvect<-labels(totalsetms[0,1:79])
totalMelt<-melt(totalsetms,id<-c("subject","activity"))
tidyset<-dcast(totalMelt,subject+activity~variable,mean)
tidyset[,2]<-actlbl[,2]
write.csv(tidyset,file="tidyset2.txt")