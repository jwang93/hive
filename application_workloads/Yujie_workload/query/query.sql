CREATE TABLE IF NOT EXISTS income (
	age INT,
	workclass STRING,
	fnlwgt INT,
	education STRING,
	education_num INT,
	marital_status STRING,
	occupation STRING,
	relationship STRING,
	race STRING,
	sex  STRING,  
	capital_gain INT,
	capital_loss INT,
	hours_per_week INT,
	native_country STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/usr/local/apache-hive-1.0.0-bin/warehouse/income';

LOAD DATA LOCAL INPATH '/home/niyujie/Documents/Yujie_dataset/application_workloads/Yujie_workload/input/income.csv' 
OVERWRITE into TABLE income;
