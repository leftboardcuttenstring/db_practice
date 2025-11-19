/* first task */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent,
	round(cast(Countries.Country_area as float) * 100 /
		(select
			sum(Countries.Country_area)
			from Countries), 3) 
				as Procent
		from Countries
	order by Procent desc;
go

/* second task */
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
	from Countries
	where Countries.Country_area / Countries.Country_population > 
	(select
		avg(Countries.Country_population)
		from Countries);
go

/* third task */
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
		where Countries.Country_continent = 'Европа') A
	where A.Country_population < 5000000;
go

/* fourth task */
select
    A.Country_name,
    A.Country_capital,
    A.Country_area,
    A.Country_population,
    A.Country_continent,
	round(cast(A.Country_area as float) * 100 / (
		select
			sum(B.Country_area)
			from Countries B
		where A.Country_continent = B.Country_continent), 3
		) 
			as Procent
	from Countries A
	order by Procent desc;
go

/* fifth task */
select
    A.Country_name,
    A.Country_capital,
    A.Country_area,
    A.Country_population,
    A.Country_continent
	from Countries A
	where A.Country_area > (
		select
			avg(B.Country_area
		)
		from Countries B
		where B.Country_continent = A.Country_continent);
go

/* sixth task */
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
		having avg(Countries.Country_population / Countries.Country_population) > (
				select
				avg(Countries.Country_population / Countries.Country_population)
				from Countries
			)
		);
go

/* seventh task */
select
    Countries.Country_name,
    Countries.Country_capital,
    Countries.Country_area,
    Countries.Country_population,
    Countries.Country_continent
	from Countries
	where Countries.Country_continent = 'Южная Америка' 
		and Countries.Country_population > all (
			select Countries.Country_population
			from Countries
			where Countries.Country_continent = 'Африка'
		);
go

/* eighth task */
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

/* ninth task */
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
					and Countries.Country_area > 2000000
		);
go

/* tenth task */
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
			where Countries.Country_name = 'Фиджи'
	);
go

/* eleventh task */
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
			where Countries.Country_name = 'Фиджи'
	);
go

/* twelfth task */
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
				min(Countries.Country_area) as Minimal_population
				from Countries
			) A
	);
go

