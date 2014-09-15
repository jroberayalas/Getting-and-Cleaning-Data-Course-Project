Getting and Cleaning Data Course Project
========================================

## CodeBook

### Source

The data used for this project was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on Mon Sep 15 16:34:35 2014.

The source details are the following:

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

> Smartlab - Non Linear Complex Systems Laboratory

> DITEN - Università degli Studi di Genova, Genoa I-16145, Italy.

> activityrecognition@smartlab.ws

> www.smartlab.ws

### Data Set Information:

A series of experiments have been performed with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The training and test data contain an identifier of the subject who carried out the experiment, an activity label, and a total of 561 features from the time and frequency domain.

### Data Set Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

### Data Set Manipulation

The R script **run_analysis.R** performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The merged data set has a total of 10,299 observations, each with an identifier of the subject who carried out the experiment, an activity label, and 561 features from the time and frequency domain.

Originally, the activity names were encoded as integer values from 1 to 6. The R script **run_analysis.R** modifies this encoding and uses the following:

* 1 - WALKING
* 2 - WALKING UP
* 3 - WALKING DOWN
* 4 - SITTING
* 5 - STANDING
* 6 - LAYING

Once the the measurements on the mean and standard deviation for each feature were extracted, the data set is left with the same 10,299 observations, each with an identifier, an activity label, and only 66 features from the extraction. The features' names use the same description given in **Data Set Features**. The final list is given below: 

1. subject
2. activity
3. tBodyAcc-mean-X
4. tBodyAcc-mean-Y
5. tBodyAcc-mean-Z
6. tGravityAcc-mean-X
7. tGravityAcc-mean-Y
8. tGravityAcc-mean-Z
9. tBodyAccJerk-mean-X
10. tBodyAccJerk-mean-Y
11. tBodyAccJerk-mean-Z
12. tBodyGyro-mean-X
13. tBodyGyro-mean-Y
14. tBodyGyro-mean-Z
15. tBodyGyroJerk-mean-X
16. tBodyGyroJerk-mean-Y
17. tBodyGyroJerk-mean-Z
18. tBodyAccMag-mean
19. tGravityAccMag-mean
20. tBodyAccJerkMag-mean
21. tBodyGyroMag-mean
22. tBodyGyroJerkMag-mean
23. fBodyAcc-mean-X
24. fBodyAcc-mean-Y
25. fBodyAcc-mean-Z
26. fBodyAccJerk-mean-X
27. fBodyAccJerk-mean-Y
28. fBodyAccJerk-mean-Z
29. fBodyGyro-mean-X
30. fBodyGyro-mean-Y
31. fBodyGyro-mean-Z
32. fBodyAccMag-mean
33. fBodyBodyAccJerkMag-mean
34. fBodyBodyGyroMag-mean
35. fBodyBodyGyroJerkMag-mean
36. tBodyAcc-std-X
37. tBodyAcc-std-Y
38. tBodyAcc-std-Z
39. tGravityAcc-std-X
40. tGravityAcc-std-Y
41. tGravityAcc-std-Z
42. tBodyAccJerk-std-X
43. tBodyAccJerk-std-Y
44. tBodyAccJerk-std-Z
45. tBodyGyro-std-X
46. tBodyGyro-std-Y
47. tBodyGyro-std-Z
48. tBodyGyroJerk-std-X
49. tBodyGyroJerk-std-Y
50. tBodyGyroJerk-std-Z
51. tBodyAccMag-std
52. tGravityAccMag-std
53. tBodyAccJerkMag-std
54. tBodyGyroMag-std
55. tBodyGyroJerkMag-std
56. fBodyAcc-std-X
57. fBodyAcc-std-Y
58. fBodyAcc-std-Z
59. fBodyAccJerk-std-X
60. fBodyAccJerk-std-Y
61. fBodyAccJerk-std-Z
62. fBodyGyro-std-X
63. fBodyGyro-std-Y
64. fBodyGyro-std-Z
65. fBodyAccMag-std
66. fBodyBodyAccJerkMag-std
67. fBodyBodyGyroMag-std
68. fBodyBodyGyroJerkMag-std

Using the data set with extracted features, it is possible to perform the 5th step of the operations and create a second independent tidy data set with the average of each variable for each activity and each subject. This new data set has 180 rows (one for each combination of activity and subject), and 68 columns (one for the subject, one for the activity, and 66 for each of the measured features).

### References

* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
* Human Activity Recognition Using Smartphones Data Set at SmartLab website: https://sites.google.com/site/smartlabunige/software-datasets/har-dataset
* Getting and Cleaning Data Course Project Forum, David's project FAQ, https://class.coursera.org/getdata-007/forum/thread?thread_id=49
