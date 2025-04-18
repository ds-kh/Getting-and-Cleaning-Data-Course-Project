# Getting and Cleaning Data Course Project

## Overview

This project is part of the "Getting and Cleaning Data" course on Coursera. It demonstrates the process of downloading, cleaning, merging, and tidying a complex real-world dataset. The dataset used is the Human Activity Recognition (HAR) data collected from Samsung Galaxy S smartphones worn by study participants.

The result is a tidy dataset where each row is a unique combination of a subject and an activity, and each column represents the **average of a sensor measurement** for that combination.

## Source Dataset

Original data: [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download link used in the script:
  [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Files in this Repository

- `run_analysis.R`: R script that performs all data processing steps.
- `CodeBook.md`: Describes the variables, the source data, and all transformations applied.
- `README.md`: This file, explaining the project and how to use the script.

## How to Run the Script

1. Download or clone this repository.
2. Open `run_analysis.R` in RStudio or your R console.
3. Run the script:
  - It downloads and unzips the dataset (if not already present).
- Loads and merges training and test data.
- Extracts only the measurements on the mean and standard deviation.
- Applies descriptive variable names.
- Replaces activity codes with labels.
- Computes the average of each variable by subject and activity.
4. The final tidy dataset will be written to your working directory as `tidy_data`.

## Dependencies

- R version ≥ 4.0.0
- Base R functions (no external packages required beyond `dplyr`)
