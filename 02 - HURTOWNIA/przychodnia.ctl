OPTIONS (skip=1)
LOAD DATA
INTO TABLE przychodnia
FIELDS TERMINATED BY '|'
(
id_przychodni,
id_pracownika,
id_stanowiska,
id_adresu,
id_przyjecia,
id_lekarstwa,
id_wizyty,
id_pacjenta,
cena_lekarstwa,
typ_platnosci,
dzien_wolny DATE "DD/MM/YY",
powierzchnia_m2,
priorytet,
cena_wizyty,
podatek
)