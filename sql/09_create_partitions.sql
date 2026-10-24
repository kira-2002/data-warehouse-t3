
-- Partition des ventes de janvier 2026
CREATE TABLE IF NOT EXISTS analytics.fact_ventes_2026_01
PARTITION OF analytics.fact_ventes_partitionnee
FOR VALUES FROM ('2026-01-01') TO ('2026-02-01');

-- Partition des ventes de février 2026
CREATE TABLE IF NOT EXISTS analytics.fact_ventes_2026_02
PARTITION OF analytics.fact_ventes_partitionnee
FOR VALUES FROM ('2026-02-01') TO ('2026-03-01');

-- Partition des ventes de mars 2026
CREATE TABLE IF NOT EXISTS analytics.fact_ventes_2026_03
PARTITION OF analytics.fact_ventes_partitionnee
FOR VALUES FROM ('2026-03-01') TO ('2026-04-01');

-- Partition des ventes d'avril 2026
CREATE TABLE IF NOT EXISTS analytics.fact_ventes_2026_04
PARTITION OF analytics.fact_ventes_partitionnee
FOR VALUES FROM ('2026-04-01') TO ('2026-05-01');
