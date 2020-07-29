4)srednia cena lekarstwa o danym podatku
select w.id_lekarstwa,l.podatek, ROUND(avg(l.cena_lekarstwa),2) AS srednia
FROM lekarstwa l
JOIN wizyta w ON l.id_lekarstwa=w.id_lekarstwa
GROUP BY w.id_lekarstwa,l.podatek
ORDER BY w.id_lekarstwa;