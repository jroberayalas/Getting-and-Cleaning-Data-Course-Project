## Merges the training and the test sets to create one data set.
# Read training X file and name its variables
X.train <- read.table(file = "./Data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
names.features <- read.table(file = "./Data/UCI HAR Dataset/features.txt", header = FALSE)
names(X.train) <- names.features[, 2]

# Read activity train file and apply descriptive activity names
activity.train <- read.table(file = "./Data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
activity.train <- factor(activity.train$V1)

library(plyr)
activity.train <- mapvalues(activity.train, 
                            from = c("1", "2", "3", "4", "5", "6"), 
                            to = c("WALKING", "WALKING UP", "WALKING DOWN", "SITTING", "STANDING", "LAYING"))

# Read subject train file and name it subject
subject.train <- read.table(file = "./Data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")

# Create training set
training <- cbind(subject = subject.train, X.train, activity = activity.train)

# Read testing X file and name its variables
X.test <- read.table(file = "./Data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
names(X.test) <- names.features[, 2]

# Read activity test file and apply descriptive activity names
activity.test <- read.table(file = "./Data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
activity.test <- factor(activity.test$V1)

library(plyr)
activity.test <- mapvalues(activity.test, 
                           from = c("1", "2", "3", "4", "5", "6"), 
                           to = c("WALKING", "WALKING UP", "WALKING DOWN", "SITTING", "STANDING", "LAYING"))

# Read subject test file and name it subject
subject.test <- read.table(file = "./Data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")

# Create testing set
testing <- cbind(subject = subject.test, X.test, activity = activity.test)

# Create single data set
data <- rbind(training, testing)


## Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
data <- tbl_df(data)

# Extract means for each measurement (33 in total)
selection.mean <- data %>% select(contains("mean()")) %>% 
    select(-contains("Freq()")) %>%
    select(-contains("angle"))

# Extract standard deviation for each measurement (33 in total)
selection.std <- data %>% select(contains("std"))

# Create final data set
data.extracted <- cbind(subject = data$subject, selection.mean, selection.std, activity = data$activity)


## Create a second, independent tidy data set with the average of each variable for each activity and each subjec
averages <- data.extracted %>% group_by(subject, activity) %>%
    summarise_each(funs(mean))