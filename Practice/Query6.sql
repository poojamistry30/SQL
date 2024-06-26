CREATE SCHEMA Self;

CREATE TABLE Self.Employee(EmpID INT, EmployeeName VARCHAR(100), ManagerID INT, Salary INT);

INSERT INTO Self.Employee VALUES
(1,'Sunil',NULL,500000),
(2,'Anil',1,40000),
(3,'Ram',1,600000),
(4,'Shyam',2,8000),
(5,'Shruti',4,300000);

SELECT * FROM Self.Employee;

--Q Write a query to display the Employees with their Manager
SELECT Emp.EmployeeName AS Employee, Mangr.EmployeeName AS Manager
FROM Self.Employee Emp LEFT JOIN Self.Employee Mangr
ON Emp.ManagerID=Mangr.EmpID;

--Q Write a query to display to find the employees whose salary is more than thier manager
SELECT Emp.EmployeeName AS Employee, Mangr.EmployeeName AS Manager
FROM Self.Employee Emp LEFT JOIN Self.Employee Mangr
ON Emp.ManagerID=Mangr.EmpID
WHERE Emp.Salary>Mangr.Salary;

-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Self.Product(ProductID INT, ProductName VARCHAR(100), CategoryID INT);

INSERT INTO Self.Product VALUES
(1,'TV',NULL),
(2,'Samsung 50 Inch',1),
(3,'Sony 55 Inch',1),
(4,'Iphone',NULL),
(5,'Iphone4 Pro',4),
(6,'Iphone14',4);

SELECT * FROM Self.Product;

--Q Write a query to display all product with their category

SELECT P.ProductName AS Product, C.ProductName AS Category
FROM Self.Product P LEFT JOIN Self.Product C
ON P.ProductID=C.CategoryID;