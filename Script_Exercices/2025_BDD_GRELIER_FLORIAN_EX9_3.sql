
--Exercice 9.3

INSERT INTO RetourMateriel (IdReservation, date_retour, retard)
VALUES (
    3,
    CURRENT_DATE,
    CURRENT_DATE > (
        SELECT DateFin
        FROM Reservation
        WHERE IdReservation = 3
    )
);

UPDATE Reservation
SET date_retour_effectif = CURRENT_DATE
WHERE IdReservation = 3;