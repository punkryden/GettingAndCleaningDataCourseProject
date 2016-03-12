#
# 1. Merges the training and the test sets to create one data set.
#

# Download and unzip the getdata-projectfiles-UCI HAR Dataset.zip file in your data directory

# Load the data
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
feature <- read.table("./data/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

# Merge the data set
train_set <- cbind(subject_train, y_train, X_train)
test_set <- cbind(subject_test, y_test, X_test)
global_set <- rbind(train_set, test_set)

#
# 4. Appropriately labels the data set with descriptive variable names.
#

colnames(global_set) <- c("subjectId", "activity", as.character(feature$V2))

#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#

# Extract features with a regex
extract_features <- grepl("mean\\(\\)|std\\(\\)", feature$V2)
# Don't forget to keep the subjectId and activity columns
extract_features_2 <- c(TRUE, TRUE,extract_features)
# Apply on global set to extract the wanted columns
tidy_set <- global_set[extract_features_2]

#
# 3. Uses descriptive activity names to name the activities in the data 
#

tidy_set$activity <- factor(tidy_set$activity, labels=activity_labels$V2)

#
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#

# Aggregate by activity and subject
tidy_set_2 = aggregate(tidy_set, by=list(activity_group = tidy_set$activity, subjectId_group = tidy_set$subjectId), mean)
# Remove useless column
tidy_set_2$subjectId <- NULL
tidy_set_2$activity <- NULL

# Write the tidy set file
write.table(tidy_set_2, "./data/UCI HAR Dataset/tidy_set_2.txt", row.names=FALSE)
