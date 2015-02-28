	DROP DATABASE IF EXISTS medicalcosts CASCADE;
	CREATE DATABASE IF NOT EXISTS medicalcosts
	COMMENT 'Holds all tables with medical information'
	WITH DBPROPERTIES ('creator' = 'Dylan Jackson');
	USE medicalcosts;
	CREATE TABLE IF NOT EXISTS medicalcosts.services(
		service STRING,
		ID INT,
		name STRING,
		street STRING,
		city STRING,
		state STRING,
		zip INT,
		region STRING,
		discharges INT,
		coveredCharges FLOAT,
		avgTotalPayments FLOAT,
		avgMedicarePayments FLOAT
	)
	COMMENT 'Costs of medical services wrt medical center'
	ROW FORMAT DELIMITED
	FIELDS TERMINATED BY '^'
	LINES TERMINATED BY '\n'
	STORED AS TEXTFILE;
	LOAD DATA LOCAL INPATH '/home/ubuntu/cs516/datasets/IPPS.csv'
	INTO TABLE services;