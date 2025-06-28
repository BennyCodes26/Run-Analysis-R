# CodeBook for Human Activity Recognition Tidy Data

## Dataset Overview
The dataset originates from the Human Activity Recognition Using Smartphones Dataset, collected from 30 volunteers performing six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) using a smartphone (Samsung Galaxy S II) worn on the waist. 
The data includes accelerometer and gyroscope readings, pre-processed into 561 features, with 70% used for training and 30% for testing.

## Variables
- `subject`: ID of the volunteer (1-30).
- `activity`: Activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
- `tBodyAcc-XYZ_mean`, `tBodyAcc-XYZ_std`, `tGravityAcc-XYZ_mean`, `tGravityAcc-XYZ_std`, etc.: Mean and standard deviation measurements for body acceleration, gravity acceleration, and gyroscope signals across X, Y, Z axes in time and frequency domains (e.g., `tBodyAcc-mean()-X`, `tBodyAcc-std()-Y`). Names are transformed to lowercase with underscores (e.g., `tbodyacc_mean_x`).

## Transformations
1. **Merging**: Combined `X_train.txt`, `X_test.txt`, `y_train.txt`, `y_test.txt`, `subject_train.txt`, and `subject_test.txt` into a single dataset.
2. **Extraction**: Selected only features containing "mean()" or "std()" from the 561 features.
3. **Activity Naming**: Replaced numeric labels with descriptive names using `activity_labels.txt`.
4. **Labeling**: Renamed variables by removing parentheses and hyphens, converting to lowercase with underscores.
5. **Tidy Data**: Calculated the average of each variable for each `subject` and `activity` combination.

## Output
The resulting `tidy_data.txt` contains the average of each selected variable for each subject and activity, suitable for further analysis.
