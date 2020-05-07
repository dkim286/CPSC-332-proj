DROP TABLE IF EXISTS AUDIT;
CREATE TABLE AUDIT (
	auditID int AUTO_INCREMENT PRIMARY KEY,
	dFirstName varchar(10) not null,
	tableAction char(6) not null,
	specialtyName varchar(50) not null,
	modDate date not null
);
                           
DROP TRIGGER IF EXISTS SpecialtyToAudit;       
CREATE TRIGGER SpecialtyToAudit
AFTER INSERT ON DOCTORSPECIALTY for each row
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
    VALUES ((SELECT firstName FROM PERSON where personID = 
				(SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'INSERT', 
            (SELECT specialtyName from SPECIALTY where specialtyID = new.specialtyID),
            CURRENT_TIMESTAMP);
  
DROP TRIGGER IF EXISTS SpecialtyToAudit2;   
CREATE TRIGGER SpecialtyToAudit2
AFTER UPDATE ON DOCTORSPECIALTY for each row
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
    VALUES ((SELECT firstName FROM PERSON where personID = 
				(SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'UPDATE', 
            (SELECT specialtyName from SPECIALTY where specialtyID = new.specialtyID),
            CURRENT_TIMESTAMP);

