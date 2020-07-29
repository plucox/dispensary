OPTIONS (skip=1)
LOAD DATA
INTO TABLE pacjenci
FIELDS TERMINATED BY '|'
(
id_pacjenta,
imie,
nazwisko,
wiek,
telefon,
pesel
)