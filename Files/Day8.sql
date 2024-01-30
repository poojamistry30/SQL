CREATE TABLE Students(StudentID INT, StudentName VARCHAR(100));

INSERT INTO Students VALUES
(1,'Saurabh'),
(2,'Anil'),
(3,'Ram'),
(4,'Shyam');

CREATE TABLE Subjects(SubjectID INT, SubjectName VARCHAR(100));

INSERT INTO Subjects VALUES
(1,'Math'),
(2,'Chemistry'),
(3,'Physics');

SELECT * FROM Students;

SELECT * FROM Subjects;

--Cross Join
SELECT Students.StudentName, Subjects.SubjectName, 10 Marks 
FROM Students CROSS JOIN SubjectS 
ORDER BY Students.StudentName;

------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Doctors(DoctorID INT, DoctorName VARCHAR(100));

INSERT INTO Doctors VALUES
(1,'Sourabh'),
(2,'Ram'),
(3,'Anil'),
(4,'Pragya');
INSERT INTO Doctors VALUES(5,'Pragya');

SELECT * FROM Doctors;

--Cross Join
SELECT * FROM Doctors C CROSS JOIN Doctors D
WHERE C.DoctorID<>D.DoctorID;