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

Then, the three sets (*X*, *y*, and *subject*) were merged with *cbind()*. After that, the 


## The Variables
