/* first example */
select * 
	from Academicians_table;
go

/* second example */
select Academicians_table.Academicians_full_name, Academicians_table.Academicians_date_of_birth 
	from Academicians_table;
go

/* third example */
select 'Academician ' + Academicians_table.Academicians_full_name + ', has a speciality: ' + Academicians_table.Academicians_specialization 
	as info 
	from Academicians_table;
go

/* fourth example */
select Academicians_table.Academicians_full_name, [In a year] = Academicians_table.Academicians_year_of_awarding_the_title + 1 
	from Academicians_table;
go

/* fifth example */
select distinct Academicians_table.Academicians_specialization 
	from Academicians_table;
go

/* sixth example */
select * 
	from Academicians_table 
	order by Academicians_table.Academicians_year_of_awarding_the_title;
go

/* seventh example */
select * 
	from Academicians_table 
	order by Academicians_table.Academicians_specialization DESC, 
		Academicians_table.Academicians_full_name ASC;
go

/* eighth example */
select top 2 * 
	from Academicians_table 
	order by Academicians_table.Academicians_full_name ASC;
go

/* ninth example */
select top 30 percent * 
	from Academicians_table 
	order by Academicians_table.Academicians_year_of_awarding_the_title;
go

/* tenth example */
select top 4 with ties * 
	from Academicians_table 
	order by Academicians_table.Academicians_year_of_awarding_the_title;
go

/* eleventh example */
select * 
	from Academicians_table 
	order by Academicians_table.Academicians_full_name 
		offset 2 rows;
go

/* twelfth example */
select * 
	from Academicians_table 
	order by Academicians_table.Academicians_full_name 
		offset 2 rows 
		fetch next 8 rows only;
go