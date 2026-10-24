&#x20;Projet T3 — Data Warehouse avec PostgreSQL et DuckDB



1\. Présentation du projet



Ce projet consiste à construire un mini Data Warehouse destiné à centraliser et analyser des données de ventes réalisées dans plusieurs pays africains.



Il met en pratique les principales étapes d'un processus analytique : importation des données, modélisation dimensionnelle, calcul d'indicateurs, partitionnement et analyse SQL.



2\. Objectifs



\- Importer des données de ventes depuis un fichier CSV.

\- Construire un schéma en étoile dans PostgreSQL.

\- Créer des dimensions et une table de faits.

\- Calculer le chiffre d'affaires et les quantités vendues.

\- Créer une vue matérialisée pour analyser les ventes par pays.

\- Expérimenter le partitionnement mensuel.

\- Utiliser DuckDB pour effectuer des analyses SQL sur un fichier CSV.

\- Exporter les résultats analytiques vers un autre fichier CSV.

3\. Technologies utilisées



\- Python 3.12.8 : exécution des scripts.

\- PostgreSQL 18 : stockage et modélisation des données.

\- DuckDB 2.0.0 : analyses SQL locales.

\- SQL : transformation et agrégation des données.

\- CSV : format des données sources et des résultats exportés.



&#x20;4. Architecture du projet





data-warehouse-t3/

├── data/

│   ├── ventes\_afrique.csv

│   └── ventes\_par\_pays.csv

├── sql/

│   ├── 01\_create\_schema.sql

│   ├── 02\_create\_staging.sql

│   ├── 03\_create\_dimensions.sql

│   ├── 04\_load\_dimensions.sql

│   ├── 05\_create\_fact\_table.sql

│   ├── 06\_load\_fact\_table.sql

│   ├── 07\_create\_materialized\_view.sql

│   ├── 08\_create\_partitioned\_table.sql

│   ├── 09\_create\_partitions.sql

│   └── 10\_load\_partitioned\_table.sql

├── scripts/

│   └── analyse\_duckdb.py

├── docs/

└── README.md





5\. Modélisation dimensionnelle



Le schéma en étoile repose sur une table de faits et trois dimensions :



\- `analytics.fact\_ventes` : quantités, prix unitaires et chiffre d'affaires.

\- `analytics.dim\_date` : dates, jours, mois, trimestres et années.

\- `analytics.dim\_produit` : produits et catégories.

\- `analytics.dim\_geographie` : pays et villes.



Le chiffre d'affaires est calculé à partir de la quantité multipliée par le prix unitaire.



6\. Résultats obtenus



Le jeu de données contient 12 ventes, réparties entre quatre pays.



| Indicateur | Résultat |

|---|---:|

| Nombre de ventes | 12 |

| Quantité totale vendue | 64 |

| Chiffre d'affaires total | 2 876 000 FCFA |



Chiffre d'affaires par pays



| Pays | Ventes | Quantité | Chiffre d'affaires |

|---|---:|---:|---:|

| Sénégal | 5 | 34 | 967 000 FCFA |

| Mali | 2 | 10 | 820 000 FCFA |

| Côte d'Ivoire | 3 | 9 | 665 000 FCFA |

| Bénin | 2 | 11 | 424 000 FCFA |



Le Sénégal présente le chiffre d'affaires le plus élevé dans ce jeu de données.



7\. Exécution de l'analyse DuckDB



Depuis la racine du projet, installer DuckDB si nécessaire :



python -m pip install duckdb



Lancer le script d'analyse :



bash

python scripts/analyse\_duckdb.py



Le script lit `data/ventes\_afrique.csv`, calcule les indicateurs par pays et exporte les résultats dans `data/ventes\_par\_pays.csv`.



8\. Partitionnement



Une table distincte, `analytics.fact\_ventes\_partitionnee`, a été créée avec un partitionnement par plage de dates (`RANGE`).



Quatre partitions mensuelles couvrent la période de janvier à avril 2026. Les 12 ventes ont été chargées et les totaux ont été comparés à ceux de la table de faits originale.



9\. Limites et perspectives



Le jeu de données est de petite taille et sert principalement à l'apprentissage. Les prochaines évolutions possibles sont :



\- Ajouter davantage de données de ventes.

\- Automatiser le chargement des données.

\- Ajouter des contrôles de qualité et de détection des doublons.

\- Créer un tableau de bord avec Streamlit ou Power BI.

\- Étudier les performances des requêtes sur un volume de données plus important.

&#x20;10. Auteur



Projet pédagogique réalisé dans le cadre de la formation Data Analyst.



