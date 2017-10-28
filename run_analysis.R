#Setting the Working Directory First
#The Code will work properly
setwd("~/Data Scientist/Cleaning and Getting Data Course/Week 4/data/UCI HAR Dataset/")

dt_train <- read.csv("train/X_train.txt", sep="", header=FALSE)
dt_train[,562] <- read.csv("train/Y_train.txt", sep="", header=FALSE)
dt_train[,563] <- read.csv("train/subject_train.txt", sep="", header=FALSE)

dt_test <- read.csv("test/X_test.txt", sep="", header=FALSE)
dt_test[,562] <- read.csv("test/Y_test.txt", sep="", header=FALSE)
dt_test[,563] <- read.csv("test/subject_test.txt", sep="", header=FALSE)
dt_labels <- read.csv("activity_labels.txt", sep="", header=FALSE)
dt_feat <- read.csv("features.txt", sep="", header=FALSE)
dt_feat[,2] <- gsub('-mean', 'Mean', dt_feat[,2])
dt_feat[,2] <- gsub('-std', 'Std', dt_feat[,2])
dt_feat[,2] <- gsub('[-()]', '', dt_feat[,2])
data_combine = rbind(dt_train, dt_test)
mean_sd <- grep(".*Mean.*|.*Std.*", dt_feat[,2])
dt_feat <- dt_feat[mean_sd,]
mean_sd <- c(mean_sd, 562, 563)
data_combine <- data_combine[,mean_sd]
colnames(data_combine) <- c(dt_feat$V2, "Activity", "Subject")
colnames(data_combine) <- tolower(colnames(data_combine))

act = 1
for (currentActivityLabel in dt_labels$V2) {
    data_combine$activity <- gsub(act, currentActivityLabel, data_combine$activity)
    act <- act + 1
}

data_combine$activity <- as.factor(data_combine$activity)
data_combine$subject <- as.factor(data_combine$subject)

clean_tidy <- aggregate(data_combine, by=list(activity = data_combine$activity, subject=data_combine$subject), mean)
clean_tidy[,90] <- NULL
clean_tidy[,89] <- NULL
write.table(clean_tidy, "tidy.txt", sep="\t")