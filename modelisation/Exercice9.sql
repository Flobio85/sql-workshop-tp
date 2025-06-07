
--Exercice 9

-- Question 1
CREATE TABLE RetourMateriel (
    IdRetour SERIAL PRIMARY KEY,
    IdReservation INT NOT NULL,
    date_retour DATE NOT NULL,
    retard BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IDReservation) REFERENCES Reservation(IdReservation)
        ON DELETE CASCADE
);


-- Question 2
ALTER TABLE Reservation ADD COLUMN date_retour_effectif DATE;


-- Question 4
CREATE OR REPLACE FUNCTION verifier_retard()
RETURNS TRIGGER AS $$
BEGIN
    -- Récupère la date prévue depuis la réservation
    DECLARE date_prevue DATE;
    BEGIN
        SELECT date_fin INTO date_prevue
        FROM Reservation
        WHERE IdReservation = NEW.IdReservation;

        -- Comparaison entre date retour et date fin prévue
        IF NEW.date_retour > date_prevue THEN
            NEW.retard := TRUE;
        ELSE
            NEW.retard := FALSE;
        END IF;

        -- Mise à jour de la réservation 
        UPDATE Reservation
        SET date_retour_effectif = NEW.date_retour
        WHERE IdReservation = NEW.IdReservation;

        RETURN NEW;
    END;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_verif_retard
BEFORE INSERT ON RetourMateriel
FOR EACH ROW
EXECUTE FUNCTION verifier_retard();


-- Question 5 : Exemple de politique simple = 5€ par jour de retard
SELECT 
    rm.IdReservation,
    rm.date_retour,
    res.datefin,
    GREATEST(0, rm.date_retour - res.datefin) AS jours_de_retard,
    GREATEST(0, (rm.date_retour - res.datefin) * 5) AS penalite
FROM RetourMateriel rm
JOIN Reservation res ON res.IdReservation = rm.IdReservation;


