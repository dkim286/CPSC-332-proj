CREATE DATABASE IF NOT EXISTS DocOffice;
USE DocOffice;


DROP TABLE IF EXISTS PVISITTEST;
DROP TABLE IF EXISTS TEST;
DROP TABLE IF EXISTS PVISITDESCRIPTION;
DROP TABLE IF EXISTS PRESCRIPTION;
DROP TABLE IF EXISTS PATIENTVISIT;
DROP TABLE IF EXISTS DOCTORSPECIALTY;
DROP TABLE IF EXISTS SPECIALTY;
DROP TABLE IF EXISTS DOCTOR;
DROP TABLE IF EXISTS PATIENT;
DROP TABLE IF EXISTS PERSON;


CREATE TABLE PERSON (
  personID char(7) not null,
  firstName varchar(30),
  lastName varchar(30),
  streetAddress varchar(100) not null,
  city varchar(50) not null,
  state char(2) not null,
  zip char(5) not null,
  phoneNum char(10) not null,
  ssn char(9) not null,
  primary key (personID)
);

CREATE TABLE PATIENT (
  patientID char(7) not null,
  phoneNum char(10) not null,
  dob date,
  personID char(7) not null,
  primary key (patientID),
  foreign key (personID) references PERSON(personID)
);

CREATE TABLE DOCTOR (
  doctorID char(6) not null,
  medicalDegree varchar(20) not null,
  personID char(7) not null,
  primary key (doctorID),
  foreign key (personID) references PERSON(personID)
);

CREATE TABLE SPECIALTY (
  specialtyID varchar(20) not null,
  specialtyName varchar(50) not null,
  primary key (specialtyID)
);

CREATE TABLE DOCTORSPECIALTY (
  doctorID char(6) not null,
  specialtyID varchar(20) not null,
  primary key (doctorID, specialtyID),
  foreign key (doctorID) references DOCTOR(doctorID),
  foreign key (specialtyID) references SPECIALTY(specialtyID)
);

CREATE TABLE PATIENTVISIT (
  visitID varchar(10) not null,
  patientID char(7) not null,
  doctorID char(6) not null,
  visitDate date not null,
  docNote varchar(200),
  primary key (visitID),
  foreign key (patientID) references PATIENT(patientID),
  foreign key (doctorID) references DOCTOR(doctorID)
);

CREATE TABLE PRESCRIPTION (
  prescriptionID varchar(10) not null,
  prescriptionName varchar(100) not null,
  primary key (prescriptionID)
);

CREATE TABLE PVISITDESCRIPTION (
  visitID varchar(10) not null,
  prescriptionID varchar(10) not null,
  primary key (visitId, prescriptionID),
  foreign key (visitID) references PATIENTVISIT(visitID),
  foreign key (prescriptionID) references PRESCRIPTION(prescriptionID)
);

CREATE TABLE `TEST` (
  testID varchar(10) not null,
  testName varchar(100) not null,
  primary key (testID)
);

CREATE TABLE PVISITTEST (
  visitID varchar(10) not null,
  testID varchar(10) not null,
  primary key (visitID, testID),
  foreign key (visitID) references PATIENTVISIT(visitID),
  foreign key (testID) references TEST(testID)
);


INSERT INTO PERSON 
(personID, firstName, lastName,         streetAddress,         city,              state, zip,       phoneNum, ssn) VALUES
('ma100', 'Mark',   'Antony',           '123 Nile Ave',        'Huntington Beach', 'CA', '98765', '9493334444', '111003333'),
('nb090', 'Nimby',  'Baron',            '99 My Way',           'Irvine',           'CA', '92222', '9491114444', '000332222'),
('ma204', 'Max',    'Axen',             '44 Tree Rd. APT #M8', 'Thousand Oaks',    'CA', '98080', '9491113333', '111996666'),
('xx311', 'Xavier', 'Xylophone',        '4 4th Lane',          'Orlando',          'FL', '27799', '9491119999', '613004444'),
('as926', 'Arnold', 'Shirtsnegotiator', '92 Choppa Pkwy',      'Sacramento',       'CA', '91191', '9490009999', '333886666'),
('ss666', 'Sordid', 'Snake',            '5 Shadowy Moose Ave', 'Fairfax',          'VA', '11133', '1113334444', '000995555'),
('lg486', 'Leorge', 'Gucas',            '1 Groundcrawler Rd',  'Santa Barbara',    'CA', '94545', '9495551010', '777112222'),
('rs600', 'Robert', 'Stevens',          '65 Florida Ln',       'Los Angeles',      'CA', '92299', '9496667777', '000998888');

