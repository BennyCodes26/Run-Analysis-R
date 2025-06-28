## Project Overview
This project demonstrates the ability to collect, work with, and clean a dataset to prepare tidy data for later analysis. 
The dataset used is the Human Activity Recognition Using Smartphones Dataset, which includes data from 30 volunteers performing six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) captured via smartphone sensors.

## Files
- `run_analysis.R`: The main R script that processes the dataset.
- `tidy_data.txt`: The resulting tidy dataset.
- `CodeBook.md`: Documentation of variables, data, and transformations.

## How to Run
1. Ensure all dataset files (e.g., `train/`, `test/`, `features.txt`, etc.) are in the working directory.
2. Install the `dplyr` package in R: `install.packages("dplyr")`.
3. Run the `run_analysis.R` script in R to generate `tidy_data.txt`.

## Script Functionality
The `run_analysis.R` script performs the following steps:
1. Merges the training and test sets into one dataset.
2. Extracts measurements on mean and standard deviation.
3. Assigns descriptive activity names.
4. Labels the dataset with descriptive variable names.
5. Creates a tidy dataset with the average of each variable for each activity and subject.

## Connection
This repository contains a single script (`run_analysis.R`) that handles the entire data processing pipeline, producing a tidy dataset ready for analysis.
