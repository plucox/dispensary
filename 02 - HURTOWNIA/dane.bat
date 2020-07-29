SET name=hurtownia
SET password=hurtownia
sqlldr %name%/%password% control='adresy.ctl' data='adresy.csv'
sqlldr %name%/%password% control='lekarstwa.ctl' data='lekarstwa.csv'
sqlldr %name%/%password% control='pacjenci.ctl' data='pacjenci.csv'
sqlldr %name%/%password% control='pracownicy.ctl' data='pracownicy.csv'
sqlldr %name%/%password% control='przyjecia.ctl' data='przyjecia.csv'
sqlldr %name%/%password% control='stanowiska.ctl' data='stanowiska.csv'
sqlldr %name%/%password% control='wizyta.ctl' data='wizyta.csv'
sqlldr %name%/%password% control='przychodnia.ctl' data='przychodnia.csv'
DEL *.BAD
DEL *.LOG
pause