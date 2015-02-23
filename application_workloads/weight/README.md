Application Workload: Weight
=======
*Analyzing Weight Data in the United States*

###Documentation
Here is the documentation for the application workload on weight data.  

##### Question
Is there a **relationship between population density and being overweight** for children in the United States? For example, does being in a less population dense area mean that people are more likely to be overweight?  

##### Hypothesis 
My guess was that areas that have higher population density should have less overweight people because high population dense areas rely less on cars for transportation and more on walking, biking, public transit. However, areas that are not densely population rely on driving for transport, which may lead to a higher proportion of overweight people. 

##### Data
There are two datasets used for this workload. Both of these datasets can be found under the *weight/input_data* directory.   

1) weight_data.csv   
This dataset contained information on the number of overweight children for given zip codes. To view the explicit schema of this dataset, visit *weight/input_data/weight_data.txt*.
    
2) population_zip.csv 
This dataset contained information on the number of people living in a specific zip code.   
##### Running the Workload 
Run the command: ``` bin/hive -f query/overweight_zips.sql ```   
This will execute the statements from the file **overweight_zips.sql** in batch mode. 

##### Results 


