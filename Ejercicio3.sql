--DDL
USE master;

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Empresa')
DROP DATABASE Empresa;

CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE Employee(
empId INT NOT NULL IDENTITY(1,1),
name varchar(250) NOT NULL,
supervisor INT,
salary INT NOT NULL,
PRIMARY KEY(empId)
);
CREATE TABLE Bonus(
empID INT NOT NULL,
bonus INT,
FOREIGN KEY(empID) REFERENCES Employee(empId)
);
INSERT INTO Employee
([name], [supervisor], [salary])
VALUES
('Jhon', 3, 1000),
('Dan', 3, 2000),
('Brad', NULL, 4000),
('Thomas', 3, 4000),
('Luke', 2, 700),
('Mark', 4, 800),
('Bill', 1, 1500),
('Donald', 4, 1200),
('Mathew', 2, 1800),
('Paul', 1, 3000),
('Zecharia', 2, 2500),
('Bernabe', 4, 2800),
('Jacob', 4, 900),
('Abraham', 3, 1500),
('Ruben', NULL, 1900),
('Judah', 2, 2200),
('Gedeon', NULL, 3300),
('Peter', 3, 4200),
('Judas', NULL, 4100),
('Alexander', 1, 5000);
INSERT INTO Bonus
([empID] ,[Bonus])
VALUES
(1, 500),
(2, 1000),
(3, 2000),
(4, 2000),
(5, 350),
(6, 400),
(7, 750),
(8, 600),
(9, 900),
(10, 1500),
(11, 1250),
(12, 1400),
(13, 450),
(14, 750),
(15, 950),
(16, 1100),
(17, 1650),
(18, 2100),
(19, 2050),
(20, 2500);

SELECT e.name, b.bonus
FROM Bonus b, Employee e
WHERE b.bonus<1000  AND e.empId=b.empID;