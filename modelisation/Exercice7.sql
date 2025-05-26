
--Exercice 7

-- Pour toutes ces requêtes, utiliser des jointures est la solution la plus appropriée

SELECT DISTINCT Utilisateur.* FROM Utilisateur
JOIN Reservation ON Utilisateur.IdUtilisateur = Reservation.IdUtilisateur;


SELECT Materiel.* FROM Materiel
LEFT JOIN Reservation ON Materiel.IdMateriel = Reservation.IdMateriel
WHERE Reservation.IdReservation IS NULL;


SELECT Materiel.*, COUNT(Reservation.IdReservation) AS NombreEmprunts
FROM Materiel
JOIN Reservation ON Materiel.IdMateriel = Reservation.IdMateriel
GROUP BY Materiel.IdMateriel
HAVING COUNT(Reservation.IdReservation) > 3;


SELECT Utilisateur.*, COUNT(Reservation.IdReservation) AS NombreEmprunts
FROM Utilisateur
LEFT JOIN Reservation ON Utilisateur.IdUtilisateur = Reservation.IdUtilisateur
GROUP BY Utilisateur.IdUtilisateur
ORDER BY Utilisateur.IdUtilisateur;
