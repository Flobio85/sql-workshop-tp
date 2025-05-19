
-- Exercice 2

SELECT * FROM utilisateur
WHERE prenom LIKE 'L%';

SELECT * FROM materiel
WHERE categorie = 'Informatique' AND quantite > 5;

SELECT * FROM reservation
WHERE idutilisateur = 1;
