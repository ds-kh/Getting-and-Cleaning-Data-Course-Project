# Load packages 
library(dplyr)

# Download and unzip if needed 
if (!file.exists("UCI HAR Dataset")) {
  zip_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(zip_url, destfile = "dataset.zip")
  unzip("dataset.zip")
}

# Read metadata 
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Extract mean/std feature names 
selected_features <- grep("mean\\(\\)|std\\(\\)", features$feature)
selected_names <- features$feature[selected_features]

# Clean variable names for later use 
clean_names <- selected_names %>%
  gsub("\\()", "", .) %>%
  gsub("-", "_", .) %>%
  gsub("^t", "time_", .) %>%
  gsub("^f", "frequency_", .) %>%
  gsub("Acc", "accelerometer", .) %>%
  gsub("Gyro", "gyroscope", .) %>%
  gsub("Mag", "magnitude", .) %>%
  gsub("BodyBody", "body", .)

# Load datasets 

load_data <- function(type) {
  x <- read.table(file.path("UCI HAR Dataset", type, paste0("X_", type, ".txt")))[, selected_features]
  colnames(x) <- clean_names
  
  y <- read.table(file.path("UCI HAR Dataset", type, paste0("y_", type, ".txt")), col.names = "activity")
  subject <- read.table(file.path("UCI HAR Dataset", type, paste0("subject_", type, ".txt")), col.names = "subject")
  
  cbind(subject, y, x)
}

train_data <- load_data("train")
test_data <- load_data("test")

# Merge datasets 
merged_data <- rbind(train_data, test_data)

# Replace activity codes with labels 
merged_data$activity <- factor(
  merged_data$activity,
  levels = activity_labels$code,
  labels = activity_labels$activity
)

# Create tidy dataset 
tidy_data <- merged_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)


