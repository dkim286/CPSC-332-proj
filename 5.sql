/* Modify the view created in Q4 to show the First Name and Last name of all doctors and their specialties ALSO include doctors who DO NOT have any specialty. */
ALTER VIEW docSpeclty AS
SELECT firstName, lastName, specialtyName
FROM PERSON
RIGHT JOIN DOCTOR ON PERSON.personID = DOCTOR.personID
LEFT JOIN DOCTORSPECIALTY ON DOCTOR.doctorID = DOCTORSPECIALTY.doctorID
LEFT JOIN SPECIALTY ON DOCTORSPECIALTY.specialtyID = SPECIALTY.specialtyID;
