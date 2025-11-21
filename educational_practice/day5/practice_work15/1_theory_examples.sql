/* first example */
create view View1
as
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
from Countries
where Countries.Country_population < 1000000
	AND Countries.Country_area > 100000;
go

select
	View1.Country_name,
	View1.Country_capital,
	View1.Country_area,
	View1.Country_population,
	View1.Country_continent
from View1;
go

/* second example */
create view View2 (
	View2_Continent,
	View2_Area,
	View2_Population
)
as
select
	Countries.Country_continent,
	SUM(Countries.Country_area),
	SUM(Countries.Country_population)
from Countries
group by Countries.Country_continent;
go

select
	View2_Continent,
	View2_Area,
	View2_Population
from View2;
go

/* fifth example */
declare @Example5 table
(
	Example5_name varchar(50),
	Example5_capital varchar(50),
	Example5_area float,
	Example5_population bigint,
	Example5_continent varchar(50)
);

insert into @Example5
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
from Countries
where Countries.Country_area * 1000 < 
	(select 
		avg(Countries.Country_area)
	from Countries
)

select 
	Country.Example5_name,
	Country.Example5_capital,
	Country.Example5_area,
	Country.Example5_population,
	Country.Example5_continent
from @Example5 as Country;
go

/* seventh example */
create table ##Example7
(
	##Example7_name varchar(50),
	##Example7_density float
)
insert into
##Example7
(##Example7.##Example7_name, ##Example7.##Example7_density)
select
	Countries.Country_name,
	round(Countries.Country_population / Countries.Country_area, 0) as Density
from Countries
select 
	* 
from ##Example7
--drop table #Example6

