
-- Exercice 10.5

SELECT * 
FROM reservation INNER JOIN materiel ON materiel.idmateriel = reservation.idmateriel
WHERE materiel.nom='materiel_7216'
