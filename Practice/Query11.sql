 -- Consider following Table
 
 CREATE TABLE Students(ID INT, Name VARCHAR(50));

 INSERT INTO Students VALUES
 (1,'Akshay'),
 (2,'Rahul'),
 (3,'Neha'),
 (4,'Priya');

 SELECT * FROM Students;

 CREATE TABLE Friends(ID INT, Friend_ID INT);

 INSERT INTO Friends VALUES
 (1,2),
 (2,3),
 (3,4),
 (4,1);

  SELECT * FROM Friends;

 CREATE TABLE Packages(ID INT, Salary VARCHAR(50));

 INSERT INTO Packages VALUES
 (1,'15.20'),
 (2,'10.06'),
 (3,'11.55'),
 (4,'12.12');

  SELECT * FROM Packages;

 --Q Write a query to output the names of those students whose best friends got offered a higher salary than them.
 -- Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two  students got same salary offer.

  SELECT * FROM Students;
  SELECT * FROM Friends;
  SELECT * FROM Packages;

 SELECT S.ID 'Student_ID', S.Name 'Student_Name', F.Friend_ID 'Friend_ID', SF.Name 'Friend_Name', SP.Salary 'Student_Salary', FP.Salary 'Friend_Salary'
 FROM Students S INNER JOIN Friends F
 ON S.ID = F.ID
 INNER JOIN Students SF
 ON f.Friend_ID = SF.ID
 INNER JOIN Packages SP
 ON S.ID = SP.ID
 INNER JOIN Packages FP
 ON SF.ID = FP.ID
 WHERE FP.Salary > SP.Salary
 ORDER BY FP.Salary;