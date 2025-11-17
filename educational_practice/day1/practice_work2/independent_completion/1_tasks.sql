/* first task */
select Academicians_table.Academicians_full_name, 
	   Academicians_table.Academicians_specialization, 
	   Academicians_table.Academicians_date_of_birth 
	from Academicians_table;
go

/* second task */
select Academicians_table.Academicians_full_name 
	   + ' got the title: ' 
	   + (cast(Academicians_table.Academicians_year_of_awarding_the_title as nvarchar(100))) 
	   as info 
	from Academicians_table;
go

/* third task */
select Academicians_table.Academicians_full_name, 
	   [In five years] = Academicians_table.Academicians_year_of_awarding_the_title + 5 
	from Academicians_table;
go

/* fourth task */
select distinct Academicians_table.Academicians_year_of_awarding_the_title 
	from Academicians_table;
go

/* fifth task */
select Academicians_table.Academicians_full_name, Academicians_table.Academicians_date_of_birth 
	from Academicians_table 
	order by Academicians_table.Academicians_date_of_birth desc;
go

/* sixth task */
select * 
	from Academicians_table 
	order by Academicians_table.Academicians_specialization desc, 
	Academicians_table.Academicians_year_of_awarding_the_title desc, 
	Academicians_table.Academicians_full_name asc;
go

/* seventh task */
select top 1 * 
	from Academicians_table 
	order by Academicians_table.Academicians_full_name;
go

/* eighth task */
select top 1 Academicians_table.Academicians_full_name
	from Academicians_table 
	order by Academicians_table.Academicians_year_of_awarding_the_title asc;
go

/* ninth task */
select top 10 percent * 
	from Academicians_table 
	order by Academicians_table.Academicians_full_name asc;
go

/* tenth task */
select top 5 with ties * 
	from Academicians_table 
	order by Academicians_table.Academicians_year_of_awarding_the_title;
go