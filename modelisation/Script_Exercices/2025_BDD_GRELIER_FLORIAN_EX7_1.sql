
--Exercice 7.1

SELECT DISTINCT Utilisateur.* FROM Utilisateur
JOIN Reservation ON Utilisateur.IdUtilisateur = Reservation.IdUtilisateur;