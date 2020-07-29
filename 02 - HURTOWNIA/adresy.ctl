OPTIONS (skip=1)
LOAD DATA
INTO TABLE adresy
FIELDS TERMINATED BY '|'
(
id_adresu,
miasto,
ulica,
kod_pocztowy,
nr_budynku,
nr_lokalu
)