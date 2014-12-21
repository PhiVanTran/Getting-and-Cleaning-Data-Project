# run_analysis.R File Description:
# This is script to run the below: 
# 0. Load data.
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
# 1. Merges the training and the test sets to create one data set.
trainingData <- cbind(xtrain, ytrain, subjecttrain)
testData <- cbind(xtest, ytest, subjecttest)
finaldb <- rbind(trainingData, testData)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
xdata <- finaldb[, 1:561]
xdata <- xdata[, mean_and_std_features]
names(xdata) <- features[mean_and_std_features, 2]

# 3. Uses descriptive activity names to name the activities in the data set
ydata <- rbind(ytrain, ytest)
ydata[, 1] <- activity_labels[ydata[, 1], 2]
names(ydata) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 
subjectdata <- rbind(subjecttrain, subjecttest)
names(subjectdata) <- "subject"
finaldb <- cbind(xdata, ydata, subjectdata)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
tidydb <- ddply(finaldb, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(tidydb, "tidydb.txt", row.name=FALSE)
