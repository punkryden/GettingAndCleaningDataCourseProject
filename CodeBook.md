## Code Book

The code book describe the data used in this project and the processing done to create the tidy data set.

**Variables**

*Step 1 :*
- X_test : feature of the test data set
- y_test : activity of the test data set
- subject_test : subject of the test data set
- X_train : feature of the train data set
- y_train : activity of the train data set
- subject_train : subject of the train data set
- feature : features labels of the data set
- activity_labels : activity labels of the data set

*Step 2 :*
- train_set : merge of the X_train, y_train and subject_train
- test_set : merge of the X_test, y_test and subject_test
- global_set : merge of the train and test set

*Step 3 :*
- tidy_set : global set with mean and standard deviation extraction

*Step 4 :*
- tidy_set_2 : aggregate tidy set by activity and subject

**Processing summary**

1. All the relevant data files are loaded
2. A merge between train et test data set is performed, column name are setted from the feature file (global_set)
3. An extraction is perfomed on the measurements on the mean and standard deviation for each measurement, activity are setted from the activity label file (tidy_set)
4. An aggregation by activity and subject is performed, a csv file is written (tidy_set_2)
