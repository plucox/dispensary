1) wyswietl ilosc wizyt wszystkich pacjentow
SELECT DISTINCT id_pacjenta, ROUND(COUNT(id_wizyty)) Ilosc_wizyt_pacjenta
FROM Przychodnia
GROUP BY ROLLUP(id_pacjenta)
ORDER BY id_pacjenta;