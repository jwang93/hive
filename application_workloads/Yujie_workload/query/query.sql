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

DROP TABLE IF EXISTS us_male_income;

CREATE TABLE us_male_income
COMMENT 'The annual income of the male in United States'
AS SELECT age, fnlwgt, workclass, education, race, capital_gain
FROM income i
WHERE i.sex = 'Male' and i.native_country = 'United-States';

DROP TABLE IF EXISTS us_female_income;

CREATE TABLE us_female_income
COMMENT 'The annual income of the female in United States'
AS SELECT age, fnlwgt, workclass, education, race, capital_gain
FROM income i
WHERE i.sex = 'Female' and i.native_country ='United-States';

SELECT i1.race, i1.workclass, i1.education, i1.fnlwgt, i2.fnlwgt
FROM us_male_income i1 JOIN us_female_income i2 ON i1.education = i2.education and i1.workclass = i2.workclass
WHERE i1.race = 'White' AND i2.race = 'White';