INSERT INTO PATIENT 
(patientID, phoneNum, dob, personID) VALUES
('p-ma100', '9493334444', '1971-03-03', 'ma100'),
('p-nb090', '9491114444', '1985-01-25', 'nb090'),
('p-ma204', '9491113333', '1988-07-08', 'ma204'),
('p-xx311', '9491119999', '1989-01-27', 'xx311'),
('p-as926', '9490009999', '1990-07-25', 'as926'),
('p-ss666', '1113334444', '1976-04-11', 'ss666');

INSERT INTO DOCTOR
(doctorID, medicalDegree, personID) VALUES
('AS9260', 'M.D.', 'as926'),
('SS6660', 'M.D.', 'ss666'),
('LG4860', 'M.D.', 'lg486'),
('RS6000', 'M.D.', 'rs600');
-- added robert as a doctor so we can find his patients (Q2) also added a patient under his care (PATIENT and PATIENTVISIT)

INSERT INTO SPECIALTY 
(specialtyID, specialtyName) VALUES
('DERM', 'Dermatology'), 
('ORTH', 'Orthopedics'),
('RADI', 'Radiology');

INSERT INTO DOCTORSPECIALTY 
(doctorID, specialtyID) VALUES
('AS9260', 'DERM'),
('SS6660', 'ORTH');

INSERT INTO PATIENTVISIT
(visitID, patientID, doctorID, visitDate, docNote) VALUES
('2020A1001', 'p-ma100', 'AS9260', '2020-01-09', 'Patient needs to stop scratching that'),
('2020A2001', 'p-nb090', 'LG4860', '2020-01-17', 'PLEASE stop swallowing Lego pieces'),
('2020A2013', 'p-ma204', 'SS6660', '2020-01-20', 'Scheduled this dude w/ radiology dept tomorrow, oh man they are gonna FREAK when they see this'),
('2020A2099', 'p-ma204', 'LG4860', '2020-01-21', 'How did he break THAT?'),
('2020A2112', 'p-xx311', 'SS6660', '2020-02-01', 'Mallets for limbs, huh?'),
('2020A2141', 'p-as926', 'LG4860', '2020-02-04', 'I told you not to bend it that way, but here we are.'),
('2020A2199', 'p-ss666', 'LG4860', '2020-02-05', 'Wooden mallets present inside forearm of patient. Am I working with imbeciles?'),
('2020A2203', 'p-ma100', 'RS6000', '2020-02-06', 'Never seen a D');

INSERT INTO PRESCRIPTION 
(prescriptionID, prescriptionName) VALUES
('72213', 'Snake Oil Plus'),
('72214', 'Raspirin'),
('81212', 'Sphincter Terminator'),
('81213', 'Raspirin'),
('81214', 'Vicodin'),
('90401', 'Hydronicotine'),
('90402', 'Raspirin'),
('91003', 'Raspirin'),
('92334', 'Raspirin'),
('92335', 'Hydroethanylvodkasium'),
('93030', 'Raspirin'),
('94420', 'Snake Oil Plus'), 
('94421', 'Raspirin');

INSERT INTO PVISITDESCRIPTION
(prescriptionID, visitID) VALUES
('72213', '2020A1001'),
('72214', '2020A1001'),
('81212', '2020A2001'),
('81213', '2020A2001'),
('81214', '2020A2001'),
('90401', '2020A2013'),
('90402', '2020A2013'),
('91003', '2020A2099'),
('92334', '2020A2112'),
('92335', '2020A2112'),
('93030', '2020A2141'),
('94420', '2020A2199'),
('94421', '2020A2199');

INSERT INTO `TEST`
(testID, testName) VALUES
('t4001', 'X-ray'),
('t4210', 'X-ray'),
('t4290', 'Blood type test');

INSERT INTO PVISITTEST
(visitID, testID) VALUES
('2020A2001', 't4001'),
('2020A2099', 't4210'),
('2020A2112', 't4290');



/* Doctor Robert Stevens is retiring. We need to inform all his patients, 
and ask them to select a new doctor. For this purpose, 
Create a VIEW that finds the names and Phone numbers of all of Robert's patients. */

-- could we make it so any doctorsID entered into textbox gives that doctors patients

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


/* Create trigger on the DoctorSpeciality so that every time a doctor specialty is updated or added, a new entry is made in the audit table. The audit table will have the following (Hint-The trigger will be on DoctorSpecialty table).
a. Doctor’s FirstName
b. Action(indicate update or added)
c. Specialty
d. Date of modification */
