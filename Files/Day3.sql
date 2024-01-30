CREATE TABLE Orders(OrderID INT, City VARCHAR(10), Sales INT);

INSERT INTO Orders VALUES
(1,'Mysore',100),
(2,'Mysore',200),
(3,'Banglore',150),
(4,'Banglore',150),
(5,'Mumbai',300),
(6,'Mumbai',500),
(7,'Mumbai',800);

CREATE TABLE Returns(OrderID INT, Return_Reason VARCHAR(20));

INSERT INTO Returns VALUES
(3,'wrong item'),
(6,'bad quality'),
(7,'wrong item');


SELECT * FROM Orders;
SELECT * FROM Returns

--Q Write a SQL to find cities where atleadt one order was returned

--Using Join
SELECT Orders.*, Returns.*
FROM Orders LEFT JOIN Returns
ON Orders.OrderID=Returns.OrderID
WHERE Returns.OrderID IS NOT NULL;

--Using Subquery
SELECT * FROM Orders WHERE OrderID IN (SELECT OrderID FROM Returns);

--Q Write a SQL to find cities where none of order returned

--Using Join
SELECT Orders.*
FROM Orders LEFT JOIN Returns
ON Orders.OrderID=Returns.OrderID
WHERE Returns.OrderID IS NULL;

--Using Subquery
SELECT * FROM Orders WHERE OrderID NOT IN (SELECT OrderID FROM Returns);

--Q Write a SQL to find cities where not even a single order was returned

--Using Join
SELECT O.City AS City, COUNT(R.OrderID) AS 'No of Returns'
FROM Orders O LEFT JOIN Returns R
ON O.OrderID=R.OrderID
GROUP BY O.City
HAVING COUNT(R.OrderID)=0;
;

--Using Subquery
SELECT DISTINCT City FROM Orders WHERE City NOT IN 
(SELECT DISTINCT City FROM Orders 
WHERE OrderID IN (SELECT OrderID FROM Returns));
