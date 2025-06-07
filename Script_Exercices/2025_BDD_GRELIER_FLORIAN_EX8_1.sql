
--Exercice 8.1

CREATE TABLE disponibilite (
    IdDisponibilite SERIAL PRIMARY KEY,
    IdMateriel INT NOT NULL,
    DateDebut DATE NOT NULL,
    DateFin DATE NOT NULL,
    CONSTRAINT FkDisponibiliteMateriel FOREIGN KEY (IdMateriel)
        REFERENCES Materiel(IdMateriel)
        ON DELETE CASCADE
);
