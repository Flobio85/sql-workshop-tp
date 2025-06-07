
--Exercice 8.2

-- Alter Table permet de modifier une table sans avoir à effacer et recréer la table
ALTER TABLE reservation ADD COLUMN IdDisponibilite INT;

ALTER TABLE reservation
ADD CONSTRAINT FkDisponibilite FOREIGN KEY (IdDisponibilite)
    REFERENCES disponibilite(IdDisponibilite)
    ON DELETE SET NULL;
