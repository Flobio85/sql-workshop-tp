
-- Exercice 10.7

CREATE EXTENSION IF NOT EXISTS pg_trgm;

CREATE INDEX idx_utilisateur_nom_gin
ON utilisateur
USING gin (nom gin_trgm_ops);