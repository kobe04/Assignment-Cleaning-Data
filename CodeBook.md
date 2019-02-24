# CodeBook
## Contents
  - Introduction
  - The Data
  - The Cleaning
  - The Variables

## Introduction

This CodeBook describes the process, data, and variables used for the assignment of Week 4 of the Coursera Course *Getting and Cleaning Data*.
This assignment is designed to test the ability to collect, work with, and clean a dataset. The final result is a combination of four files:
1. The README.md
2. The script **run_analysis.R**
3. This CodeBook.md
4. The tidy dataset, **Tidy dataset.txt**

## The Data

The data that was used comes from several recordings of 30 subjects who performed six daily routine activities and carried a smartphone with inertial sensors (Anguita et al., 2012).
The raw data was spread over eight different .txt files:
1. *features.txt* This file contained a list of all possible features and their names.
2. *activity_labels.txt* This file contained the labels for the activities that were performed.
3. *X_train.txt* This file contained the values that were registered during the training.
4. *y_train.txt* This file contained the activities that were performed during the training.
5. *subject_train.txt* This file contained rows, which represented all performed training activities. Each row identified the subject that performed the activity. The range was 1:30.
6. *X_test.txt* This file contained the values that were registered during the tests. 
7. *y_test.txt* This file contained the activities that were performed during the tests.
8. *subject_test.txt* This file contained rows, which represented all performed test activities. Each row identified the subject that performed the activity. The range was 1:30.

## The Cleaning

The procedure to create one tidy dataset out of the raw data started with merging the *X-train.txt* and *y_train.txt* with each other. The two *subject* files were also merged. The same was done for *X_test.txt* and *y_test.txt*.
In all three cases, the merging was done with *rbind()*.

Next, the variable name for the *y* set was changed to "Activity". The variable name of the *subject* set was changed to "Subject".
The assignment asked that the dataset would only contain variables that held either a mean or a standard deviation. So, a subset of *X* was created on this basis.
In order to do this, *features.txt* was used to establish the variable names and to select the appropriate variables.

Then, the three sets (*X*, *y*, and *subject*) were merged with *cbind()*. After that, the values in the variable "Activity" were changed to a factor-variable with the activity-names. These names were found in *activity_labels.txt*.

Then, the names of the other variables were altered so that they become more understandable and readable.

The final step was to write the tidy dataset. This set contains the mean for each variable per subject and activity. This resulted in **Tidy dataset.txt**


## The Variables

There are 88 variables in the tidy dataset. Two variables are factor-variables. The other 86 are numerical variables.
- *Subject* This variable holds a number to identify which subject performed the test or training that resulted in the data. There are 30 subjects.
- *Activity* This variable describes which activity was performed. There are six possible activities:
    - Walking
    - Standing
    - Laying
    - Walking Downstairs
    - Walking Upstairs
    - Sitting

Because **Tidy dataset.txt** contains the means per subject and per activity, there are a total of 180 observations.

The other 86 variables contain numeric data. The range of all these variables is -1:1. The variables that end on *Mean()* contain the aggregate of the mean. The variables that end on *Standard Deviation()* contain the aggregate of the Standard deviation.
