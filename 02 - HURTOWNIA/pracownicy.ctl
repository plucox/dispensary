OPTIONS (skip=1)
LOAD DATA
INTO TABLE pracownicy
FIELDS TERMINATED BY '|'
(
id_pracownika,
imie,
nazwisko,
telefon,
staz,
pesel
)