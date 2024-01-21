CREATE TABLE Emp2022(EmpID INT, Designation VARCHAR(100));

INSERT INTO Emp2022 VALUES
(1,'Trainee'),
(2,'Developer'),
(3,'Sr. Developer'),
(4,'Manager');

CREATE TABLE Emp2023(EmpID INT, Designation VARCHAR(100));

INSERT INTO Emp2023 VALUES
(1,'Developer'),
(2,'Developer'),
(3,'Manager'),
(5,'Trainee');

SELECT * FROM Emp2022;
SELECT * FROM Emp2023;

SELECT COALESCE (Emp2022.EmpID, Emp2023.EmpID) AS EmpID,
CASE WHEN Emp2022.EmpID=Emp2023.EmpID AND Emp2022.Designation=Emp2022.Designation THEN 'Not Promoted'
	 WHEN Emp2022.EmpID=Emp2023.EmpID AND Emp2022.Designation<>Emp2022.Designation THEN 'Promoted'
	 WHEN Emp2022.EmpID IS NULL AND Emp2023.EmpID IS NOT NULL THEN 'New Joinee'
	 WHEN Emp2022.EmpID IS NOT NULL AND Emp2023.EmpID IS NULL THEN 'Resigned'
END 'Employment Status'
FROM Emp2022 FULL OUTER JOIN Emp2023
ON Emp2022.EmpID=Emp2023.EmpID;