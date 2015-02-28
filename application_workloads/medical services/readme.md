#Application Workload: Medical Services
=======
*Finding disparities in the costs of various medical services in the US*


#### Objective
To compare the cost of specific medical services offered by medical centers accross states and also within states. This information, if easily organized and accessed, could benefit an individual desiring to save money on a costly procedure.
 

#### Data
The dataset used comprises records of the average cost of each service offered by each medical center in the coutry. The records include other information such as the location of the medical centers. The dataset is in the directory:
hive/application_workloads/medical services/dataset

#### Running the Workload 
The scripts used to process the data are in the directory: 
hive/application_workloads/medical services/scripts
NOTE: The location of the dataset used in the create_services_table.sql file correspoonds to the location on the creator's local machine. For the script to function, change this location to the corresponding abolute path of the IPPS.csv file on your machine.

#### Interpretation
The workload uncovers two interesting datasets:
1) Pairs of states for which their commonly offered service (such as a specific surgical procedure) has a large price gap (the gap paramenter can be changed within the script to find gaps of different sizes).
2) Pairs of medical centers within each state that have significant cost gaps (also on a service-by-service basis).

