OPTIONS (skip=1)
LOAD DATA
INTO TABLE lekarstwa
FIELDS TERMINATED BY '|'
(
id_lekarstwa,
nazwa,
opis,
ilosc_tabletek,
nfz
)