
--Exercice 7.2

SELECT Materiel.* FROM Materiel
LEFT JOIN Reservation ON Materiel.IdMateriel = Reservation.IdMateriel
WHERE Reservation.IdReservation IS NULL;
