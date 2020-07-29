DROP TABLE przychodnia CASCADE CONSTRAINTS;
DROP TABLE przyjecia CASCADE CONSTRAINTS;
DROP TABLE wizyta CASCADE CONSTRAINTS;
DROP TABLE lekarstwa CASCADE CONSTRAINTS;
DROP TABLE pacjenci CASCADE CONSTRAINTS; 
DROP TABLE adresy CASCADE CONSTRAINTS; 
DROP TABLE stanowiska CASCADE CONSTRAINTS; 
DROP TABLE pracownicy CASCADE CONSTRAINTS; 

CREATE TABLE pracownicy(
Id_pracownika INT NOT NULL PRIMARY KEY,
Imie VARCHAR2(50) NOT NULL,
Nazwisko VARCHAR2(50) NOT NULL,
Telefon VARCHAR2(15) NOT NULL,
Staz INT CHECK(Staz>=0) NOT NULL,
PESEL VARCHAR(13) NOT NULL UNIQUE);

CREATE TABLE Stanowiska(
Id_stanowiska INT NOT NULL PRIMARY KEY,
Nazwa VARCHAR2(100) NOT NULL,
Pensja INT CHECK(Pensja >=0) NOT NULL,
Premia INT CHECK(Premia >=0) NOT NULL,
Specjalizacja VARCHAR2(100) NOT NULL);

CREATE TABLE Adresy(
Id_adresu INT NOT NULL PRIMARY KEY,
Miasto VARCHAR2(40) NOT NULL,
Ulica VARCHAR2(40) NOT NULL,
Kod_pocztowy VARCHAR2(10) NOT NULL,
Nr_budynku VARCHAR2(15) NOT NULL,
Nr_lokalu VARCHAR2(15) NOT NULL);

CREATE TABLE Pacjenci(
Id_pacjenta INT NOT NULL PRIMARY KEY,
Imie VARCHAR2(20) NOT NULL,
Nazwisko VARCHAR2(20) NOT NULL,
Wiek INT CONSTRAINT wiek_ch CHECK(Wiek>=0) NOT NULL,
Telefon VARCHAR2(15) NOT NULL,
Pesel VARCHAR(13) CONSTRAINT pesel_uq UNIQUE NOT NULL);

CREATE TABLE Lekarstwa(
Id_lekarstwa INT NOT NULL PRIMARY KEY,
Nazwa VARCHAR2(100) NOT NULL,
Opis VARCHAR2(100) NOT NULL,
Ilosc_tabletek INT CONSTRAINT ilosc_ch CHECK(Ilosc_tabletek>0) NOT NULL,
NFZ VARCHAR2(7) constraint NFZ_ch CHECK (NFZ IN ('"TAK"','"NIE"')) NOT NULL);

CREATE TABLE Wizyta(
Id_wizyty INT NOT NULL PRIMARY KEY,
Opis_wizyty VARCHAR2(100) NOT NULL,
Data DATE NOT NULL);

CREATE TABLE Przyjecia(
Id_przyjecia INT NOT NULL PRIMARY KEY,
Godz_od INT NOT NULL,
Godz_do INT NOT NULL,
Dzien INT NOT NULL,
Miesiac INT NOT NULL,
Rok INT NOT NULL);

CREATE TABLE Przychodnia(
Id_przychodni INT NOT NULL PRIMARY KEY,
Id_pracownika INT NOT NULL,
Id_stanowiska INT NOT NULL,
Id_adresu INT NOT NULL,
Id_przyjecia INT NOT NULL,
Id_lekarstwa INT NOT NULL,
Id_wizyty INT NOT NULL,
Id_pacjenta INT NOT NULL,
Cena_Lekarstwa INT CHECK (Cena_lekarstwa >0) NOT NULL,
Typ_platnosci VARCHAR2(20) constraint typ_ch CHECK (Typ_platnosci IN ('"KARTA"','"GOTOWKA"')) NOT NULL,
Dzien_wolny DATE NOT NULL,
Powierzchnia_m2 INT NOT NULL,
Priorytet INT CHECK(Priorytet>0 AND Priorytet <=10) NOT NULL,
Cena_wizyty INT CHECK(Cena_wizyty>=0) NOT NULL,
Podatek INT CHECK(Podatek>=0 and Podatek<51) NOT NULL,
CONSTRAINT przych_prac_fk FOREIGN KEY (Id_pracownika) REFERENCES Pracownicy(Id_pracownika),
CONSTRAINT przych_stan_fk FOREIGN KEY (Id_stanowiska) REFERENCES Stanowiska(Id_stanowiska),
CONSTRAINT przych_adr_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu),
CONSTRAINT przych_przyj_fk FOREIGN KEY (Id_przyjecia) REFERENCES Przyjecia(Id_przyjecia),
CONSTRAINT przych_lek_fk FOREIGN KEY (Id_lekarstwa) REFERENCES Lekarstwa(Id_lekarstwa),
CONSTRAINT przych_wiz_fk FOREIGN KEY (Id_wizyty) REFERENCES Wizyta(Id_wizyty),
CONSTRAINT przych_pacj_fk FOREIGN KEY (Id_pacjenta) REFERENCES Pacjenci(Id_pacjenta));

