/* first example */
select 
	max(Countries.Country_area) 
		as Max_area 
	from Countries;
go

/* second example */
select
	min(Countries.Country_popultaion) as Min_population
	from Countries
	where Countries.Country_continent = 'Африка';
go

/* third example */
select
	sum(Countries.Country_popultaion) as Summ_population
	from Countries 
	where Countries.Country_continent = 'Северная Америка' 
		OR Countries.Country_continent = 'Южная Америка';
go

/* fourth example */
select
	round(avg(cast(Countries.Country_popultaion as float)), 2) AS Average_value
	from Countries
	where Countries.Country_continent != 'Европа';
go

/* fifth example */
select
	count(*) as Quantity
	from Countries
	where left(Countries.Country_name, 1) = 'С';
go

/* sixth example */
select
	count(distinct Countries.Country_continent) as Quantity_of_continents
	from Countries;
go

/* seventh example */
select
	max(Countries.Country_popultaion) - min(Countries.Country_popultaion) as Different
	from Countries;
go

/* eighth example */
select
	Countries.Country_continent, 
	count(Countries.Country_name) 
		as Quantity_of_countries
	from Countries
	group by Countries.Country_continent
	order by Quantity_of_countries desc;
go

/* ninth example */
select
	left(Countries.Country_name, 1) as First_character,
	count(Countries.Country_name) as Quantity_of_countries
	from Countries
	group by left(Countries.Country_name, 1)
	order by First_character;
go

/* tenth example */
select
	Countries.Country_continent, 
	avg(cast(Countries.Country_popultaion as float) / Countries.Country_area) as Average_area
	from Countries
	group by Countries.Country_continent
	having avg(cast(Countries.Country_popultaion as float) / Countries.Country_area) > 100;
go

/* eleventh example */
select
	Countries.Country_continent, 
	case
	when Countries.Country_continent in ('Европа', 'Азия') 
		then floor(sum(Countries.Country_popultaion) * 1.2)
	when Countries.Country_continent in ('Северная Америка', 'Африка') 
		then floor(sum(Countries.Country_popultaion) * 1.5)
	else floor(sum(Countries.Country_popultaion) * 1.7)
	end as Summ_population
	from Countries
	group by Countries.Country_continent;
go

/* twelfth example */
select
	Countries.Country_continent
	from Countries
	group by Countries.Country_continent
	having max(Countries.Country_popultaion) <= 1000 * min(Countries.Country_popultaion);
go

/* thirteenth example */
select
	count(*) 
		as Quantity
	FROM Countries
	WHERE Countries.Country_capital is null;
go

/* fourteenth example */
select
	max(len(Countries.Country_name)) as Long_country_name, 
	max(len(Countries.Country_capital)) as Long_capital_name,
	min(len(Countries.Country_name)) as Short_country_name,
	min(len(Countries.Country_capital)) as Short_capital_name
	from Countries;
go

/* fifteenth example */
select
	Countries.Country_continent,
	avg(cast(Countries.Country_popultaion as float) / Countries.Country_area) 
		as Density
	from Countries
	where Countries.Country_area > 1000000
	group by Countries.Country_continent
	having avg(cast(Countries.Country_popultaion as float) / Countries.Country_area) > 30
	order by Density desc
go