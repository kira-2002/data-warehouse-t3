
import duckdb
from pathlib import Path

# Chemin du fichier CSV
fichier_csv = Path(
    r"C:\Users\dell\data-warehouse-t3\data\ventes_afrique.csv"
)

# Vérifier que le fichier existe
if not fichier_csv.exists():
    raise FileNotFoundError(f"Fichier introuvable : {fichier_csv}")

# Connexion DuckDB en mémoire
connexion = duckdb.connect(database=":memory:")

# Analyse SQL du fichier CSV
requete = f"""
    SELECT
        pays,
        COUNT(*) AS nombre_ventes,
        SUM(quantite) AS quantite_totale,
        SUM(quantite * prix_unitaire) AS chiffre_affaires
    FROM read_csv_auto('{fichier_csv.as_posix()}')
    GROUP BY pays
    ORDER BY chiffre_affaires DESC
"""

resultat = connexion.execute(requete).df()

print("\n=== ANALYSE DES VENTES PAR PAYS ===")
print(resultat.to_string(index=False))

# Calcul du chiffre d'affaires global
total = connexion.execute(f"""
    SELECT SUM(quantite * prix_unitaire)
    FROM read_csv_auto('{fichier_csv.as_posix()}')
""").fetchone()[0]

print(f"\nChiffre d'affaires total : {total:,.0f} FCFA")
# Exporter les résultats vers un fichier CSV
fichier_sortie = Path(
    r"C:\Users\dell\data-warehouse-t3\data\ventes_par_pays.csv"
)

resultat.to_csv(fichier_sortie, index=False, encoding="utf-8")

print(f"\nRésultats exportés vers : {fichier_sortie}")

connexion.close()
