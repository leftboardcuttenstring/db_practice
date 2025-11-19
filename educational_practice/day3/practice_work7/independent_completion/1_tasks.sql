/* first task */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area < 500
	union
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_area > 5000000;
go

/* second task */
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
		where Countries.Country_population < 1000000000;
go

/* third task */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area < 500
	intersect
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
		from Countries
		where Countries.Country_population < 100000;
go