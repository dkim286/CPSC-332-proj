CREATE TABLE AUDIT (
  dFirstName varchar(10) not null,
  tableAction char(6) not null,
  specialtyName varchar(50) not null
);

CREATE TRIGGER SpecialtyToAudit
AFTER INSERT ON DOCTORSPECIALTY for each row
begin
	-- SELECT NEW.doctorID, NEW.specialtyID
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName)
    VALUES (New.doctorID, Action, New.specialtyID); 
end;


/*
CREATE TRIGGER SpecialtyToAudit   
BEFORE INSERT -- or UPDATE
ON DOCTORSPECIALTY for each row 
begin
    INSERT INTO AUDIT (dFirstName, tableAction, specialtyName)
    VALUES (doctorID, Action, specialtyID);
end;




 
	-- INSERT INTO AUDIT
	-- SELECT doctorID
    
CREATE TRIGGER specialityToAudit 
AFTER INSERT on DoctorSpeciality -- or UPDATE 
AS
{sql_statements}

-- Trigger on a CREATE, ALTER, DROP, GRANT, DENY, 
-- REVOKE or UPDATE statement (DDL Trigger)  
  
  
CREATE OR REPLACE TRIGGER Log_salary_increase
  AFTER UPDATE ON emp
    FOR EACH ROW
      WHEN (NEW.Sal > 1000)
BEGIN
  INSERT INTO Emp_log (Emp_id, Log_date, New_salary, Action)
    VALUES (:NEW.Empno, SYSDATE, :NEW.SAL, 'NEW SAL');
END;
  

	INSERT INTO AUDIT
	SELECT * FROM inserted
    
    -- columns dont match
    DECLARE Col1 VARCHAR(10)
    DECLARE Col2 VARCHAR(10)
    
    SELECT Col1=specialtyID,
    Col2=specialtyName,
    FROM inserted
    
    INSERT INTO AUDIT(dFirstName,specialtyName)
    SELECT Col1,Col2 
    
    */