/* first task */
create proc Task1
as
begin
	select
		@@Servername as Server,
		@@Version as [DBMS version],
		Db_Name() as [Database],
		User as [Database user],
		System_User as [System user],
		getdate() as [Time]
end;
go
/* NOTE: execute Task1 */

/* second task */
create proc Task2
as
begin
	select
		*
		from Countries
end;
go
/* NOTE: execute Task2 */

/* third task */
create proc Task3
	@Continent
		as nvarchar(50)
as
begin
	select
		*
		from Countries
	where Countries.Country_continent <> @Continent
end;
go
/* NOTE: execute Task3 'Африка' */

/* fourth task */
create proc Task4
	@Population_bottom
		as int,
	@Population_ceiling
		as int
as
begin
	select
		*
		from Countries
	where Countries.Country_population between @Population_bottom and @Population_ceiling
end;
go
/* NOTE: execute Task4 15, 1000000 */

/* fifth task */
create proc Task5
	@Letter
		as char
as
begin
	select
		*
		from Countries
	where charindex(Countries.Country_name, @Letter) = 0
end;
go
/* NOTE: execute Task5 'А' */

/* sixth task */
create proc Task6
	@Continent 
		as varchar(50) = 'Африка'
as
begin
	select top 5
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
	from Countries
	where Countries.Country_continent = @Continent
	order by Countries.Country_population desc
end;
go
/* NOTE: execute Task6 default */

/* seventh task */
create proc Task7 
as
begin
	select 
		Countries.Country_name,
		Countries.Country_capital,
		Countries.Country_area,
		Countries.Country_population,
		Countries.Country_continent
	into Countries_K
	from Countries
	where left(Countries.Country_name, 1) = 'K'
end;
go
/* NOTE: execute Task7 */

/* eighth task */
create proc Task8
as
begin
	declare 
		@Countries as int
	select
		@Countries = count(*)
	from Countries_K
	drop table Countries_K
	return @Countries
end;
go
/* NOTE: execute Task8 */

/* ninth task */
create proc Task9
	@Number as int,
	@Len as int output
as
begin
	set @Len = len(cast(@Number as varchar(100)))
end;
go
/* NOTE: 
declare @Len as int
execute Task9 500,  @Len output
print @Len
*/

/* tenth task */
create procedure AddRightDigit
    @D int,
    @K int output
as
begin
    if (@D < 0 OR @D > 9)
    begin
        raiserror('Цифра D должна быть в диапазоне от 0 до 9.', 16, 1);
    end
    set @K = (@K * 10) + @D;
end;
go
/* NOTE: 
declare @K as int = 10
execute AddRightDigit 7, @K output
print @K
*/

/* eleventh task */
create procedure InvDigit
    @K int output
as
begin
	declare @res as varchar(50)
	set @res = reverse(cast(@K as varchar(60)))
	set @K = cast(@res as int)
end;
go
/* NOTE: 
declare @K as int = 189
execute InvDigit @K output
print @K
*/

/* twelfth task */
create procedure Swap
    @First float output,
	@Second float output
as
begin
	declare @pocket as float
	set @pocket = @First
	set @First = @Second
	set @Second = @pocket
end;
go
/* NOTE: 
declare @First as float = 15.5
declare @Second as float = 16.2
execute Swap @First output, @Second output
print @First
print @Second
*/

/* thirteenth task */
create procedure SortInc
    @A float output,
    @B float output,
    @C float output
as
begin
    declare @t float;
    if @A > @B
    begin
        set @t = @A;
        set @A = @B;
        set @B = @t;
    end
    if @B > @C
    begin
        set @t = @B;
        set @B = @C;
        set @C = @t;
    end
    if @A > @B
    begin
        set @t = @A;
        set @A = @B;
        set @B = @t;
    end
end
go


/*
NOTE:
declare @A float = 13.2,
        @B float = 5.4,
        @C float = 9.1;

exec SortInc 
    @A = @A output,
    @B = @B output,
    @C = @C output;

print @A;
print @B;
print @C;
*/

/* fourteenth task */
create proc DigitCountSum
	@InputData as int,
	@count as int output,
	@sum as int output
as
begin
	set @count = 0
	set @sum = 0
	declare @tempK int = @InputData;
	while (@tempK <> 0)
    begin
        declare @digit int = @tempK % 10;
        set @sum = @sum + @digit;
        set @count = @count + 1;
        set @tempK = @tempK / 10; 
    end
end;
go

/*
NOTE:

declare @sum as int = 0
declare @count as int = 0
exec DigitCountSum 156, @count output, @sum output
print @count
print @sum
*/

/* fifteenth task */
create proc Task15
as
begin
	drop procedure Task1
	drop procedure Task2
	drop procedure Task3
	drop procedure Task4
	drop procedure Task5
	drop procedure Task6
	drop procedure Task7
	drop procedure Task8
	drop procedure Task9
	drop procedure AddRightDigit
	drop procedure InvDigit
	drop procedure Swap
	drop procedure SortInc
end;
go

/*
NOTE:

exec Task15
*/