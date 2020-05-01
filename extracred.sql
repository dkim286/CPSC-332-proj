DROP PROCEDURE IF EXISTS EXTRACRED;
CREATE PROCEDURE EXTRACRED ()
  SELECT COUNT(*) as num, 
         PRES.prescriptionName
    FROM (SELECT DISTINCT PRESCRIPTION.prescriptionName, 
		                  PERSON.personID
            FROM PRESCRIPTION, 
			     PVISITDESCRIPTION, 
				 PATIENTVISIT, 
				 PATIENT, 
				 PERSON
           WHERE PRESCRIPTION.prescriptionID = PVISITDESCRIPTION.prescriptionID
             AND PVISITDESCRIPTION.visitID = PATIENTVISIT.visitID
             AND PATIENTVISIT.patientID = PATIENT.patientID
             AND PATIENT.personID = PERSON.personID
             AND PERSON.city = 'Fullerton') as PRES
  GROUP BY PRES.prescriptionName
  ORDER BY num DESC;

