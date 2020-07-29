4)srednia cena lekarstwa o danym podatku
SELECT DISTINCT id_lekarstwa, podatek,
ROUND(AVG(cena_lekarstwa) OVER (PARTITION BY id_lekarstwa, podatek
ORDER BY podatek RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING),2) as "Srednia_cena"
FROM przychodnia
ORDER BY id_lekarstwa, podatek;