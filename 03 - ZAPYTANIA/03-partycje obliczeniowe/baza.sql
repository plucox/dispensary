3)Jaki % sprzedazy stanowi dany lek
SELECT DISTINCT w.id_lekarstwa, l.cena_lekarstwa, SUM(l.cena_lekarstwa) sum_lek,
round(100*sum(l.cena_lekarstwa)/(SELECT sum(l.cena_lekarstwa) FROM lekarstwa l JOIN wizyta w ON l.id_lekarstwa=w.id_lekarstwa JOIN przychodnia p ON w.id_wizyty=p.id_wizyty),2) "SPRZEDAZ%"
FROM lekarstwa l
JOIN wizyta w ON l.id_lekarstwa=w.id_lekarstwa
JOIN przychodnia p ON w.id_wizyty=p.id_wizyty
GROUP BY (w.id_lekarstwa, l.cena_lekarstwa)
ORDER BY w.id_lekarstwa;
