CREATE TABLE Department(DepartmentID INT, Department VARCHAR(100));

INSERT INTO Department VALUES
(1,'Retail'),
(2,'Finance'),
(3,'HR');
CREATE TABLE Employee(EmployeeID INT, DepartmentID INT, Employee VARCHAR(100));

INSERT INTO Employee VALUES
(1,1,'Sunil'),
(2,2,'Anil'),
(3,2,'Ram'),
(4,NULL,'Shruti');

SELECT * FROM Department;
SELECT * FROM Employee;

--Q Write a query to display all Employee along with department

--Right Join
SELECT Employee.Employee AS Employee, Department.Department AS Department
FROM Department RIGHT JOIN Employee
ON Department.DepartmentID=Employee.DepartmentID;

--Left Join
SELECT Employee.Employee AS Employee, Department.Department AS Department
FROM Employee LEFT JOIN Department
ON Department.DepartmentID=Employee.DepartmentID;