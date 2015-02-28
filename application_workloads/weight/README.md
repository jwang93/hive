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
    
2) population_density_zip.csv 
This dataset contained information on the population density of a specific zip code. To view the explicit schema of this dataset, visit *weight/input_data/population_density_zip.txt*.

##### Running the Workload 
Run the command: ``` bin/hive -f query/overweight_zips.sql ```   
This will execute the statements from the file **overweight_zips.sql** in batch mode. 

##### Results 
Average population density per zip code: **1254.65**  
Average population density per zip code for the top 100 overweight zip codes: **953.67** (-300.98)  
Average population density per zip code for the least 100 overweight zip codes: **1454.06** (+199.41)

Given these numbers, it seems like it is definitely the case that the more overweight a zip code is, the less dense the population is. This may be because a lower population density means that people rely more on driving for transportation as opposed to more crowded areas where people are more likely to walk, bike, or take public transportation. 



