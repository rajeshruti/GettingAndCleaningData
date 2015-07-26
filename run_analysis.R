#Combine training data column wise
subject_train <- read.table("train/subject_train.txt")
train_dfx <- read.table("train/X_train.txt")
train_dfy <- read.table("train/y_train.txt")
train_df <- cbind(subject_train, train_dfy, train_dfx)

#Combine test data coulmn wise
subject_test <- read.table("test/subject_test.txt")
test_dfx <- read.table("test/X_test.txt")
test_dfy <- read.table("test/y_test.txt")
test_df <- cbind(subject_test, test_dfy, test_dfx)

#Combine training and test data row wise 
combined_df <- rbind(train_df, test_df)

#Add measurement labels
features <- read.table("features.txt", as.is = TRUE)
colnames(combined_df) <- c("Subject", "Activity", features$V2)
combined_df <- combined_df[, grep("(Subject|Activity|mean|std)", 
                                  names(combined_df), ignore.case = TRUE)]

#Add activity labels
activity_labels <- read.table("activity_labels.txt", as.is = TRUE)
combined_df <- merge(activity_labels, combined_df, by.x = "V1", by.y = "Activity")
combined_df$V1 <- NULL

#Rename column
colnames(combined_df)[colnames(combined_df) == "V2"] <- "Activity"

#Columnwise mean for Activity and Subject
library(dplyr)
combined_df <- ddply(combined_df, .(Activity, Subject), numcolwise(mean))

#Create data file
write.table(combined_df, file = "combined_data.txt",sep = " ",
            row.names = FALSE)