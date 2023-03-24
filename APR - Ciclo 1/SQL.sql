/*
Course: Software Engineering - UniEVANGÉLICA
Subject: Database Management Systems
Developer: Douglas Leonel de Almeida - 2110213
Date: 24/03/2023
*/

/* ARP - DBMS */
CREATE DATABASE medical_clinic;

USE medical_clinic;

CREATE TABLE office (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    location VARCHAR(150)
);

CREATE TABLE professional (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    specialty_id INTEGER,
    office_id INTEGER,
    name VARCHAR(100),
    crm VARCHAR(13)
);

CREATE TABLE patient (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    birth_date DATE,
    insurance_number VARCHAR(15)
);

CREATE TABLE appointment (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    professional_id INTEGER NOT NULL,
    patient_id INTEGER NOT NULL,
    schedule DATETIME
);

CREATE TABLE specialty (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(80),
    description VARCHAR(200)
);

/* Constraints */
ALTER TABLE
    professional
ADD
    CONSTRAINT FK_professional_1 FOREIGN KEY (specialty_id) REFERENCES specialty (id);

ALTER TABLE
    professional
ADD
    CONSTRAINT FK_professional_2 FOREIGN KEY (office_id) REFERENCES office (id);

ALTER TABLE
    appointment
ADD
    CONSTRAINT FK_appointment_3 FOREIGN KEY (professional_id) REFERENCES professional (id);

ALTER TABLE
    appointment
ADD
    CONSTRAINT FK_appointment_4 FOREIGN KEY (patient_id) REFERENCES patient (id);

/* Selects */
SELECT -- List all available offices in the clinic
    *
FROM
    office;

SELECT -- List all professionals in the clinic and their respective specialties
    p.name,
    p.crm,
    s.name AS specialty,
    o.name AS office
FROM
    professional p
    INNER JOIN specialty s ON s.id=p.specialty_id
    INNER JOIN office o ON p.office_id=o.id;

SELECT -- List all patients in the clinic and their respective birth dates
    *
FROM
    patient;

SELECT -- List all appointments scheduled for a specific day
    *
FROM
    appointment
WHERE 
    appointment.schedule="2023/03/24 01:39";

SELECT -- List all appointments scheduled for a specific professional
    *
FROM
    appointment
WHERE 
    appointment.professional_id=1;

SELECT -- List all appointments scheduled for a specific patient
    *
FROM
    appointment
WHERE 
    appointment.patient_id=1;

SELECT -- Query most recent appointment
    MAX(schedule) AS "MostRecentAppointment"
FROM
    appointment;

SELECT -- Query oldest appointment
    MIN(schedule) AS "OldestAppointment"
FROM
    appointment;

/* Inserts */
INSERT INTO -- Insert a new specialty
    specialty(name, description)
VALUES 
    ("Cardiology", "Lorem Ipsum");

INSERT INTO -- Insert a new office
    office(name, location)
VALUES 
    ("Office 1", "Room 1");

INSERT INTO -- Insert a new professional
    professional(specialty_id, office_id, name, crm)
VALUES 
    ("1", "1", "Doctor 1", "CRM/GO123456");

INSERT INTO -- Insert a new patient
    patient(name, birth_date, insurance_number)
VALUES 
    ("Patient 1", "2001/06/25", "1234567890");

INSERT INTO -- Insert a new appointment (depends on the inserts above)
    appointment(professional_id, patient_id, schedule)
VALUES 
    ("1", "1", "2023/03/24 01:39");

/* Updates */
UPDATE -- Update the data of an existing appointment
    appointment
SET
    schedule = "2023/03/30 01:39"
WHERE
    id = 2;

/* Deletes */
DELETE FROM -- Delete an appointment
    appointment
WHERE
    id = 2;
