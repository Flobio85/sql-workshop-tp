
--Exercice 9.1

CREATE TABLE RetourMateriel (
    IdRetour SERIAL PRIMARY KEY,
    IdReservation INT NOT NULL,
    date_retour DATE NOT NULL,
    retard BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (IDReservation) REFERENCES Reservation(IdReservation)
        ON DELETE CASCADE
);

