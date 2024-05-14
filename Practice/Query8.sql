CREATE SCHEMA Crossj

CREATE TABLE Crossj.Students(StudentID INT, StudentName VARCHAR(100));

INSERT INTO Crossj.Students VALUES
(1,'Saurabh'),
(2,'Anil'),
(3,'Ram'),
(4,'Shyam');

CREATE TABLE Crossj.Subjects(SubjectID INT, SubjectName VARCHAR(100));

INSERT INTO Crossj.Subjects VALUES
(1,'Math'),
(2,'Chemistry'),
(3,'Physics');

SELECT * FROM Crossj.Students;

SELECT * FROM Crossj.Subjects;

--Cross Join
SELECT Students.StudentName, Subjects.SubjectName, 10 Marks 
FROM Crossj.Students CROSS JOIN Crossj.SubjectS 
ORDER BY Students.StudentName;

------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Crossj.Doctors(DoctorID INT, DoctorName VARCHAR(100));

INSERT INTO Crossj.Doctors VALUES
(1,'Sourabh'),
(2,'Ram'),
(3,'Anil'),
(4,'Pragya');

INSERT INTO Crossj.Doctors VALUES(5,'Pragya');

SELECT * FROM Crossj.Doctors;

--Cross Join
SELECT * 
FROM Crossj.Doctors C CROSS JOIN Crossj.Doctors D
WHERE C.DoctorID<>D.DoctorID;