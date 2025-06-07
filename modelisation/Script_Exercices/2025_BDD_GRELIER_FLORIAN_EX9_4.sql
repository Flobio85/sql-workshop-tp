
--Exercice 9.4

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
