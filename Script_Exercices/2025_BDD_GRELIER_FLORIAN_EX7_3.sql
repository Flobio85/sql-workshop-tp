
--Exercice 7.3

SELECT Materiel.*, COUNT(Reservation.IdReservation) AS NombreEmprunts
FROM Materiel
JOIN Reservation ON Materiel.IdMateriel = Reservation.IdMateriel
GROUP BY Materiel.IdMateriel
HAVING COUNT(Reservation.IdReservation) > 3;
