/* Create a view which has First Names, Last Names of all doctors who gave out prescriptions for Vicodin. */
DROP VIEW IF EXISTS vicPresc;
CREATE VIEW vicPresc AS
SELECT firstName, lastName
FROM PERSON
JOIN DOCTOR ON PERSON.personID = DOCTOR.personID
JOIN PATIENTVISIT ON PATIENTVISIT.doctorID = DOCTOR.doctorID
JOIN PVISITDESCRIPTION ON PATIENTVISIT.visitID = PVISITDESCRIPTION.visitID
JOIN PRESCRIPTION ON PVISITDESCRIPTION.prescriptionID = PRESCRIPTION.prescriptionID AND PRESCRIPTION.prescriptionName = "vicodin";
