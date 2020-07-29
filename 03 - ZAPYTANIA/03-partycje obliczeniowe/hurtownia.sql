3)Jaki % sprzedazy stanowi dany lek
SELECT distinct id_lekarstwa, cena_lekarstwa,
sum(cena_lekarstwa) over (partition by id_lekarstwa) sum_lek,
round(100*cena_lekarstwa/(sum(cena_lekarstwa) over (partition by id_lekarstwa)),2) "SPRZEDAZ%"
from przychodnia
order by id_lekarstwa;