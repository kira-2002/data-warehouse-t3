
CREATE TABLE IF NOT EXISTS analytics.fact_ventes_partitionnee (
    id_vente INTEGER NOT NULL,
    date_complete DATE NOT NULL,
    produit_key INTEGER NOT NULL,
    geographie_key INTEGER NOT NULL,
    quantite INTEGER NOT NULL,
    prix_unitaire NUMERIC(12, 2) NOT NULL,
    chiffre_affaires NUMERIC(14, 2)
        GENERATED ALWAYS AS (quantite * prix_unitaire) STORED,

    PRIMARY KEY (id_vente, date_complete),

    FOREIGN KEY (produit_key)
        REFERENCES analytics.dim_produit(produit_key),

    FOREIGN KEY (geographie_key)
        REFERENCES analytics.dim_geographie(geographie_key)
)
PARTITION BY RANGE (date_complete);
