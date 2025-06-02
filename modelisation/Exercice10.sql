
-- Exercice 10

alter table disponibilite drop constraint IdMateriel;
alter table reservation drop constraint IdUtilisateur;
alter table reservation drop constraint IdMateriel;
alter table reservation drop constraint IdDisponibilite;

TRUNCATE TABLE reservation RESTART IDENTITY CASCADE;
TRUNCATE TABLE disponibilite RESTART IDENTITY CASCADE;
TRUNCATE TABLE materiel RESTART IDENTITY CASCADE;
TRUNCATE TABLE utilisateur RESTART IDENTITY CASCADE;


-- Insert 1,000,000 rows into utilisateur
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO Utilisateur (IdUtilisateur, Nom, Prenom, Email)
        VALUES (
            i,
            'nom_' || i,
            'prenom_' || i,
            'user_' || i || '@example.com'
        );
    END LOOP;
END $$;

-- Insert 1,000,000 rows into materiel
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..100000 LOOP
        INSERT INTO materiel (IdMateriel, Nom, Categorie, QuantiteDisponible)
        VALUES (
            i,
            'materiel_' || i,
            'description for materiel_' || i,
            (random() * 20)::INT + 1 -- Random quantity between 1 and 20 for the available quantity
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into disponibilite
DO $$
DECLARE
    i INT;
    start_date DATE;
    end_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random start and end dates
        start_date := DATE '2025-01-01' + (random() * 365)::INT;
        end_date := start_date + (random() * 30)::INT;

        INSERT INTO disponibilite (IdDisponibilite, IdMateriel, DateDebut, DateFin)
        VALUES (
            i,
            (random() * 99999)::INT + 1, -- Random id_materiel between 1 and 1,000,000
            start_date,
            end_date
            --(random() < 0.5) -- Random boolean for retard
        );
    END LOOP;
END $$;

-- Insert 2,000,000 rows into reservation
DO $$
DECLARE
    i INT;
    reservation_date DATE;
    return_date DATE;
	effective_return_date DATE;
BEGIN
    FOR i IN 1..200000 LOOP
        -- Generate random reservation and return dates
        reservation_date := DATE '2025-01-01' + (random() * 365)::INT;
        return_date := reservation_date + (random() * 15)::INT;
		effective_return_date := reservation_date + (random() * 15)::INT;

        INSERT INTO reservation (IdReservation, DateDebut, DateFin, Quantite, IdMateriel, IdUtilisateur, date_retour_effectif)
        VALUES (
            i,
            reservation_date,
            return_date,
            (random() * 999)::INT + 1, -- Random quantite between 1 and 1,000
            (random() * 99999)::INT + 1,  -- Random identifiant_materiel between 1 and 1,000,000
			(random() * 99999)::INT + 1, -- Random identifiant_utilisateur between 1 and 1,000,000
			effective_return_date
        );
    END LOOP;
END $$;


-- Question 5
select * 
from reservation INNER join materiel ON materiel.idmateriel = reservation.idmateriel
where materiel.nom='materiel_7216'


-- Question 7
CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX idx_utilisateur_nom_gin
ON utilisateur
USING gin (nom gin_trgm_ops);


-- Question 8
