
--Exercice 7.4

SELECT Utilisateur.*, COUNT(Reservation.IdReservation) AS NombreEmprunts
FROM Utilisateur
LEFT JOIN Reservation ON Utilisateur.IdUtilisateur = Reservation.IdUtilisateur
GROUP BY Utilisateur.IdUtilisateur
ORDER BY Utilisateur.IdUtilisateur;
