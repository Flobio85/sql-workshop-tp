
-- Exercice 4.1

-- Permet de compter le nombre de ligne retourné par la condition qui est définis après
SELECT COUNT(*) AS total_reservations 
FROM Reservation
WHERE DateDebut >= '2025-06-01' AND DateFin <= '2025-06-05';
