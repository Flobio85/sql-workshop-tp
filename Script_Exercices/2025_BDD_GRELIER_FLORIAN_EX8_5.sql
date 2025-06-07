
--Exercice 8.5

-- Requêtes que pourraient utiliser un administrateur pour ajouter, modifier et supprimer
INSERT INTO disponibilite (IdMateriel, DateDebut, DateFin) VALUES (1, '2025-07-01', '2025-07-15');

UPDATE disponibilite
SET DateDebut = '2025-07-05', DateFin = '2025-07-20'
WHERE IdDisponibilite = 1;

DELETE FROM disponibilite WHERE IdDisponibilite = 1;