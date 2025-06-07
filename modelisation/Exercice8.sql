
--Exercice 8

-- Question 1
CREATE TABLE disponibilite (
    IdDisponibilite SERIAL PRIMARY KEY,
    IdMateriel INT NOT NULL,
    DateDebut DATE NOT NULL,
    DateFin DATE NOT NULL,
    CONSTRAINT FkDisponibiliteMateriel FOREIGN KEY (IdMateriel)
        REFERENCES Materiel(IdMateriel)
        ON DELETE CASCADE
);


-- Question 2
-- Alter Table permet de modifier une table sans avoir à effacer et recréer la table
ALTER TABLE reservation ADD COLUMN IdDisponibilite INT;

ALTER TABLE reservation
ADD CONSTRAINT FkDisponibilite FOREIGN KEY (IdDisponibilite)
    REFERENCES disponibilite(IdDisponibilite)
    ON DELETE SET NULL;


-- Question 3
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


-- Question 4
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


-- Question 5

-- Requêtes que pourraient utiliser un administrateur pour ajouter, modifier et supprimer
INSERT INTO disponibilite (IdMateriel, DateDebut, DateFin) VALUES (1, '2025-07-01', '2025-07-15');

UPDATE disponibilite
SET DateDebut = '2025-07-05', DateFin = '2025-07-20'
WHERE IdDisponibilite = 1;

DELETE FROM disponibilite WHERE IdDisponibilite = 1;