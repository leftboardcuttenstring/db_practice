/* first example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent,
	round(cast(Countries.Country_population as float) * 100 /
		(select
			sum(Countries.Country_population)
			from Countries), 3) 
				as Procent
		from Countries
	order by Procent desc;
go

/* second example */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area > 
	(select
		avg(Countries.Country_population)
		from Countries);
go

/* third example */
select
    A.Country_name,
    A.Country_capital,
    A.Country_area,
    A.Country_population,
    A.Country_continent
	from (
		select
			Countries.Country_name,
			Countries.Country_capital,
			Countries.Country_area,
			Countries.Country_population,
			Countries.Country_continent
		from Countries
		where Countries.Country_continent = 'Африка') A
	where A.Country_population > 50000000;
go

/* fourth example */
select
    A.Country_name,
    A.Country_capital,
    A.Country_area,
    A.Country_population,
    A.Country_continent,
	round(cast(A.Country_population as float) * 100 /
		(select
			sum(B.Country_population)
			from Countries B
		WHERE A.Country_continent = B.Country_continent), 3) 
			as Procent
	from
	Countries A
	order by
	Procent desc;
go

/* fifth example */
select
    A.Country_name,
    A.Country_capital,
    A.Country_area,
    A.Country_population,
    A.Country_continent
	from Countries A
	where A.Country_population > (
		select
			avg(B.Country_population)
		from Countries B
		where B.Country_continent = A.Country_continent);
go

/* sixth example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent in 
		(select 
			Countries.Country_continent
		from Countries
		group by Countries.Country_continent
		having avg(Countries.Country_population) > 
			(select
				avg(Countries.Country_population)
				from Countries
			)
		);
go

/* seventh example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent = 'Азия' 
		and Countries.Country_population > all (
			select Countries.Country_population
			from Countries
			where Countries.Country_continent = 'Европа'
		);
go

/* eighth example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent = 'Азия'
		and Countries.Country_population > any (
			select Countries.Country_population
			from Countries
			where Countries.Country_continent = 'Южная Америка'
		);
go

/* ninth example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent = 'Африка'
		and exists 
			(select
				*
				from Countries
				where Countries.Country_continent = 'Африка'
					and Countries.Country_population > 100000000
		);
go

/* tenth example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent = 
		(select
			Countries.Country_continent
			from Countries
			where Countries.Country_name = 'Науру'
	);
go

/* eleventh example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_population !> 
		(select
			Countries.Country_population
			from Countries
			where Countries.Country_name = 'Гондурас'
	);
go

/* twelfth example */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_population = 
		(select
			max(Minimal_population)
			from
			(select
				min(Countries.Country_population) as Minimal_population
				from Countries
			) A
	);
go
