
USE medicalcosts;

DROP TABLE IF EXISTS statecomparison;

CREATE TABLE IF NOT EXISTS statecomparison AS
SELECT s1.service, s1.state state1, s1.stateavgpayments state1avgpayments, s2.state state2, s2.stateavgpayments state2avgpayments
FROM servicesbystate s1, servicesbystate s2
WHERE s1.service = s2.service AND s1.stateavgpayments/s2.stateavgpayments < 0.5
ORDER BY s1.service, state1;