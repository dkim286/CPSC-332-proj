CREATE TRIGGER SpecialtyToAudit
BEFORE INSERT ON DOCTORSPECIALTY for each row	
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName)
    VALUES (New.doctorID, 'INSERT', New.specialtyID);
    
CREATE TRIGGER SpecialtyToAudit2    
BEFORE UPDATE ON DOCTORSPECIALTY for each row
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName)
	VALUES (firstName,'UPDATE', New.specialtyID);
