
USE medicalcosts;

DROP TABLE IF EXISTS servicesbystate;

CREATE TABLE servicesbystate
AS SELECT service, state, AVG(avgTotalPayments)
FROM services
GROUP BY service, state
ORDER BY service;

ALTER TABLE servicesbystate
CHANGE COLUMN `_c2` stateavgpayments FLOAT;