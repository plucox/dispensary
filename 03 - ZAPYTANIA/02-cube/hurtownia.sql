2) wyswietl pacjenta i ilosc zakupionych przez niego lekarstw
SELECT DISTINCT id_pacjenta, COUNT(id_lekarstwa) Ilosc_zakupionych_lekarstw
FROM Przychodnia
GROUP BY CUBE(id_pacjenta)
ORDER BY id_pacjenta;