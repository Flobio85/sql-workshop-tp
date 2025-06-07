
--Exercice 8.3

SELECT 
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM disponibilite d
            WHERE d.IdMateriel = 1
            AND d.DateDebut <= '2025-06-10'
            AND d.DateFin >= '2025-06-05'
        )
        THEN 'OK'
        ELSE 'KO'
    END AS disponibilite;
