
-- Exercice 3.1

SELECT 
    utilisateur.nom,
    utilisateur.prenom,
    utilisateur.email,
    reservation.datedebut,
    reservation.datefin,
    reservation.idmateriel
FROM reservation
JOIN utilisateur ON reservation.idutilisateur = utilisateur.idutilisateur;
