
-- Création des schémas du Data Warehouse

CREATE SCHEMA IF NOT EXISTS staging;

CREATE SCHEMA IF NOT EXISTS analytics;

-- Vérification : afficher les schémas existants
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name IN ('staging', 'analytics')
ORDER BY schema_name;
