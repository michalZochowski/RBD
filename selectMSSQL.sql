select 
imie as 'Imie', 
nazwisko as 'Nazwisko', 
Pracownik.miasto+ ' '  + Pracownik.ulica + ' ' + cast(Pracownik.nr_mieszkania as varchar(2)) as 'Adres pracownika' ,
h.id_oddzialu,
h.nazwa as 'Nazwa oddzialu',
count(id_sali) as 'Liczba rekordow id_sali'
from Pracownik 
left join Oddzial o  on o.id_oddzialu=Pracownik.id_oddzialu
left join Sala s on s.id_oddzialu=o.id_oddzialu
where 
	o.id_oddzialu>5 and 
	s.id_sali>5 and 
	s.cena_za_dzien>200
group by 
		Pracownik.imie,
		o.nazwa,
		Pracownik.nazwisko,
		o.id_hotelu,
		o.nazwa,
		Pracownik.miasto,
		Pracownik.ulica,
		Pracownik.nr_mieszkania,
		s.id_sali,
		s.cena_za_dzien
having o.nazwa='Chirurgia' or o.nazwa='Ortopedia' or o.nazwa='Traumatologia' or o.nazwa='OIOM'

order by 
	o.id_oddzialu ASC,
	s.id_sali DESC,
	s.cena_za_dzien ASC
