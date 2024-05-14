--Consider the following table

CREATE TABLE Employee
(Emp_ID INT PRIMARY KEY IDENTITY(101,1),
Emp_Name VARCHAR(100),
Emp_No CHAR(10));

INSERT INTO Employee VALUES
('Sourabh Sahu','9856789876'),
('Deepak Goyal','8767896789'),
('Vivek Oberoi','9856789878'),
('Shantanu Khandelwal','9867569867'),
('Khanak Desai','9856789867');

SELECT * FROM Employee;

CREATE TABLE Employee_Details
(Emp_ID INT,
Emp_Profile VARCHAR(100),
Emp_Country VARCHAR(100),
Emp_Join_Date DATE, 
Manager_ID INT);


INSERT INTO Employee_Details VALUES
(101,'Content Writer','Germany','2021-04-20',103),
(104,'Data Analyst','India','2022-12-11',101),
(105,'Software Engineer','India','2022-01-03',NULL),
(108,'Development Executive','Europe','2023-02-15',105),
(109,'Marketing Manager','Mexico','2020-05-23',105),
(110,'Content Writer','India','2023-01-01',NULL),
(NULL,NULL,NULL,NULL,101);

SELECT * FROM Employee_Details;


--Q Find out all Employee joined in year 2022
SELECT E.Emp_Name, ED.Emp_Join_Date
FROM Employee E LEFT JOIN Employee_Details ED
ON E.Emp_ID = ED.Emp_ID
WHERE YEAR(ED.Emp_Join_Date) = 2022;

--Q Find out all Employees who are manager also

SELECT ED.Manager_ID, E.Emp_Name AS Manager
FROM 
Employee E INNER JOIN Employee_Details ED 
ON E.Emp_ID = ED.Manager_ID;

--Q Perform INNER JOIN, LEFT JOIN FIGHT JOIN, FULL OUTER JOIN, CROSS JOIN and compare result

--INNER JOIN
SELECT * 
FROM Employee E INNER JOIN Employee_Details ED
ON E.Emp_ID = ED.Emp_ID;

--LEFT JOIN
SELECT *
FROM Employee E LEFT JOIN Employee_Details ED
ON E.Emp_ID = ED.Emp_ID;

--RIGHT JOIN
SELECT *
FROM Employee E RIGHT JOIN Employee_Details ED
ON E.Emp_ID = ED.Emp_ID;

--FULL OUTER JOIN
SELECT *
FROM Employee E FULL OUTER JOIN Employee_Details ED
ON E.Emp_ID = ED.Emp_ID;

--CROSS JOIN
SELECT *
FROM Employee E CROSS JOIN Employee_Details ED;

--Q Find out youngest Content Writer
SELECT TOP 1 *, DATEDIFF(YEAR,Emp_Join_Date,GETDATE()) AS 'Employee Tenure'
FROM Employee_Details
WHERE Emp_Profile = 'Content Writer'
ORDER BY [Employee Tenure] desc;
