CREATE TABLE Utilisateur(
   IdUtilisateur SERIAL,
   Nom VARCHAR(50) ,
   Prenom VARCHAR(50) ,
   Email VARCHAR(100) ,
   PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE Materiel(
   IdMateriel SERIAL,
   Nom VARCHAR(100) ,
   Categorie VARCHAR(50) ,
   QuantiteDisponible INTEGER,
   PRIMARY KEY(IdMateriel)
);

CREATE TABLE Reservation(
   IdReservation SERIAL,
   DateDebut TIMESTAMP,
   DateFin TIMESTAMP,
   Quantite INTEGER,
   IdMateriel INTEGER,
   IdUtilisateur INTEGER,
   PRIMARY KEY(IdReservation),
   FOREIGN KEY(IdMateriel) REFERENCES Materiel(IdMateriel),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur)
);

