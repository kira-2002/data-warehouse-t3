
CREATE MATERIALIZED VIEW IF NOT EXISTS analytics.mv_ventes_par_pays AS
SELECT
    g.pays,
    COUNT(*) AS nombre_ventes,
    SUM(f.quantite) AS quantite_totale,
    SUM(f.chiffre_affaires) AS chiffre_affaires_total
FROM analytics.fact_ventes AS f
JOIN analytics.dim_geographie AS g
    ON f.geographie_key = g.geographie_key
GROUP BY g.pays;
