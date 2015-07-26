Following files were used to get the combined data.
subject_train.txt - contains information of subjects for training
y_train.txt - activity data,
X_train.txt - measurements data,
subject_test.txt - contains information of subjects for training,
y_test.txt - activity data,
X_test.txt - measurements data,
activity_labels - contains activity text,
features.txt - measurement names

Training and Test data was combined for subject, activity and measurements. Then this data was combined to get all rows.
Activity label were added. Measurement headers were added for measurement columns.

In output file (combined_data.txt) first 2 colunns contain Activity and Subject data. Other columns contains average wrt Activity and Subject.
