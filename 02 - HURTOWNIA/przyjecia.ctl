OPTIONS (skip=1)
LOAD DATA
INTO TABLE przyjecia
FIELDS TERMINATED BY '|'
(
id_przyjecia,
godz_od,
godz_do,
dzien,
miesiac,
rok
)