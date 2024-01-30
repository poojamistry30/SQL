-----------------------------------------------------RECURSIVIECTE EXAMPLE-------------------------------------------------------------------------

-- Write a query to generate sequence of number from 10 to 90

WITH RecursiveCTESeqNo AS
(
	SELECT 10 AS NUMBER
	UNION ALL
	SELECT NUMBER + 1 FROM RecursiveCTESeqNo
	WHERE NUMBER<90
)
SELECT * FROM RecursiveCTESeqNo;


-- Write a query to generate sequence of number from 10 to 500

WITH RecursiveCTESeqNo_  AS
(
	SELECT 10 AS NUMBER
	UNION ALL
	SELECT NUMBER+1 FROM RecursiveCTESeqNo_
	WHERE NUMBER<500
)
SELECT * FROM RecursiveCTESeqNo_ OPTION (MAXRECURSION 500);


-- Write a query to generate dates betweem 2024-01-01 to till date

DECLARE @STARTDATE DATE='2024-01-01';
DECLARE @ENDDATE DATE=GETDATE();

WITH RecursiveCTEDate AS
(
	SELECT @STARTDATE AS Date
	UNION ALL
	SELECT  DATEADD(D,1,Date) FROM RecursiveCTEDate
	WHERE Date<@ENDDATE
)
SELECT * FROM RecursiveCTEDate OPTION (MAXRECURSION 0);


-- write a query to generate alphabet between A to Z

WITH RecursiveCTEAlphabet AS
(
	SELECT CHAR(65) AS Alphabet
	UNION ALL
	SELECT CHAR(ASCII(Alphabet)+1) FROM RecursiveCTEAlphabet
	WHERE Alphabet<'Z'
)
SELECT * FROM RecursiveCTEAlphabet;

-- Write a query  to Split "Sourabh"

DECLARE @NAME VARCHAR(MAX) = 'SOURABH';
WITH RecursiveCTEName AS
(
	SELECT 1 AS Cnt
	UNION ALL
	SELECT Cnt+1 FROM RecursiveCTEName
	WHERE Cnt<LEN(@NAME)
)
SELECT SUBSTRING(@NAME,Cnt,1) FROM RecursiveCTEName;
--SELECT * FROM RecursiveCTEName;


-- Considers Following Table and Find out daily number of patient for the month of April 2024
CREATE TABLE Patient(PatientID INT, PatientName VARCHAR(50), OPDDate DATE);

INSERT INTO Patient VALUES
(100,'Rahul','2024-01-03'),
(102,'Sanjay','2024-01-05'),
(103,'Preeti','2024-01-07'),
(104,'Ram','2024-01-10'),
(105,'Aakash','2024-01-11'),
(106,'Sohan','2024-01-12'),
(107,'Priya','2024-01-15'),
(108,'Poonam','2024-01-17');

SELECT * FROM Patient;

DECLARE @STARTDATE DATE='2024-01-01';
DECLARE @ENDDATE DATE='2024-01-20';

WITH RecursiveCTEPatient AS
(
	SELECT @STARTDATE AS Date
	UNION ALL
	SELECT DATEADD(D,1,Date) Date FROM RecursiveCTEPatient
	WHERE Date<@ENDDATE
)
SELECT RecursiveCTEPatient.Date, Patient.OPDDate
FROM RecursiveCTEPatient LEFT JOIN Patient
ON RecursiveCTEPatient.Date=Patient.OPDDate;

--Find out employee at the top level and third level

CREATE TABLE EmployeeLevel (EmpID INT, EmployeeName VARCHAR(50), ManagerID INT)

INSERT INTO EmployeeLevel VALUES
(25,'Sourabh',NULL),
(26,'Nazee',NULL),
(27,'Hritik',25),
(28,'Aamir',27),
(29,'Shahid',28),
(30,'Siddhant',NULL),
(31,'Varun',30),
(32,'Kabeer',30),
(33,'Raj',29);



