
--Exercice 8.4

CREATE OR REPLACE FUNCTION check_disponibilite()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM disponibilite d
        WHERE d.IdMateriel = NEW.IdMateriel
        AND d.DateDebut <= NEW.DateDebut
        AND d.DateFin >= NEW.DateFin
    ) THEN
        RAISE EXCEPTION 'Le matériel n''est pas disponible pour cette période';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trig_check_dispo
BEFORE INSERT ON reservation
FOR EACH ROW
EXECUTE FUNCTION check_disponibilite();
