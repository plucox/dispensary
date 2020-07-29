DROP TABLE przychodnia CASCADE CONSTRAINTS;
DROP TABLE przyjecia CASCADE CONSTRAINTS;
DROP TABLE rok CASCADE CONSTRAINTS;
DROP TABLE miesiac CASCADE CONSTRAINTS;
DROP TABLE dzien CASCADE CONSTRAINTS;
DROP TABLE wizyta CASCADE CONSTRAINTS;
DROP TABLE choroby CASCADE CONSTRAINTS;
DROP TABLE skierowania CASCADE CONSTRAINTS;
DROP TABLE lekarstwa CASCADE CONSTRAINTS;
DROP TABLE pacjenci CASCADE CONSTRAINTS;
DROP TABLE pracownicy CASCADE CONSTRAINTS;
DROP TABLE adresy CASCADE CONSTRAINTS;
DROP TABLE stanowiska CASCADE CONSTRAINTS;
DROP TABLE gabinety CASCADE CONSTRAINTS;

CREATE TABLE Gabinety(
Id_gabinetu INT NOT NULL PRIMARY KEY,
Pietro INT NOT NULL,
Pokoj INT NOT NULL,
Opis VARCHAR2(100) NOT NULL);

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
Nr_lokalu VARCHAR2(15) NOT NULL,
Powierzchnia_m2 INT CHECK (Powierzchnia_m2 >0) NOT NULL);

CREATE TABLE Pracownicy(
Id_pracownika INT NOT NULL PRIMARY KEY,
Id_gabinetu INT NOT NULL,
Id_stanowiska INT NOT NULL,
Id_adresu INT NOT NULL,
Imie VARCHAR2(50) NOT NULL,
Nazwisko VARCHAR2(50) NOT NULL,
Telefon VARCHAR2(15) NOT NULL,
Staz INT CHECK(Staz>=0) NOT NULL,
Pesel VARCHAR(11) NOT NULL UNIQUE,
CONSTRAINT prac_gab_fk FOREIGN KEY (Id_gabinetu) REFERENCES Gabinety(Id_gabinetu),
CONSTRAINT prac_stan_fk FOREIGN KEY (Id_stanowiska) REFERENCES Stanowiska(Id_stanowiska),
CONSTRAINT prac_adr_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu));

CREATE TABLE Pacjenci(
Id_pacjenta INT NOT NULL PRIMARY KEY,
Id_adresu INT NOT NULL,
Imie VARCHAR2(20) NOT NULL,
Nazwisko VARCHAR2(20) NOT NULL,
Wiek INT CHECK(Wiek>=0) NOT NULL,
Telefon VARCHAR2(15) NOT NULL,
Pesel VARCHAR(11) UNIQUE NOT NULL,
Priorytet INT CHECK(Priorytet>0 AND Priorytet <=10) NOT NULL,
CONSTRAINT pacj_adr_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu));

CREATE TABLE Lekarstwa(
Id_lekarstwa INT NOT NULL PRIMARY KEY,
Nazwa VARCHAR2(30) NOT NULL,
Opis VARCHAR2(50) NOT NULL,
Cena_lekarstwa INT CHECK(Cena_lekarstwa>=0) NOT NULL,
Ilosc_tabletek INT CHECK(Ilosc_tabletek>0) NOT NULL,
NFZ VARCHAR2(5) CHECK(NFZ IN ('TAK','NIE')) NOT NULL,
Podatek INT CHECK(Podatek>=0 and Podatek<51) NOT NULL,
Typ_platnosci VARCHAR2(20) CHECK (Typ_platnosci IN ('KARTA','GOTOWKA')) NOT NULL);

CREATE TABLE Skierowania(
Id_skierowania INT NOT NULL PRIMARY KEY,
Cel_porady VARCHAR2(250) NOT NULL,
Data DATE NOT NULL,
Typ_badania VARCHAR2(50) NOT NULL,
Wykonane_badania VARCHAR2(100) NOT NULL,
Telefon VARCHAR2(15) NOT NULL);

CREATE TABLE Choroby(
Id_choroby INT NOT NULL PRIMARY KEY,
Nazwa VARCHAR2(30) NOT NULL,
Objawy VARCHAR2(100) NOT NULL,
Opis_choroby VARCHAR2(100) NOT NULL,
Opis_leczenia VARCHAR2(100) NOT NULL,
Powiklania VARCHAR2(50) NOT NULL);

CREATE TABLE Wizyta(
Id_wizyty INT NOT NULL PRIMARY KEY,
Id_lekarstwa INT NOT NULL,
Id_skierowania INT NOT NULL,
Id_choroby INT NOT NULL,
Opis_Wizyty VARCHAR2(100) NOT NULL,
Data DATE NOT NULL,
Cena_wizyty INT CHECK(Cena_wizyty>=0) NOT NULL,
CONSTRAINT wiz_lek_fk FOREIGN KEY (Id_lekarstwa) REFERENCES Lekarstwa(Id_lekarstwa),
CONSTRAINT wiz_skier_fk FOREIGN KEY (Id_skierowania) REFERENCES Skierowania(Id_skierowania),
CONSTRAINT wiz_chor_fk FOREIGN KEY (Id_choroby) REFERENCES Choroby(Id_choroby));

CREATE TABLE Dzien(
Id_dzien INT NOT NULL PRIMARY KEY,
Dzien INT NOT NULL);

CREATE TABLE Miesiac(
Id_miesiac INT NOT NULL PRIMARY KEY,
Miesiac INT NOT NULL);

CREATE TABLE Rok(
Id_Rok INT NOT NULL PRIMARY KEY,
Rok INT NOT NULL);

CREATE TABLE Przyjecia(
Id_przyjecia INT NOT NULL PRIMARY KEY,
Id_dzien INT NOT NULL,
Id_miesiac INT NOT NULL,
Id_rok INT NOT NULL,
Godz_od INT NOT NULL,
Godz_do INT NOT NULL,
Dzien_wolny DATE NOT NULL,
CONSTRAINT przyj_dzien_fk FOREIGN KEY (Id_dzien) REFERENCES Dzien(Id_dzien),
CONSTRAINT przyj_miesiac_fk FOREIGN KEY (Id_miesiac) REFERENCES Miesiac(Id_miesiac),
CONSTRAINT przyj_rok_fk FOREIGN KEY (Id_rok) REFERENCES Rok(Id_rok));

CREATE TABLE Przychodnia(
Id_przychodni INT NOT NULL PRIMARY KEY,
Id_pracownika INT NOT NULL,
Id_wizyty INT NOT NULL,
Id_adresu INT NOT NULL,
Id_przyjecia INT NOT NULL,
Id_pacjenta INT NOT NULL,
Nazwa VARCHAR2(50) NOT NULL,
CONSTRAINT przych_prac_fk FOREIGN KEY (Id_pracownika) REFERENCES Pracownicy(Id_pracownika),
CONSTRAINT przych_wiz_fk FOREIGN KEY (Id_wizyty) REFERENCES Wizyta(Id_wizyty),
CONSTRAINT przych_adre_fk FOREIGN KEY (Id_adresu) REFERENCES Adresy(Id_adresu),
CONSTRAINT przych_przyj_fk FOREIGN KEY (Id_przyjecia) REFERENCES Przyjecia(Id_przyjecia),
CONSTRAINT przych_pacj_fk FOREIGN KEY (Id_pacjenta) REFERENCES Pacjenci(Id_pacjenta));
