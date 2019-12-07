DECLARE @index INT
DECLARE @index1 INT
DECLARE @index2 INT
DECLARE @index3 INT
Declare @Nazwa varchar(30)
Declare @Nazwa_oddzialu varchar(30)
Declare @Ulica varchar(30)
Declare @Nr_budynku int
Declare @Kod_pocztowy int
Declare @Miasto varchar(30)
Declare @NIP1 int

Declare @Numer_sali int
Declare @Typ_sali varchar(30)
Declare @cena_za_dzien int
Declare @id_oddzialu int

Declare @Imie varchar(30)
Declare @Nazwisko varchar(30)
Declare @PESEL int
Declare @Telefon int

Declare @Limit1DWN int
Declare @Limit1UP int

Set @Limit1DWN = 100001
Set @Limit1UP = 250000

Declare @Lowerlimit2 int
Declare @Uplimit2 int

Set @Lowerlimit2 = 1
Set @Uplimit2 = 550


Declare @count int
Set @count = 1

While @count <= 500000
Begin 

   Set  @index = CAST(RAND() * 6 + 1 AS INT)
   Set  @index1 = CAST(RAND() * 5 + 1 AS INT)
   Set  @index2 = CAST(RAND() * 5 + 1 AS INT)
   Set  @index3 = CAST(RAND() * 5 + 1 AS INT)
   Select @Nazwa = CHOOSE(@index,'Adam','Stefania','Marek','Karolina','Tomasz', 'Marian' )
   Select @Nazwa_oddzialu = CHOOSE(@index1,'Chirurgia','Ortopedia','Traumatologia','OIOM','Kardiologia')
   Select @Ulica = CHOOSE(@index2,'Mala','Markowska','Wojskowa','Polowa','Lacznosci')
   Select @Nr_budynku = Round(((@Uplimit2 - @Lowerlimit2) * Rand()) + @Lowerlimit2, 0)
   Select @Miasto = CHOOSE(@index3,'Warszawa','Gdansk','Krakow', 'Czestochowa', 'Goldap')
   

   Select @Numer_sali = Round(((@Uplimit2 - @Lowerlimit2) * Rand()) + @Lowerlimit2, 0)
   Select @Typ_sali = CHOOSE(@index2,'jedynka','dwojka','trojka','czworka','vip')
   Select @cena_za_dzien = Round(((@Uplimit2 - @Lowerlimit2) * Rand()) + @Lowerlimit2, 0)
   Select @id_oddzialu = Round(((@Limit1UP - @Limit1DWN) * Rand()) + @Limit1DWN, 0)

   Select @Imie = CHOOSE(@index3, 'Adam','Stefania','Marek','Karolina','Tomasz', 'Marian')
   Select @Nazwisko = CHOOSE(@index1,'Lupa','Trzask','Kowal','Nowak','Mazur')
   


   --Insert Into Oddzial (nazwa,miasto,ulica,nr_budynku) values (@Nazwa_oddzialu, @Miasto, @Ulica,@Nr_budynku)
   Insert Into Pracownik (imie,nazwisko,miasto,ulica,nr_domu,nr_mieszkania,id_oddzialu) values (@Imie, @Nazwisko, @Miasto,@Ulica, @Nr_budynku,@Nr_budynku,@id_oddzialu)
   --Insert Into Sala (nr_sali,typ_sali,cena_za_dzien,id_oddzialu) values (@Numer_sali, @Typ_sali, @cena_za_dzien, @id_oddzialu)
   Print @count
   Print @Nazwa
   Set @count = @count + 1
End
