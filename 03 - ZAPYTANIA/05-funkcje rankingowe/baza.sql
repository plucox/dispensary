5)Ranking ktory lekarz przyjal najwiecej pacjentow
CREATE OR REPLACE VIEW stat_lata
AS
SELECT id_pracownika, count(*) ilosc_wizyt
FROM przychodnia
GROUP BY id_pracownika
ORDER BY ilosc_wizyt DESC;

SELECT t.id_pracownika,t.ilosc_wizyt,(
SELECT COUNT(*)+1  
FROM stat_lata x
WHERE t.ilosc_wizyt < x.ilosc_wizyt
) AS Ranking
FROM stat_lata t
ORDER BY  Ranking ASC;