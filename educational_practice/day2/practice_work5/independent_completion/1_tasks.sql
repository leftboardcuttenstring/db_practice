/* first example */
select 
	min(Countries.Country_area) 
		as Min_area 
	from Countries;
go

/* second example */
/*select
	max(Countries.Country_popultaion) as Max_population
	from Countries 
	where Countries.Country_continent = 'Северная Америка' 
		OR Countries.Country_continent = 'Южная Америка';
go*/

select
    max(case when Countries.Country_continent = 'Северная Америка' 
             then Countries.Country_popultaion end) 
				as Max_population_NA,
    max(case when Countries.Country_continent = 'Южная Америка' 
             then Countries.Country_popultaion end) 
				as Max_population_SA
from Countries;
go

/* third example */
select
	round(avg(cast(Countries.Country_popultaion as float)), 1) AS Average_value
	from Countries;
go

/* fourth example */
select 
    count(*) as Countries_count
	from Countries
	where Countries.Country_name like N'%ан'
		and Countries.Country_name not like N'%стан';
go

/* fifth example */
select 
	count(Countries.Country_continent)
	from Countries
	where Countries.Country_name like N'Р%';
go

/* sixth example */
select
	max(Countries.Country_area) / min(Countries.Country_area)
		as Different
	from Countries;
go

/* seventh example */
select
	Countries.Country_continent,
	count(Countries.Country_popultaion)
		as Quantity_of_countries
	from Countries
	where Countries.Country_popultaion > 100000000
	order by Quantity_of_countries;
go

/* eighth example */
select
	len(Countries.Country_name) as Quantity_of_characters
	from Countries
	order by Quantity_of_characters;
go

/* ninth example */
select distinct
	Countries.Country_continent
	from Countries;
go

/* tenth example */
select distinct
	Countries.Country_continent
	from Countries
	where max(Countries.Country_area) / min(Countries.Country_area) <= 10000;
go

/* eleventh example */
select
	avg(len(Countries.Country_name))
	from Countries
	where Countries.Country_continent = 'Африка';
go

/* twelfth example */
select distinct
	Countries.Country_continent
	from Countries
	where Countries.Country_popultaion > 1000000
		and Countries.Country_area / Countries.Country_popultaion > 30;
go
