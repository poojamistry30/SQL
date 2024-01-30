CREATE TABLE WindowsFunction.TCS_Stock_Price(Date VARCHAR(100), Price INT);

INSERT INTO WindowsFunction.TCS_Stock_Price VALUES
('17-04-2023',3300),
('18-04-2023',3500),
('19-04-2023',3200),
('20-04-2023',3600);

SELECT *,
	ISNULL(LAG(Price) OVER(ORDER BY Date ASC),0) AS 'Previous_Day_Price'
	FROM WindowsFunction.TCS_Stock_Price


SELECT TT.Date, TT.Price,
((TT.Price - (TT.Previous_Day_Price))*100/ISNULL(TT.Previous_Day_Price,1)) AS 'Percent_Change'
FROM(
	SELECT *,
	LAG(Price) OVER(ORDER BY Date ASC) AS 'Previous_Day_Price'
	FROM WindowsFunction.TCS_Stock_Price
)TT;


SELECT *,
	ISNULL(LEAD(Price) OVER(ORDER BY Date ASC),0) AS 'Next_Day_Price'
	FROM WindowsFunction.TCS_Stock_Price;


CREATE TABLE WindowsFunction.EmployeeSalary(EmpID INT, Salary INT, Year INT);

INSERT INTO WindowsFunction.EmployeeSalary VALUES
(1,80000,2020),
(1,70000,2019),
(1,60000,2018),
(2,65000,2020),
(2,65000,2019),
(2,60000,2018),
(3,65000,2019),
(3,60000,2018);

SELECT * FROM WindowsFunction.EmployeeSalary;


SELECT TT.EmpID FROM
(
	SELECT *,
	LEAD(Salary) OVER(PARTITION BY EmpID ORDER BY Year DESC) AS 'Previous_Year_Salary'
	FROM WindowsFunction.EmployeeSalary
)TT
WHERE TT.Salary>TT.Previous_Year_Salary
GROUP BY TT.EmpID
HAVING COUNT(1)=2;





-- find out employees who have got consistent raise in 3 years
