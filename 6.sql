CREATE TRIGGER SpecialtyToAudit
BEFORE INSERT ON DOCTORSPECIALTY for each row	
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName)
    VALUES (New.doctorID, 'INSERT', New.specialtyID);
  specialtyName varchar(50) not null,
  modDate date not null
);
    
       
CREATE TRIGGER SpecialtyToAudit
AFTER INSERT ON DOCTORSPECIALTY for each row
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
    VALUES ((SELECT firstName FROM PERSON where personID = 
				(SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'INSERT', 
            (SELECT specialtyName from SPECIALTY where specialtyID = 
				(SELECT specialtyID from DOCTORSPECIALTY where specialtyID = New.specialtyID)), 
            CURRENT_TIMESTAMP);
  
CREATE TRIGGER SpecialtyToAudit2
AFTER UPDATE ON DOCTORSPECIALTY for each row
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName, modDate)
    VALUES ((SELECT firstName FROM PERSON where personID = 
				(SELECT personID from DOCTOR where DoctorID = new.doctorID)), 'UPDATE', 
            (SELECT specialtyName from SPECIALTY where specialtyID = 
				(SELECT specialtyID from DOCTORSPECIALTY where specialtyID = New.specialtyID)), 
            CURRENT_TIMESTAMP);