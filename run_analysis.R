# This code takes six steps to create a tidy dataset based on some raw data.

# Step 1 loads two helpful packages, data.table and dplyr. It is assumed that the packages are
# already installed.

library(data.table)
library(dplyr)

# Step 2 loads in the required data files.

namesFeature <- read.table("UCI HAR Dataset/features.txt")
labelsActivity <- read.table("UCI HAR Dataset/activity_labels.txt")

trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainFeature <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("UCI HAR Dataset/train/y_train.txt")

testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testFeature <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("UCI HAR Dataset/test/y_test.txt")

# Step 3 merges all the data into one dataset.
#   In line with the assignment, only variables with a mean or standard deviation are selected

subject <- rbind(trainSubject, testSubject)
feature <- rbind(trainFeature, testFeature)
activity <- rbind(trainActivity, testActivity)

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

mean_std_namesFeatures <- grep(".*mean.*|.*std.*", namesFeature[,2], ignore.case = T)
feature <- feature[,mean_std_namesFeatures]
colnames(feature) <- namesFeature[mean_std_namesFeatures,2]


OneDS <- cbind(feature,activity,subject)

# Step 4 adds descpriptive names as labels to the activities in the complete dataset.

OneDS$Activity <- as.character(OneDS$Activity)
for (i in 1:6){
    OneDS$Activity[OneDS$Activity == i] <- as.character(labelsActivity[i,2])
}
OneDS$Activity <- as.factor(OneDS$Activity)
OneDS$Subject <- as.factor(OneDS$Subject)
# Step 5 changes the names of the variables to more clear and descriptive names.

names(OneDS) <- gsub("Acc", "Accelerometer", names(OneDS))
names(OneDS) <- gsub("Gyro", "Gyroscope", names(OneDS))
names(OneDS) <- gsub("BodyBody", "Body", names(OneDS))
names(OneDS) <- gsub("Mag", "Magnitute", names(OneDS))
names(OneDS) <- gsub("^t", "Time", names(OneDS))
names(OneDS) <- gsub("^f", "Frequency", names(OneDS))
names(OneDS) <- gsub("tBody", "TimeBody", names(OneDS))
names(OneDS) <- gsub("-mean()", "Mean", names(OneDS), ignore.case = T)
names(OneDS) <- gsub("-std()", "Standard Deviation", names(OneDS), ignore.case = T)
names(OneDS) <- gsub("-freq()", "Frequency", names(OneDS), ignore.case = T)

# Step 6 creates the tidy dataset with the average of each variable for each activity and subject.
#   This tidy dataset is written to a .txt file.

dataTidy <- aggregate(. ~Subject + Activity, OneDS, mean)
dataTidy <- arrange(dataTidy, Subject, Activity)
write.table(dataTidy, file = "Tidy dataset.txt", row.names = F)