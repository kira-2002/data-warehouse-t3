CREATE TABLE IF NOT EXISTS staging.ventes_brutes (
    id_vente       INTEGER,
    date_vente     DATE,
    pays           VARCHAR(100),
    ville          VARCHAR(100),
    produit        VARCHAR(100),
    categorie      VARCHAR(100),
    quantite       INTEGER,
    prix_unitaire  NUMERIC(12, 2)
);