/* first example */
create proc Example1
as
begin
	select
		@@Servername as Server,
		@@Version as [DBMS version],
		Db_Name() as [Database],
		User as [Database user],
		System_User as [System user]
end;
go

/*
NOTE:

execute Example1
*/

/* second example */
create proc Example2
as
begin
	select
		Countries.Country_name, 
		Countries.Country_capital
		from Countries
end;
go

/*
NOTE:

execute Example2
*/

/* third example */
create proc Example3
	@Continent 
		as varchar(50)
as
begin
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population
	from Countries
	where Countries.Country_continent = @Continent
end;
go

/*
NOTE:

execute Example3 'Азия'
*/

/* fourth example */
create proc Example4
	@A as float,
	@B as float
as
begin
	select
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
	from Countries
	where Countries.Country_area between @A and @B
end;
go

/*
NOTE:

execute Example4 1000, 10000
*/

/* fifth example */
create proc Example5
	@Letter 
		as char(1),
	@Quantity 
		as int output
as
begin
	select
		@Quantity = count(*)
	from Countries
	where charindex(@Letter, Countries.Country_name) > 0
end
declare @К as int
declare @Б as char(1)
set @Б = 'у'
execute Example5 @Б, @К output
select
	@К as [Quantity of countries];
go

/* sixth example */
create proc Example6
	@Continent 
		as varchar(50) = 'Европа'
as
begin
	select top 3
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
	from Countries
	where Countries.Country_continent = @Continent
	order by Countries.Country_area
end;
go

/*
NOTE:

execute Example6 default
*/

/* seventh example */
create proc Example7 
as
begin
	select 
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
	into Countries_U
	from Countries
	where left(Countries.Country_name, 1) = 'У'
end;
go

/*
NOTE:

execute Example7
*/

/* eighth example */
create proc Example8
as
begin
	declare 
		@Countries as int
	select
		@Countries = count(*)
	from Countries_U
	drop table Countries_U
	return @Countries
end

declare @C as int
execute @C = Example8
select 
	@C
		as [Number of bars in deleted table];
go