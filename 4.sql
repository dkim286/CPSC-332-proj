/* Create a view which shows the First Name and Last name of all doctors and their specialty’s. */
DROP VIEW IF EXISTS docSpeclty;
CREATE VIEW docSpeclty AS
SELECT firstName, lastName, specialtyName
FROM PERSON
JOIN DOCTOR ON PERSON.personID = DOCTOR.personID
JOIN DOCTORSPECIALTY ON DOCTOR.doctorID = DOCTORSPECIALTY.doctorID
JOIN SPECIALTY ON DOCTORSPECIALTY.specialtyID = SPECIALTY.specialtyID;
