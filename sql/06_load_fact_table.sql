
-- Alimenter la table de faits à partir du staging
-- et des trois dimensions

INSERT INTO analytics.fact_ventes (
    id_vente,
    date_key,
    produit_key,
    geographie_key,
    quantite,
    prix_unitaire
)
SELECT
    v.id_vente,
    d.date_key,
    p.produit_key,
    g.geographie_key,
    v.quantite,
    v.prix_unitaire
FROM staging.ventes_brutes AS v
JOIN analytics.dim_date AS d
    ON d.date_complete = v.date_vente
JOIN analytics.dim_produit AS p
    ON p.produit = v.produit
   AND p.categorie = v.categorie
JOIN analytics.dim_geographie AS g
    ON g.pays = v.pays
   AND g.ville = v.ville
ON CONFLICT (id_vente) DO NOTHING;
