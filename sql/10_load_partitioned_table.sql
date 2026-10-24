
INSERT INTO analytics.fact_ventes_partitionnee (
    id_vente,
    date_complete,
    produit_key,
    geographie_key,
    quantite,
    prix_unitaire
)
SELECT
    f.id_vente,
    d.date_complete,
    f.produit_key,
    f.geographie_key,
    f.quantite,
    f.prix_unitaire
FROM analytics.fact_ventes AS f
JOIN analytics.dim_date AS d
    ON f.date_key = d.date_key
ON CONFLICT (id_vente, date_complete) DO NOTHING;
