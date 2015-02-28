USE medicalcosts;

DROP TABLE IF EXISTS centerdisparity;

CREATE TABLE IF NOT EXISTS centerdisparity AS
SELECT s1.service, s1.state, s1.name name1, s1.avgtotalpayments payments1, s2.name name2, s2.avgtotalpayments payments2
FROM services s1, services s2
WHERE s1.service = s2.service AND s1.state = s2.state AND (s1.avgtotalpayments/s2.avgtotalpayments < 0.5)
ORDER BY service, state;