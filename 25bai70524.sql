/*Create a Hospital Staff Management System using Department and Staff tables.
1. Create both tables with suitable attributes and establish a Primary Key and Foreign Key relationship. done
2. Apply appropriate NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
3. Insert at least 4 department records and 6 staff records.
4. Display staff members whose salaries fall between ₹25,000 and ₹50,000.
5. Display staff members whose names start with a specified letter using LIKE.
6. Display staff members belonging to selected departments using IN.
7. Display unique staff designations using DISTINCT.
8. Count the number of staff members in each department using GROUP BY and COUNT().
9. Display the maximum and minimum salary using MAX() and MIN().
10. Update the salary of a staff member.
11. Display the final staff records using SELECT with appropriate column aliases.*/

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Designation VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) CHECK (Salary >= 0),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department VALUES
(1,'CaRDIdiology', 'Block D1'),
(2,'neurology', 'Block D2'),
(3,'orthopedics', 'Block D3'),
(4,'Emergency','Block D1');

INSERT INTO Staff VALUES
(101,'Anmol','anmol@25BAI70524.com', 'Doctor', 45000, 1),
(102, 'chaitanya', 'chaitanya@hospital.com','Nurse', 30000,2),
(103,'pawan','pwn@hospital.com', 'Surgeon', 60000, 3),
(104, 'cp','cp@hospital.com','Nurse', 28000,4),
(105,'Arjun','arjun@hospital.com', 'Technician',25000, 1);

SELECT * FROM Staff
WHERE Salary BETWEEN 25000 AND 50000;

SELECT * FROM Staff
WHERE StaffName LIKE 'A%';

SELECT * FROM Staff
WHERE DepartmentID IN (1, 2);

SELECT DISTINCT Designation
FROM Staff;

SELECT DepartmentID, COUNT(*)
FROM Staff
GROUP BY DepartmentID;

SELECT MAX(Salary) AS MaximumSalary, MIN(Salary) AS MinimumSalary
FROM Staff;

UPDATE Staff
SET Salary = 48000
WHERE StaffID = 101;

SELECT
    S.StaffID AS EmployeeID,
    S.StaffName AS EmployeeName,
    S.Designation AS JobTitle,
    S.Salary AS MonthlySalary,
    D.DepartmentName AS Department
FROM Staff S
JOIN Department D
ON S.DepartmentID = D.DepartmentID;