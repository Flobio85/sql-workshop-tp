
-- Exercice 4

SELECT COUNT(*) AS total_reservations 
FROM Reservation
WHERE DateDebut >= '2025-06-01' AND DateFin <= '2025-06-05';


SELECT COUNT(DISTINCT IdUtilisateur) AS utilisateurs_ayant_emprunte
FROM Reservation;
