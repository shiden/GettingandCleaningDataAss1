GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.


This file explains the tidy.txt dervived from the run_analysis.R scripts. the mechanics of the run_analysis.R can be found in the README.md file located in this directory.

# script output

> source("run_analysis.R")
data.table 1.10.4.3
  The fastest way to learn (by data.table authors): https://www.datacamp.com/courses/data-analysis-the-data-table-way
  Documentation: ?data.table, example(data.table) and browseVignettes("data.table")
  Release notes, videos and slides: http://r-datatable.com

## dimensions of x_data
[1] 10299   561

## dimensions of y_data
[1] 10299     1

## dimenstions of subject_data
[1] 10299     1

## length of index
[1] 66

## dimensions of x_data with newstd deviation and mean
[1] 10299    66


## replace all the values with the labels from activity_label.txt
  activityNum
1    STANDING
2    STANDING
3    STANDING
4    STANDING
5    STANDING
6    STANDING


## print the cleaned data after the column merge
  Subject_ID Activity_Type tBodyAcc-mean()-X tBodyAcc-mean()-Y
1          1      STANDING         0.2885845       -0.02029417
2          1      STANDING         0.2784188       -0.01641057
3          1      STANDING         0.2796531       -0.01946716
4          1      STANDING         0.2791739       -0.02620065
5          1      STANDING         0.2766288       -0.01656965
6          1      STANDING         0.2771988       -0.01009785
  tBodyAcc-mean()-Z tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z
1        -0.1329051       -0.9952786       -0.9831106       -0.9135264
2        -0.1235202       -0.9982453       -0.9753002       -0.9603220
3        -0.1134617       -0.9953796       -0.9671870       -0.9789440
4        -0.1232826       -0.9960915       -0.9834027       -0.9906751
5        -0.1153619       -0.9981386       -0.9808173       -0.9904816
6        -0.1051373       -0.9973350       -0.9904868       -0.9954200
  tGravityAcc-mean()-X
1            0.9633961
2            0.9665611
3            0.9668781
4            0.9676152
5            0.9682244
6            0.9679482

## print the dimensions of the cleaned data table
[1] 180  68

## print the resulting tidy.txt
## 
    Subject_ID      Activity_Type tBodyAcc-mean()-X tBodyAcc-mean()-Y
 1:          1           STANDING         0.2789176      -0.016137590
 2:          1            SITTING         0.2612376      -0.001308288
 3:          1             LAYING         0.2215982      -0.040513953
 4:          1            WALKING         0.2773308      -0.017383819
 5:          1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505
 6:          1   WALKING_UPSTAIRS         0.2554617      -0.023953149
 7:          2           STANDING         0.2779115      -0.018420827
 8:          2            SITTING         0.2770874      -0.015687994
 9:          2             LAYING         0.2813734      -0.018158740
10:          2            WALKING         0.2764266      -0.018594920
11:          2 WALKING_DOWNSTAIRS         0.2776153      -0.022661416
12:          2   WALKING_UPSTAIRS         0.2471648      -0.021412113

