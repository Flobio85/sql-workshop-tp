
--Exercie 5.2

-- On réalise une sous-requête pour récupérer tous les matériels qui sont en cours d'emprunt et dont la date de retour est prévue dans plus de 2 jours.
-- Puis on met à jour la QuantiteDisponible avec le résultat obtenue
UPDATE Materiel
SET QuantiteDisponible = QuantiteDisponible - sub.Quantite
FROM (
    SELECT IdMateriel, SUM(Quantite) AS Quantite
    FROM Reservation
    WHERE DateFin > CURRENT_DATE + INTERVAL '2 days'
    GROUP BY IdMateriel
) AS sub
WHERE Materiel.IdMateriel = sub.IdMateriel;