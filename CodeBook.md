# Getting and Cleaning the data: Peer Assignment 2

# Code Book

## Description of the use case and the data

I cite here and refer to the following work:

==================================================================
    
    
Human Activity Recognition Using Smartphones Dataset Version 1.0


==================================================================


Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


==================================================================
    
The experiment is desribed as follows:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

Refer to https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip for the complete dataset and it´s describtion.

The original dataset contains a lot of different variables.

Overall there are 561 features derived for the measurements of the following kind:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 

Furthermore there are:
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

For more information on the original dataset refer to the last chapter or directly by looking into https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Processing the data

The original dataset is processed in the following way. You can also refer to the run_analysis-markdown-file!

After downloading the zip-archive, it has to unzipped. It will create a directory with some textfiles.
At first we import the following tables:
-   X_train.txt
-   subject_train.txt
-   y_train.txt
-   X_test.txt
-   subject_test.txt
-   y_test.txt
-   features.txt

In the next step we merge the dataset by row-binding the data in X_test.txt and   X_train.txt. We also add columns which indicate for each measurement, to which subject the measurement corresponds, if it is train or test data and which activity was reported or predicted.

After that we subset the columns and taking only those variables into account which have information about the standard deviation or the mean of a measurement. 
This reduces the number of features from 561 to 66.

Afterwards we use the information in "activity_labels.txt" to give the activities the correct label.

We also rename the 66 features by using the full name of the observation instead of the short version. This makes it more clear what a feature stands for.

The final, tidy data is called:

whole_stdmean

## Second dataset

Using "whole_stdmean" a second, tidy dataset is generated. For each activity of each subject we take the average of the measurements we have in "whole_stdmean". By doing that we geht a dataset we get a dataset with 30*6=180 records.

This dataset is called:

df_avg

## Variables:

In both datasets "whole_stdmean" and "df_avg" we have the same variables:

[1] "trainortest"    
factor with two levels: "train" or "test"


[2] "subject" 
factor with 30 levels: 1, 2, 3,..., 30


[3] "activity"
factor with 6 levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

The rest of the variables are numeric and the names explain their measurement:
In "whole_stdmean" the variables are normalized and are bounded between [-1,1]
For for informations about the features refer to the "features_info.txt"

[4] "TimeBodyAcceleration-in_average-X-axis"                       
[5] "TimeBodyAcceleration-in_average-Y-axis"                       
[6] "TimeBodyAcceleration-in_average-Z-axis"                       
[7] "TimeGravityAcceleration-in_average-X-axis"                    
[8] "TimeGravityAcceleration-in_average-Y-axis"                    
[9] "TimeGravityAcceleration-in_average-Z-axis"                    
[10] "TimeBodyAccelerationJerk-in_average-X-axis"                   
[11] "TimeBodyAccelerationJerk-in_average-Y-axis"                   
[12] "TimeBodyAccelerationJerk-in_average-Z-axis"                   
[13] "TimeBodyGyroscope-in_average-X-axis"                          
[14] "TimeBodyGyroscope-in_average-Y-axis"                          
[15] "TimeBodyGyroscope-in_average-Z-axis"                          
[16] "TimeBodyGyroscopeJerk-in_average-X-axis"                      
[17] "TimeBodyGyroscopeJerk-in_average-Y-axis"                      
[18] "TimeBodyGyroscopeJerk-in_average-Z-axis"                      
[19] "TimeBodyAccelerationMagnitude-in_average"                     
[20] "TimeGravityAccelerationMagnitude-in_average"                  
[21] "TimeBodyAccelerationJerkMagnitude-in_average"                 
[22] "TimeBodyGyroscopeMagnitude-in_average"                        
[23] "TimeBodyGyroscopeJerkMagnitude-in_average"                    
[24] "FrequencyBodyAcceleration-in_average-X-axis"                  
[25] "FrequencyBodyAcceleration-in_average-Y-axis"                  
[26] "FrequencyBodyAcceleration-in_average-Z-axis"                  
[27] "FrequencyBodyAccelerationJerk-in_average-X-axis"              
[28] "FrequencyBodyAccelerationJerk-in_average-Y-axis"              
[29] "FrequencyBodyAccelerationJerk-in_average-Z-axis"              
[30] "FrequencyBodyGyroscope-in_average-X-axis"                     
[31] "FrequencyBodyGyroscope-in_average-Y-axis"                     
[32] "FrequencyBodyGyroscope-in_average-Z-axis"                     
[33] "FrequencyBodyAccelerationMagnitude-in_average"                
[34] "FrequencyBodyBodyAccelerationJerkMagnitude-in_average"        
[35] "FrequencyBodyBodyGyroscopeMagnitude-in_average"               
[36] "FrequencyBodyBodyGyroscopeJerkMagnitude-in_average"           
[37] "TimeBodyAcceleration-standard-deviation-X-axis"               
[38] "TimeBodyAcceleration-standard-deviation-Y-axis"               
[39] "TimeBodyAcceleration-standard-deviation-Z-axis"               
[40] "TimeGravityAcceleration-standard-deviation-X-axis"            
[41] "TimeGravityAcceleration-standard-deviation-Y-axis"            
[42] "TimeGravityAcceleration-standard-deviation-Z-axis"            
[43] "TimeBodyAccelerationJerk-standard-deviation-X-axis"           
[44] "TimeBodyAccelerationJerk-standard-deviation-Y-axis"           
[45] "TimeBodyAccelerationJerk-standard-deviation-Z-axis"           
[46] "TimeBodyGyroscope-standard-deviation-X-axis"                  
[47] "TimeBodyGyroscope-standard-deviation-Y-axis"                  
[48] "TimeBodyGyroscope-standard-deviation-Z-axis"                  
[49] "TimeBodyGyroscopeJerk-standard-deviation-X-axis"              
[50] "TimeBodyGyroscopeJerk-standard-deviation-Y-axis"              
[51] "TimeBodyGyroscopeJerk-standard-deviation-Z-axis"              
[52] "TimeBodyAccelerationMagnitude-standard-deviation"             
[53] "TimeGravityAccelerationMagnitude-standard-deviation"          
[54] "TimeBodyAccelerationJerkMagnitude-standard-deviation"         
[55] "TimeBodyGyroscopeMagnitude-standard-deviation"                
[56] "TimeBodyGyroscopeJerkMagnitude-standard-deviation"            
[57] "FrequencyBodyAcceleration-standard-deviation-X-axis"          
[58] "FrequencyBodyAcceleration-standard-deviation-Y-axis"          
[59] "FrequencyBodyAcceleration-standard-deviation-Z-axis"          
[60] "FrequencyBodyAccelerationJerk-standard-deviation-X-axis"      
[61] "FrequencyBodyAccelerationJerk-standard-deviation-Y-axis"      
[62] "FrequencyBodyAccelerationJerk-standard-deviation-Z-axis"      
[63] "FrequencyBodyGyroscope-standard-deviation-X-axis"             
[64] "FrequencyBodyGyroscope-standard-deviation-Y-axis"             
[65] "FrequencyBodyGyroscope-standard-deviation-Z-axis"             
[66] "FrequencyBodyAccelerationMagnitude-standard-deviation"        
[67] "FrequencyBodyBodyAccelerationJerkMagnitude-standard-deviation"
[68] "FrequencyBodyBodyGyroscopeMagnitude-standard-deviation"       
[69] "FrequencyBodyBodyGyroscopeJerkMagnitude-standard-deviation" 




## Original dataset

The original dataset includes the following files:
I cite:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
    ========
    Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
