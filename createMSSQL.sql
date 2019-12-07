CREATE TABLE dbo.Oddzial(
id_oddzialu INTEGER identity(1,1) NOT NULL,
nazwa VARCHAR(20) NOT NULL,
miasto VARCHAR(20) NOT NULL,
ulica VARCHAR(20) NOT NULL,
nr_budynku VARCHAR(5) NOT NULL,
CONSTRAINT PK_ODDZIAL PRIMARY KEY CLUSTERED  (id_oddzialu)   
) 

--Sala

CREATE TABLE dbo.Sala(
id_sali INTEGER identity(1,1) NOT NULL,
nr_sali VARCHAR(3)  NOT NULL,
typ_sali VARCHAR(10) NOT NULL,
cena_za_dzien Int NOT NULL,
id_oddzialu int FOREIGN KEY REFERENCES Oddzial(id_oddzialu),
CONSTRAINT PK_SALA PRIMARY KEY CLUSTERED  (id_sali)   
) 

--Pracownik

CREATE TABLE dbo.Pracownik(
id_pracownika INTEGER identity(1,1) NOT NULL,
imie VARCHAR(20) NOT NULL,
nazwisko VARCHAR(20) NOT NULL,
miasto VARCHAR(20) NOT NULL,
ulica VARCHAR(20) NOT NULL,
nr_domu VARCHAR(5) NOT NULL,
nr_mieszkania VARCHAR(5) NOT NULL,
id_oddzialu int FOREIGN KEY REFERENCES Oddzial(id_oddzialu),
constraint PK_PRACOWNIK primary key (id_pracownika)   
) 
