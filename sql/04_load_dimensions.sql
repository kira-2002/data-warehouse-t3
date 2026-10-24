
-- 1. Alimenter la dimension date
INSERT INTO analytics.dim_date (
    date_key, date_complete, jour, mois, trimestre, annee
)
SELECT DISTINCT
    TO_CHAR(date_vente, 'YYYYMMDD')::INTEGER,
    date_vente,
    EXTRACT(DAY FROM date_vente)::INTEGER,
    EXTRACT(MONTH FROM date_vente)::INTEGER,
    EXTRACT(QUARTER FROM date_vente)::INTEGER,
    EXTRACT(YEAR FROM date_vente)::INTEGER
FROM staging.ventes_brutes
WHERE date_vente IS NOT NULL
ON CONFLICT (date_complete) DO NOTHING;

-- 2. Alimenter la dimension produit
INSERT INTO analytics.dim_produit (produit, categorie)
SELECT DISTINCT produit, categorie
FROM staging.ventes_brutes
WHERE produit IS NOT NULL
  AND categorie IS NOT NULL
ON CONFLICT (produit, categorie) DO NOTHING;

-- 3. Alimenter la dimension géographique
INSERT INTO analytics.dim_geographie (pays, ville)
SELECT DISTINCT pays, ville
FROM staging.ventes_brutes
WHERE pays IS NOT NULL
  AND ville IS NOT NULL
ON CONFLICT (pays, ville) DO NOTHING;
