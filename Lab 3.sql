USE tour;

CREATE VIEW NHTrips AS
SELECT tripID, tripName, StartLocation, Distance, MaxGrpSize, Type, Season
From trip WHERE State = 'NH';

CREATE View Hiking AS
SELECT tripID, tripName, StartLocation, State, MaxGrpSize, Season
from trip WHERE type  = "Hiking";

CREATE view ReservationCustomer AS
Select ReservationID, TripID, reservation.CustomerNum, LastName, FirstName, Phone
From reservation INNER Join customer ON reservation.CustomerNum = customer.CustomerNum;

CREATE INDEX TripIndex1 ON trip (TripName);
CREATE INDEX TripIndex2 ON trip (Type);
CREATE INDEX TripIndex3 ON trip (Type, Season DESC);

DROP INDEX TripIndex3 ON trip;

ALTER TABLE reservation ADD FOREIGN KEY (CustomerNum) REFERENCES Reservation;
ALTER TABLE reservation ADD FOREIGN KEY (TripID) REFERENCES Reservation;

ALTER TABLE customer ADD Waiver CHAR(1);

UPDATE customer SET Waiver = 'Y' WHERE LastName = 'Ocean';

-- DROP TABLE trip;