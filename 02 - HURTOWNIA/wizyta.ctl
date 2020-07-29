OPTIONS (skip=1)
LOAD DATA
INTO TABLE wizyta
FIELDS TERMINATED BY '|'
(
id_wizyty,
opis_wizyty,
data DATE "DD/MM/YY"
)