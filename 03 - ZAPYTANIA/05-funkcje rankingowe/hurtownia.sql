5)Ranking ktory lekarz przyjal najwiecej pacjentow
SELECT id_pracownika, COUNT(*) AS "Ilosc wizyt", 
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) "Ranking"
FROM przychodnia
GROUP BY id_pracownika;