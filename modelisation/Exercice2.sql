
-- Exercice 2

-- Récupère un utilisateur dont le prénom commence par la lettre L
SELECT * FROM utilisateur
WHERE prenom LIKE 'L%';

-- Récupère un/des matériel(s) qui appartiennent à 'Informatique' et qui ont une quantite supérieur à 5
SELECT * FROM materiel
WHERE categorie = 'Informatique' AND quantite > 5;

-- Récupère la/les réservations de l'utilisateur ayant l'ID 1
SELECT * FROM reservation
WHERE idutilisateur = 1;
