
-- Table centrale des ventes
CREATE TABLE IF NOT EXISTS analytics.fact_ventes (
    id_vente INTEGER PRIMARY KEY,

    date_key INTEGER NOT NULL
        REFERENCES analytics.dim_date(date_key),

    produit_key INTEGER NOT NULL
        REFERENCES analytics.dim_produit(produit_key),

    geographie_key INTEGER NOT NULL
        REFERENCES analytics.dim_geographie(geographie_key),

    quantite INTEGER NOT NULL,
    prix_unitaire NUMERIC(12, 2) NOT NULL,

    chiffre_affaires NUMERIC(14, 2)
        GENERATED ALWAYS AS (quantite * prix_unitaire) STORED
);
