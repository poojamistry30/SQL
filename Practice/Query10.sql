--Consider the following table

CREATE TABLE Employees(Emp_ID INT PRIMARY KEY, 
Emp_Name VARCHAR(50));

INSERT INTO Employees VALUES
(1,'Sourabh'),
(2,'Ram'),
(3,'Rohan'),
(4,'Mohan');

SELECT * FROM Employees;

CREATE TABLE Projects(Project_ID INT PRIMARY KEY,
Project_Name VARCHAR(50),
Emp_ID INT,
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID));

INSERT INTO Projects VALUES
(1,'Banking',1),
(2,'Govt Schemes',2),
(3,'Oil and Gas ERP',1),
(4,'Mine Project',3);

SELECT * FROM Projects;

--Q Write a SQL query to find the names of employees who have not been assigned to any project.

SELECT Employees.Emp_Name, Projects.Project_Name
FROM Employees LEFT JOIN Projects
ON Employees.Emp_ID = Projects.Emp_ID
WHERE Projects.Project_ID IS NULL;