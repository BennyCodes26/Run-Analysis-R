# Load required library
library(dplyr)

# Step 1: Merge the training and test sets
X_train <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/test/subject_test.txt")

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Step 2: Extract mean and standard deviation measurements
features <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/features.txt")
mean_std_indices <- grep("-(mean|std)\\(\\)", features[, 2])
X_mean_std <- X[, mean_std_indices]

# Step 3: Use descriptive activity names
activity_labels <- read.table("D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/activity_labels.txt")
y$activity <- factor(y$V1, levels = activity_labels$V1, labels = activity_labels$V2)

# Step 4: Label the data set with descriptive names
names(X_mean_std) <- features[mean_std_indices, 2]
names(X_mean_std) <- gsub("\\(|\\)", "", names(X_mean_std))
names(X_mean_std) <- tolower(gsub("-", "_", names(X_mean_std)))
data <- cbind(subject, y$activity, X_mean_std)
colnames(data)[1:2] <- c("subject", "activity")

# Step 5: Create a tidy data set with averages
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Save the tidy data
write.table(tidy_data, "D:/Microsoft Stuff/Downloads/datamemem/UCI HAR Dataset/tidy_data.txt", row.names = FALSE)