DROP VIEW IF EXISTS robertsPatients;
CREATE VIEW robertsPatients
AS
SELECT firstName, phoneNum
FROM PERSON
WHERE personID = (
 SELECT personID
    FROM PATIENT
    WHERE patientID = (
  SELECT patientID
  FROM PATIENTVISIT
  WHERE doctorID = 'RS6000'));
