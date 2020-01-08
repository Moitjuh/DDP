Developing Data Products - Forest Fire Shiny App
========================================================
author: Annette Spithoven
date: Dec 7, 2019
autosize: true

Assignment Objective
========================================================
This presentation is part of the Course Project for the Coursera Developing Data Products class. The peer assessed assignment has two parts. First, a Shiny application should be created and deployed on Rstudio's servers. Second, Slidify or Rstudio Presenter should be used to prepare a reproducible pitch presentation about the application. 
This presentation adresses the second part of the course project.

The app developed for the first part of the assignment is avalilable at:
https://annettes.shinyapps.io/DevelopingDataProductsWk4/

<a href="https://annettes.shinyapps.io/DevelopingDataProductsWk4/" target="_blank">Hello, world!</a>

Source code for ui.R and server.R files are available on the GitHub:
https://github.com/Moitjuh/DDP

The Shiny Application 
========================================================
The app helps the user to explore the data on the [Forest Fires Data set from the UCI machine learning repository](
https://archive.ics.uci.edu/ml/datasets/forest+fires) (more detailed description is on the next slide).

First, the user can select a variable of interst (and a month) to examine the distribution of values for the variable.

Second, the relation of that variable with the area burned during the forest fire can be examined. 

Lastly, the user can explore the raw data. 

Data
========================================================
Current project uses the [Forest Fires Data set from the UCI machine learning repository](
https://archive.ics.uci.edu/ml/datasets/forest+fires). 
The dataset contains information about forest fires in the northeast region of Portugal. Variables are the burned area, various meteorological data and various Fire Weather Indeces. 




```r
summary(forestdata[5:13])
```

```
      FFMC            DMC              DC             ISI        
 Min.   :18.70   Min.   :  1.1   Min.   :  7.9   Min.   : 0.000  
 1st Qu.:90.20   1st Qu.: 68.6   1st Qu.:437.7   1st Qu.: 6.500  
 Median :91.60   Median :108.3   Median :664.2   Median : 8.400  
 Mean   :90.64   Mean   :110.9   Mean   :547.9   Mean   : 9.022  
 3rd Qu.:92.90   3rd Qu.:142.4   3rd Qu.:713.9   3rd Qu.:10.800  
 Max.   :96.20   Max.   :291.3   Max.   :860.6   Max.   :56.100  
      temp             RH              wind            rain        
 Min.   : 2.20   Min.   : 15.00   Min.   :0.400   Min.   :0.00000  
 1st Qu.:15.50   1st Qu.: 33.00   1st Qu.:2.700   1st Qu.:0.00000  
 Median :19.30   Median : 42.00   Median :4.000   Median :0.00000  
 Mean   :18.89   Mean   : 44.29   Mean   :4.018   Mean   :0.02166  
 3rd Qu.:22.80   3rd Qu.: 53.00   3rd Qu.:4.900   3rd Qu.:0.00000  
 Max.   :33.30   Max.   :100.00   Max.   :9.400   Max.   :6.40000  
      area        
 Min.   :   0.00  
 1st Qu.:   0.00  
 Median :   0.52  
 Mean   :  12.85  
 3rd Qu.:   6.57  
 Max.   :1090.84  
```

The Shiny Application Usage
========================================================

The application consist of two panels: Left panel and Main panel. 
The details are as follows:

1) Left panel: The panel displays two dropdown menu's. Here the user can select a month and variable of interest of interest. The variables that can be selected are only the explanatory varaibles (so excluding burned area). 

2) Main panel: There are three tabs.
  * The first tab gives an description of the variable of interest in the selected month.
  * The Second tab shows the relation between the choosen variable (in the selected month) and the area that is burned.
  * The third tab provides a data table with the raw data. 


