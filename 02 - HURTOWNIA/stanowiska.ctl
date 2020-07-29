OPTIONS (skip=1)
LOAD DATA
INTO TABLE stanowiska
FIELDS TERMINATED BY '|'
(
id_stanowiska,
nazwa,
pensja,
premia,
specjalizacja
)