1)wyswietl ilosc wizyt wszystkich pacjentow
SELECT p.id_pacjenta, ROUND(COUNT(w.id_wizyty)) Ilosc_wizyt_pacjenta
FROM wizyta w
JOIN Przychodnia p ON w.id_wizyty = p.id_wizyty
group by (p.id_pacjenta)
UNION SELECT null, ROUND(COUNT(id_wizyty)) FROM wizyta;
