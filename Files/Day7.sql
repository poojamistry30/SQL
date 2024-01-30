CREATE TABLE Airport(AirportID INT, AirportName VARCHAR(100));

INSERT INTO Airport VALUES
(1,'Delhi'),
(2,'Mumbai'),
(3,'Neywork'),
(4,'Paris');

CREATE TABLE Flights(FlightsID INT, FlightNo CHAR(10), OriginID INT, DestinationID INT);

INSERT INTO Flights VALUES
(1,'A302',1,4),
(2,'B13',2,4),
(3,'B15',4,1);

SELECT * FROM Airport;
SELECT * FROm Flights;

--Q Write a query to display all the details of flights that are available in the flights table

SELECT Flights.FlightNo AS 'Flight No', OriginAirport.AirportName AS Origin, DestinationAirport.AirportName AS Destination
FROM Flights INNER JOIN Airport OriginAirport
ON Flights.OriginID=OriginAirport.AirportID
INNER JOIN Airport DestinationAirport
ON Flights.DestinationID=DestinationAirport.AirportID;

