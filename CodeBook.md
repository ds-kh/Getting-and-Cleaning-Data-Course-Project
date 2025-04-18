# Code Book

## Introduction

This code book describes the variables, data transformations, and structure of the final tidy dataset `tidy_dataset.txt` produced by `run_analysis.R`.

## Source Data Description

- Dataset: Human Activity Recognition Using Smartphones
- Link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
- Observations: Accelerometer and gyroscope readings collected from 30 volunteers performing 6 activities.

## Steps Performed in `run_analysis.R`

1. **Download and unzip** the dataset if not already present.
2. **Load features** and **activity labels** from metadata files.
3. **Filter features**: Select only measurements related to **mean()** and **std()** using regular expressions.
4. **Read training and test datasets**:
  - Measurement data (`X_train.txt`, `X_test.txt`)
- Activity labels (`y_train.txt`, `y_test.txt`)
- Subject IDs (`subject_train.txt`, `subject_test.txt`)
5. **Merge the training and test datasets** into one combined dataset.
6. **Label columns** using cleaned and descriptive names:
  - Replace abbreviations like `Acc`, `Gyro`, `Mag`
- Use `time_`/`frequency_` prefixes
- Replace dashes with underscores and remove parentheses
7. **Replace activity codes** with descriptive labels (e.g., `WALKING`, `LAYING`).
8. **Group by subject and activity**, then calculate the **mean for each variable**.


## Variables in `tidy_data`

- **Rows**: 180 (30 subjects × 6 activities)
- **Columns**: 68 (1 subject + 1 activity + 66 features)

### Column Descriptions

- `subject`: Integer identifier (1 to 30) for each participant.
- `activity`: Descriptive activity label, one of:
  - `WALKING`
- `WALKING_UPSTAIRS`
- `WALKING_DOWNSTAIRS`
- `SITTING`
- `STANDING`
- `LAYING`
- **Feature columns (66)**: The average value of each sensor signal (originally selected for `mean()` or `std()`) per subject and activity. Example variable names:
  - `time_body_accelerometer_mean_x`
- `time_body_accelerometer_std_y`
- `frequency_body_gyroscope_mean_z`

### Variable Naming Convention

All measurement variable names are:
  
  - Lowercase
- In `snake_case` format
- Cleaned for readability and consistency:
  - Prefix `t` → `time_`
- Prefix `f` → `frequency_`
- `Acc` → `accelerometer`
- `Gyro` → `gyroscope`
- `Mag` → `magnitude`
- Dashes → underscores
- Parentheses removed

## Final Output

The final tidy dataset is (`tidy_data`) with the average of each variable for each activity and each subject.
