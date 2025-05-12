CREATE TABLE Utilisateur(
   IdUtilisateur COUNTER,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Email VARCHAR(100),
   PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE Materiel(
   IdMateriel COUNTER,
   Nom VARCHAR(100),
   Categorie VARCHAR(50),
   QuantiteDisponible INT,
   PRIMARY KEY(IdMateriel)
);

CREATE TABLE Reservation(
   IdReservation COUNTER,
   DateDebut DATETIME,
   DateFin DATETIME,
   Quantite INT,
   IdMateriel INT,
   IdUtilisateur INT,
   PRIMARY KEY(IdReservation),
   FOREIGN KEY(IdMateriel) REFERENCES Materiel(IdMateriel),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur)
);
