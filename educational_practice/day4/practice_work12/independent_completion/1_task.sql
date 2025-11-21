/* 1 task */
create function Задание1
(
	@Capital nvarchar(50)
)
returns nvarchar(50)
as
begin
	declare @Name nvarchar(50)

	select 
		@Name = Countries.Country_name
		from Countries
		where Countries.Country_capital = @Capital

	return @Name
end
go

select dbo.Задание1(N'Вена') as Result;
go



/* 2 task */
create function Задание2
(
	@Population float
)
returns float
as
begin
	declare @R float
	set @R = round(@Population / 1000000.0, 3)
	return @R
end
go

select 
	Countries.Country_name,
	Countries.Country_population,
	dbo.Задание2(Countries.Country_population) as Population_mln
	from Countries;
go



/* 3 task */
create function Задание3
(
	@Cont nvarchar(20)
)
returns float
as
begin
	declare @P float

	select 
		@P = round(sum(cast(Country_population as float)) / sum(Country_area), 4)
		from Countries
		where Countries.Country_continent = @Cont

	return @P
end
go

select dbo.Задание3(N'Европа') as Density_Europe;
go



/* 4 task */
create function Задание4()
returns nvarchar(50)
as
begin
	declare @ThirdPop bigint
	declare @Name nvarchar(50)

	select top 1 
		@ThirdPop = Country_population
		from (
			select distinct top 3 Country_population
				from Countries
				order by Country_population desc
		) as T
		order by Country_population asc

	select 
		@Name = Country_name
		from Countries
		where Country_population = @ThirdPop

	return @Name
end
go

select dbo.Задание4() as Third_by_population;
go



/* 5 task */
create function Задание5
(
	@Cont nvarchar(20) = N'Азия'
)
returns nvarchar(50)
as
begin
	declare @MaxPop bigint
	declare @Name nvarchar(50)

	select 
		@MaxPop = max(Country_population)
		from Countries
		where Country_continent = @Cont

	select 
		@Name = Country_name
		from Countries
		where Country_continent = @Cont
			and Country_population = @MaxPop

	return @Name
end
go

select dbo.Задание5(N'Африка') as Max_in_Africa;
select dbo.Задание5(default) as Max_in_Asia;
go

/* 6 task */
create function Задание6
(
	@S nvarchar(50)
)
returns nvarchar(50)
as
begin
	declare @L int = len(@S)

	-- Если слишком короткая строка
	if @L <= 3 return @S

	declare @RightLen int = @L - 6   -- первые 2 + 'тест' (4 символа)

	if @RightLen < 0 
		set @RightLen = 0

	return 
		left(@S, 2)
		+ N'тест'
		+ right(@S, @RightLen)
end
go

/* 7 task */
create function Задание7
(
	@C nchar(1)
)
returns int
as
begin
	declare @K int

	select 
		@K = count(*)
		from Countries
		where charindex(@C, Country_name) = 0

	return @K
end
go

select dbo.Задание7(N'а') as Not_contains_a;
go



/* 8 task */
create function Задание8
(
	@X int
)
returns table
as
return
(
	select
		Country_name,
		Country_capital,
		Country_area,
		Country_population,
		Country_continent
		from Countries
		where Country_area < @X
)
go

select * from dbo.Задание8(50000);
go

/* 9 task */
create function Задание9
(
	@A bigint,
	@B bigint
)
returns table
as
return
(
	select
		Country_name,
		Country_capital,
		Country_area,
		Country_population,
		Country_continent
		from Countries
		where Country_population between @A and @B
)
go

select * from dbo.Задание9(2000000, 10000000);
go

/* 10 task */
create function Задание10()
returns @T table
(
	Cont nvarchar(20),
	PopSum bigint
)
as
begin
	insert into @T
		select 
			Country_continent,
			sum(Country_population)
			from Countries
			group by Country_continent

	return
end
go

select * from dbo.Задание10();
go

/* 11 task */
create function IsPalindrom
(
	@P int
)
returns int
as
begin
	if @P <= 0 return 0

	declare @S nvarchar(20) = cast(@P as nvarchar(20))

	if @S = reverse(@S)
		return 1

	return 0
end
go

select dbo.IsPalindrom(12321) as Test_Palindrome;
go

/* 12 task */
create function Quarter
(
	@x float,
	@y float
)
returns int
as
begin
	if @x > 0 and @y > 0 return 1
	if @x < 0 and @y > 0 return 2
	if @x < 0 and @y < 0 return 3
	if @x > 0 and @y < 0 return 4
	return 0
end
go

select dbo.Quarter(5, -2) as Quarter_of_point;
go

/* 13 task */
create function IsPrime
(
	@N int
)
returns int
as
begin
	if @N <= 1 return 0
	if @N = 2 return 1
	if @N % 2 = 0 return 0

	declare @i int = 3
	while @i * @i <= @N
	begin
		if @N % @i = 0 return 0
		set @i = @i + 2
	end

	return 1
end
go

select dbo.IsPrime(19) as Test_prime;
go

/* 14 task */
drop function if exists 
	Задание1,
	Задание2,
	Задание3,
	Задание4,
	Задание5,
	Задание6,
	Задание7,
	Задание8,
	Задание9,
	Задание10,
	IsPalindrom,
	Quarter,
	IsPrime;
go
