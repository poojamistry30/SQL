CREATE SCHEMA WindowsFunction;

CREATE TABLE WindowsFunction.Employee(EmpID INT, EmpName VARCHAR(100), DeptName VARCHAR(50), Salary INT);

INSERT INTO WindowsFunction.Employee VALUES
(101,'Mohan','Admin',4000),
(102,'Rajkumar','HR',3000),
(103,'Akbar','IT',4000),
(104,'Dorvin','Finance',6500),
(105,'Rohit','HR',3000),
(106,'Rajesh','Finance',5000),
(107,'Preeti','HR',7000),
(108,'Maryam','Admin',4000),
(109,'Sanjay','IT',6500),
(110,'Vasudha','IT',7000),
(111,'Melindo','IT',8000),
(112,'Komal','IT',10000),
(113,'Gautham','Admin',2000),
(114,'Manisha','HR',3000),
(115,'Chandni','IT',4500),
(116,'Satya','Finance',6500),
(117,'Adarsh','HR',3500),
(118,'Tejaswi','Finance',5500),
(119,'Cory','HR',8000),
(120,'Monica','Admin',5000),
(121,'Rosalin','IT',6000),
(122,'Ibrahim','IT',8000),
(123,'Vikram','IT',8000),
(124,'Dheeraj','IT',1100);

SELECT * FROM WindowsFunction.Employee;

-- Average Salary of all department
SELECT EmpID, EmpName, DeptName, AVG(Salary)
OVER() AS 'Average Salary'
FROM WindowsFunction.Employee;

-- Average Salary of each department
SELECT EmpID, EmpName, DeptName, AVG(Salary)
Over(PARTITION BY DeptName ORDER BY DeptName) AS 'Average Salary'
FROM WindowsFunction.Employee;


CREATE TABLE WindowsFunction.Sales(Product VARCHAR(100), Sales INT, Year INT);

INSERT INTO WindowsFunction.Sales VALUES
('TV',2000,2018),
('IPhone',5000,2019),
('Refrigerator',10000,2018),
('Headphone',500,2019);

SELECT * FROM WindowsFunction.Sales;

SELECT DISTINCT Year, SUM(Sales) 
OVER(PARTITION BY Year) AS 'Total Sales'
FROM WindowsFunction.Sales;

--------------------------------------------------------------Row Number Windows Fuction------------------------------------------------------------------

--Generate Sequence of Salary in Descending order for all Department
SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS 'Sequence'
FROM WindowsFunction.Employee

-- Find out third highest salary of employee
SELECT * FROM (
	SELECT *,
	ROW_NUMBER() OVER(ORDER BY Salary DESC) AS 'Rank'
	FROM WindowsFunction.Employee) TT
WHERE TT.Rank = 3;


--Generate Sequence of Salary in Descending order in department wise
SELECT *,
ROW_NUMBER() OVER(PARTITION BY DeptName ORDER BY Salary DESC) AS 'Rank'
FROM WindowsFunction.Employee;

-- Find out third highest salary of employee in each department
SELECT * FROM (
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY DeptName ORDER BY Salary DESC) AS 'RowNumber'
	FROM WindowsFunction.Employee) TT
WHERE TT.RowNumber = 3;

-- Findout first three joinees in each department
SELECT * FROM (
	SELECT *,
	ROW_NUMBER() OVER(PARTITION BY DeptName ORDER BY EmpID ASC) AS 'JoiningOrder'
	FROM WindowsFunction.Employee) TT
WHERE TT.JoiningOrder<=3; 

-----------------------------------------------------------Rank Windows Function-----------------------------------------

SELECT *,
RANK() OVER(ORDER BY Salary DESC) AS 'Rank by Salary'
FROM WindowsFunction.Employee;

-- findout 2nd highest salary of each department
SELECT * FROM (
	SELECT *,
	RANK() OVER(ORDER BY Salary DESC) AS 'Rank by Salary'
	FROM WindowsFunction.Employee) TT
WHERE TT.[Rank by Salary] = 2;



CREATE TABLE WindowsFunction.Country(CountryID INT, Country VARCHAR(100));

INSERT INTO WindowsFunction.Country VALUES
(1,'India'),
(2,'US'),
(3,'Australia'),
(4,'Pakistan');

CREATE TABLE WindowsFunction.CountrySales(SalesID INT,CountryID INT, Sales INT);

INSERT INTO WindowsFunction.CountrySales VALUES
(1,1,5000),
(2,1,10000),
(3,2,1000),
(4,3,8000),
(5,3,2000),
(6,2,1000);

SELECT * FROM WindowsFunction.Country;

SELECT * FROM WindowsFunction.CountrySales;

--Rank countries on the basis of sales
SELECT TT.Country,
RANK() OVER(ORDER BY TT.[Total Sales] DESC) AS 'Sales'
FROM (
	SELECT CT.Country, SUM(ST.Sales) AS 'Total Sales'
	FROM WindowsFunction.Country CT INNER JOIN WindowsFunction.CountrySales ST
	ON CT.CountryID=ST.CountryID
	GROUP BY CT.Country
)TT

---------------------------------------------------------Desnse Rank--------------------------------------------------------------------------

SELECT *,
DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'Rank'
FROM WindowsFunction.Employee;


SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS 'Row Number',
RANK() OVER(ORDER BY Salary DESC) AS 'Rank',
DENSE_RANK() OVER(ORDER BY Salary DESC) AS 'Dense Rank'
FROM WindowsFunction.Employee;