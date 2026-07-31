CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50),
    Phone VARCHAR(15)
);

CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY,
    Doctor_Name VARCHAR(100),
    Department VARCHAR(50),
    Experience INT,
    Salary DECIMAL(10,2)
);

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);

CREATE TABLE Billing (
    Bill_ID INT PRIMARY KEY,
    Patient_ID INT,
    Amount DECIMAL(10,2),
    Payment_Mode VARCHAR(20),
    Payment_Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Patients VALUES
(101,'Rahul',25,'Male','Hyderabad','9876543210'),
(102,'Sneha',30,'Female','Bangalore','9876543211'),
(103,'Kiran',27,'Male','Chennai','9876543212'),
(104,'Priya',22,'Female','Pune','9876543213'),
(105,'Arjun',35,'Male','Delhi','9876543214'),
(106,'Meena',28,'Female','Mumbai','9876543215'),
(107,'Rohit',31,'Male','Hyderabad','9876543216'),
(108,'Divya',24,'Female','Vizag','9876543217'),
(109,'Ajay',29,'Male','Kolkata','9876543218'),
(110,'Anita',33,'Female','Jaipur','9876543219');


SELECT * FROM Patients;

INSERT INTO Doctors VALUES
(1,'Dr. Sharma','Cardiology',12,150000),
(2,'Dr. Rao','Orthopedics',10,120000),
(3,'Dr. Reddy','Neurology',15,180000),
(4,'Dr. Khan','General Medicine',8,100000),
(5,'Dr. Thomas','Dermatology',9,110000);

SELECT * FROM Doctors;

INSERT INTO Appointments VALUES
(1001,101,1,'2026-07-01','Completed'),
(1002,102,2,'2026-07-02','Completed'),
(1003,103,3,'2026-07-03','Cancelled'),
(1004,104,4,'2026-07-04','Completed'),
(1005,105,5,'2026-07-05','Pending'),
(1006,106,1,'2026-07-06','Completed'),
(1007,107,2,'2026-07-07','Completed'),
(1008,108,3,'2026-07-08','Pending'),
(1009,109,4,'2026-07-09','Completed'),
(1010,110,5,'2026-07-10','Completed');

SELECT * FROM Appointments;

INSERT INTO Billing VALUES
(1,101,5000,'UPI','Paid'),
(2,102,12000,'Card','Paid'),
(3,103,8000,'Cash','Pending'),
(4,104,4500,'UPI','Paid'),
(5,105,15000,'Card','Pending'),
(6,106,9000,'Cash','Paid'),
(7,107,3000,'UPI','Paid'),
(8,108,7000,'Card','Pending'),
(9,109,6000,'Cash','Paid'),
(10,110,10000,'UPI','Paid');

SELECT * FROM Billing;
SELECT * FROM Patients;
SELECT Patient_Name, City
FROM Patients;
SELECT *
FROM Patients
WHERE Age > 28;

SELECT *
FROM Billing
WHERE Payment_Status = 'Paid';
SELECT *
FROM Doctors
ORDER BY Salary DESC;
SELECT COUNT(*) AS Total_Patients
FROM Patients;

SELECT AVG(Amount) AS Average_Bill
FROM Billing;

SELECT MAX(Salary) AS Highest_Salary
FROM Doctors;

SELECT MIN(Age) AS Youngest_Patient
FROM Patients;

SELECT SUM(Amount) AS Total_Revenue
FROM Billing;

SELECT City, COUNT(*) AS Total_Patients
FROM Patients
GROUP BY City;

SELECT Department, AVG(Salary) AS Average_Salary
FROM Doctors
GROUP BY Department;

SELECT
    Patients.Patient_Name,
    Doctors.Doctor_Name,
    Doctors.Department,
    Appointments.Appointment_Date,
    Appointments.Status
FROM Appointments
INNER JOIN Patients
ON Appointments.Patient_ID = Patients.Patient_ID
INNER JOIN Doctors
ON Appointments.Doctor_ID = Doctors.Doctor_ID;

SELECT
    Patients.Patient_Name,
    Billing.Amount,
    Billing.Payment_Mode,
    Billing.Payment_Status
FROM Billing
INNER JOIN Patients
ON Billing.Patient_ID = Patients.Patient_ID;

SELECT
    Doctors.Doctor_Name,
    COUNT(Appointments.Appointment_ID) AS Total_Appointments
FROM Doctors
INNER JOIN Appointments
ON Doctors.Doctor_ID = Appointments.Doctor_ID
GROUP BY Doctors.Doctor_Name;

SELECT *
FROM Doctors
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Doctors
);

SELECT *
FROM Billing
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Billing
);

CREATE VIEW PaidBills AS
SELECT *
FROM Billing
WHERE Payment_Status = 'Paid';

SELECT * FROM PaidBills;

UPDATE Billing
SET Payment_Status = 'Paid'
WHERE Bill_ID = 5;

SELECT * FROM Billing;

DELETE FROM Appointments
WHERE Appointment_ID = 1003;

SELECT * FROM Appointments;