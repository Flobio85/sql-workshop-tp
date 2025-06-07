
--Exercice 9.5

SELECT 
    rm.IdReservation,
    rm.date_retour,
    res.datefin,
    GREATEST(0, rm.date_retour - res.datefin) AS jours_de_retard,
    GREATEST(0, (rm.date_retour - res.datefin) * 5) AS penalite
FROM RetourMateriel rm
JOIN Reservation res ON res.IdReservation = rm.IdReservation;
