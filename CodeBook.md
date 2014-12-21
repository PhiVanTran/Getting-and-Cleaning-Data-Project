## Code Book 

### Data Set Information

Raw data are obtained from UCI Machine Learning repository. In particular we used the Human Activity Recognition Using Smartphones Data Set [1], that was used by the original collectors to conduct experiments exploiting Support Vector Machine (SVM) [2].
Activity Recognition (AR) aims to recognize the actions and goals of one or more agents from a series of observations on the agents' actions and the environmental conditions [3]. The collectors used a sensor based approach employing smartphones as sensing tools. Smartphones are an effective solution for AR, because they come with embedded built-in sensors such as microphones, dual cameras, accelerometers, gyroscopes, etc.
The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually [4].
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

### Attribute Information

For each record in the dataset it is provided:

> Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
> Triaxial Angular velocity from the gyroscope.
> A 561-feature vector with time and frequency domain variables.
> Its activity label.
> An identifier of the subject who carried out the experiment.

### Step 0: Load data

After setting the source directory for the files, read into tables the data located in ./UCI HAR Dataset

> features.txt
> activity_labels.txt
> subject_train.txt
> train file and test file

### Step 1: Merge the training and the test sets to create one data set.
> finaldb <- rbind(trainingData, testData) ( 70%, 30%)

### Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

### Step 3: Uses descriptive activity names to name the activities in the data set

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

### Step 4: 

On the whole dataset, those columns with vague column names are corrected.

### Step 5:

Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called tidydb.txt, and uploaded to this repository.