
-- Exercice 1

CREATE TABLE Utilisateur(
   IdUtilisateur SERIAL,
   Nom VARCHAR(50),
   Prenom VARCHAR(50),
   Email VARCHAR(100),
   PRIMARY KEY(IdUtilisateur)
);

CREATE TABLE Materiel(
   IdMateriel SERIAL,
   Nom VARCHAR(100),
   Categorie VARCHAR(50),
   QuantiteDisponible INT,
   PRIMARY KEY(IdMateriel)
);

CREATE TABLE Reservation(
   IdReservation SERIAL,
   DateDebut DATE,
   DateFin DATE,
   Quantite INT,
   IdMateriel INT,
   IdUtilisateur INT,
   PRIMARY KEY(IdReservation),
   FOREIGN KEY(IdMateriel) REFERENCES Materiel(IdMateriel),
   FOREIGN KEY(IdUtilisateur) REFERENCES Utilisateur(IdUtilisateur)
);


INSERT INTO utilisateur VALUES ('1', 'Perri', 'Lucas', 'perri.lucas@gmail.com');
INSERT INTO utilisateur VALUES ('2', 'MN', 'Aisles', 'mn.aisles@gmail.com');
INSERT INTO utilisateur VALUES ('3', 'Tagliafico', 'Nicolas', 'tagliafico.nicolas@gmail.com');
INSERT INTO utilisateur VALUES ('4', 'CC', 'Duje', 'cc.duje@gmail.com');
INSERT INTO utilisateur VALUES ('5', 'Niakhate', 'Mousse', 'niakhate.mouusa@gmail.com');
INSERT INTO utilisateur VALUES ('6', 'Tessman', 'Tanner', 'tessman.tanner@gmail.com');
INSERT INTO utilisateur VALUES ('7', 'Veretout', 'Jordan', 'veretout.jordan@gmail.com');
INSERT INTO utilisateur VALUES ('8', 'Almada', 'Thiago', 'almada.thiago@gmail.com');
INSERT INTO utilisateur VALUES ('9', 'Cherki', 'Rayan', 'cherki.rayan@ol.fr');
INSERT INTO utilisateur VALUES ('10', 'Lacazette', 'Alexandre', 'lacazette.alexandren@ol.fr');
INSERT INTO utilisateur VALUES ('11', 'Fofana', 'Malick', 'fofana.malick@gmail.com');
INSERT INTO utilisateur VALUES ('12', 'Tolisso', 'Corentin', 'tolisso.corentin@ol;fr');

INSERT INTO materiel VALUES ('1', 'Clavier', 'Informatique', '10');
INSERT INTO materiel VALUES ('2', 'Souris', 'Informatique', '10');
INSERT INTO materiel VALUES ('3', 'Ecran', 'Informatique', '5');
INSERT INTO materiel VALUES ('4', 'Table', 'Mobilie', '15');
INSERT INTO materiel VALUES ('5', 'Chaise', 'Mobilie', '40');
INSERT INTO materiel VALUES ('6', 'Banc', 'Mobilie', '40');
INSERT INTO materiel VALUES ('7', 'Ballon', 'Objet', '10');
INSERT INTO materiel VALUES ('8', 'Plot', 'Objet', '40');
INSERT INTO materiel VALUES ('9', 'Chaussure', 'Vetement', '20');
INSERT INTO materiel VALUES ('10', 'Maillot', 'Vetement', '20');

INSERT INTO reservation VALUES ('1', '2025-06-01', '2025-06-02', '1', '10', '1');
INSERT INTO reservation VALUES ('2', '2025-06-02', '2025-06-03', '2', '9', '2');
INSERT INTO reservation VALUES ('3', '2025-06-03', '2025-06-04', '3', '8', '3');
INSERT INTO reservation VALUES ('4', '2025-06-04', '2025-06-05', '3', '7', '4');
INSERT INTO reservation VALUES ('5', '2025-06-05', '2025-06-06', '2', '6', '5');
INSERT INTO reservation VALUES ('6', '2025-06-06', '2025-06-07', '1', '5', '6');
INSERT INTO reservation VALUES ('7', '2025-06-07', '2025-06-08', '1', '4', '7');
INSERT INTO reservation VALUES ('8', '2025-06-08', '2025-06-09', '2', '3', '8');
INSERT INTO reservation VALUES ('9', '2025-06-09', '2025-06-10', '11', '2', '9');
INSERT INTO reservation VALUES ('10', '2025-06-10', '2025-06-11', '11', '1', '10');
