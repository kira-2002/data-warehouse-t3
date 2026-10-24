
-- Dimension temporelle
CREATE TABLE IF NOT EXISTS analytics.dim_date (
    date_key INTEGER PRIMARY KEY,
    date_complete DATE UNIQUE NOT NULL,
    jour INTEGER NOT NULL,
    mois INTEGER NOT NULL,
    trimestre INTEGER NOT NULL,
    annee INTEGER NOT NULL
);

-- Dimension produit
CREATE TABLE IF NOT EXISTS analytics.dim_produit (
    produit_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    produit VARCHAR(100) NOT NULL,
    categorie VARCHAR(100) NOT NULL,
    UNIQUE (produit, categorie)
);

-- Dimension géographique
CREATE TABLE IF NOT EXISTS analytics.dim_geographie (
    geographie_key INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pays VARCHAR(100) NOT NULL,
    ville VARCHAR(100) NOT NULL,
    UNIQUE (pays, ville)
);
