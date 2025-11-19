/* first example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area > 1000000
	union
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_population > 100000000;
go

/* second example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area > 1000000
	union all
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_population > 100000000;
go

/* third example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_continent = 'Европа'
		and cast(Countries.Country_population as float) / Countries.Country_area > 400
	union
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_continent = 'Азия'
			and cast(Countries.Country_population as float) / Countries.Country_area > 300
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_continent = 'Африка'
			and cast(Countries.Country_population as float) / Countries.Country_area > 200
	order by Countries.Country_continent;
go

/* fourth example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area > 1000000
	except
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_population > 100000000;
go

/* fifth example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area > 1000000
	intersect
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_population > 100000000;
go
