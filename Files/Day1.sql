
CREATE DATABASE SQLChallenges;

USE SQLChallenges;

--Q. What will be the output of following SQL query
-- select count(*) as rows_count from A left/right/inner/outer join B on A.id = B.id

CREATE TABLE A (
Id INT);

INSERT INTO A 
VALUES(1),(1),(1),(2),(2),(NULL),(3),(4),(NULL),(NULL);

CREATE TABLE B (
Id INT);

INSERT INTO B 
VALUES(1),(1),(2),(2),(2),(3),(3),(NULL),(4),(NULL),(NULL),(5),(5);

SELECT * FROM A;
SELECT * FROM B;

--Left Join
SELECT COUNT(*) AS Row_Count
FROM A LEFT JOIN B
ON A.ID=B.ID;

SELECT * FROM A LEFT JOIN B
ON A.ID=B.ID;

--Right Join
SELECT COUNT(*) AS Row_Count
FROM A RIGHT JOIN B
ON A.ID=B.ID;

SELECT * FROM A RIGHT JOIN B
ON A.ID=B.ID;

--Inner Join
SELECT COUNT(*) AS Row_Count
FROM A INNER JOIN B
ON A.ID=B.ID;

SELECT * FROM A INNER JOIN B
ON A.ID=B.ID;

--Outer Join
SELECT COUNT (*) AS Row_Count
FROM A  FULL OUTER JOIN B
ON A.ID=B.ID;

SELECT * FROM A FULL OUTER JOIN B
ON A.ID=B.ID;