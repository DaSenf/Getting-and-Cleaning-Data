path <- getwd()
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "run.zip" )
#unzip("run.zip")
path = paste(path,"/UCI HAR Dataset/",sep="")
if(dir.exists(path)){
  setwd(path)
}
train_fea <- read.table("train/X_train.txt",sep="",header=F)
train_subject <- read.table("train/subject_train.txt",header = F)
train_activity <- read.table("train/y_train.txt",header=F)

test_fea <- read.table("test/X_test.txt",sep="",header=F)
test_subject <- read.table("test/subject_test.txt",header=F)
test_activity <- read.table("test/y_test.txt",header=F)

setwd(path)
names_var <- read.table("features.txt",sep="")
train <- cbind("train",train_subject,train_activity,train_fea)
test <- cbind("test",test_subject,test_activity,test_fea)

colnames(train) <- c("trainortest","subject","activity",as.character(names_var$V2))
colnames(test) <- c("trainortest","subject","activity",as.character(names_var$V2))


## 1. Merge the training and the test sets to create one data set.


whole <- rbind(train,test)
whole$subject <- as.factor(whole$subject)
whole$activity <- as.factor(whole$activity)


## 2. Extract only the measurements on the mean and standard deviation for each measurement


index <- grep("mean()",colnames(whole)[4:length(colnames(whole))], fixed = TRUE)
index2 <- c(index,grep("std()",colnames(whole)[4:length(colnames(whole))], fixed =TRUE))
whole_stdmean <- whole[,c(1:3,(index2+3))] 


## 3. Use descriptive activity names to name the activities in the data set


setwd(path)
activity_labels <- read.table("activity_labels.txt")
levels(whole_stdmean$activity)[1:6]<- as.character(activity_labels$V2)



## 4. Appropriately label the data set with descriptive variable names


names_variables <- colnames(whole_stdmean)[-(1:3)]
new_names <- gsub("^t","Time",names_variables)
new_names2 <- gsub("Acc","Acceleration",new_names)
new_names3 <- gsub("Gyro","Gyroscope",new_names2)
new_names4 <- gsub("Mag","Magnitude",new_names3)
new_names5 <- gsub("^f","Frequency",new_names4)
new_names6 <- gsub("mean()","in_average", new_names5, fixed=TRUE)
new_names7 <- gsub("std()","standard-deviation", new_names6, fixed=TRUE)
new_names7 <- gsub("X","X-axis", new_names7)
new_names7 <- gsub("Y","Y-axis", new_names7)
new_names7 <- gsub("Z","Z-axis", new_names7)

colnames(whole_stdmean)[-(1:3)]<- new_names7



## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

averages <- numeric(180*66)
trainortest <- factor(character(180),levels=levels(whole_stdmean$trainortest))
subject_avg <- factor(character(180),levels=levels(whole_stdmean$subject))
activity_avg <- factor(character(180),levels=levels(whole_stdmean$activity))


dim(averages) <- c(180,66)
i <- 0
for (subj in levels(whole_stdmean$subject)){ 
    for (acti in levels(whole_stdmean$activity)){
        i <- i+1
        wholesubset <- whole_stdmean[whole_stdmean$subject==subj & whole_stdmean$activity==acti,]
        avg <- colMeans(wholesubset[,(4:length(wholesubset[1,]))])
        averages[i,] <- avg
        trainortest[i] <- wholesubset$trainortest[1]
        subject_avg[i] <- subj
        activity_avg[i] <- acti
    } 
}
df_avg <- data.frame(trainortest,subject_avg,activity_avg,averages)
colnames(df_avg)<-colnames(whole_stdmean)   
df_avg
