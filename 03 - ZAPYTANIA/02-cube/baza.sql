2)wyswietl pacjenta i ilosc zakupionych przez niego lekarstw
SELECT p.id_pacjenta, ROUND(COUNT(l.id_lekarstwa)) Ilosc_zakupionych_lekarstw
FROM przychodnia p
JOIN wizyta w ON p.id_wizyty=w.id_wizyty
JOIN lekarstwa l ON w.id_lekarstwa=l.id_lekarstwa
group by (p.id_pacjenta)
UNION SELECT null, ROUND(COUNT(id_lekarstwa)) FROM lekarstwa;