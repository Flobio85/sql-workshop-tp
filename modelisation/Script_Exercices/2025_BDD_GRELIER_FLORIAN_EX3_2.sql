
-- Exercice 3.2

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