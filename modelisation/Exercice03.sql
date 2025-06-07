
-- Exercice 3

SELECT 
    utilisateur.nom,
    utilisateur.prenom,
    utilisateur.email,
    reservation.datedebut,
    reservation.datefin,
    reservation.idmateriel
FROM reservation
JOIN utilisateur ON reservation.idutilisateur = utilisateur.idutilisateur;


SELECT 
    utilisateur.nom,
    utilisateur.prenom,
    materiel.nom,
    materiel.categorie,
    materiel.quantitedisponible,
    reservation.datedebut,
    reservation.datefin
FROM reservation
JOIN utilisateur ON reservation.idutilisateur = utilisateur.idutilisateur
JOIN materiel ON reservation.idmateriel = materiel.idmateriel
WHERE utilisateur.idutilisateur = 1;
