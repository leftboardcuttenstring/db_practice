create function Count_substring_occurrences_func(@InputString varchar(200), @Substring varchar(50))
returns int
as
begin
    declare @Count int = 0
    declare @Pos int = 1
    declare @SubLen int = len(@Substring)
    if @SubLen = 0 or @InputString is null or @Substring is null
        return 0
    while @Pos > 0
    begin
        set @Pos = charindex(@Substring, @InputString)
        if @Pos > 0
        begin
            set @Count = @Count + 1
            set @InputString = substring(@InputString, @Pos + @SubLen, len(@InputString))
        end
    end
    return @Count
end
go
/*
NOTE:

select dbo.Count_substring_occurrences_func('abababa', 'aba')
*/

create function Convert_full_name_to_initials_func(@FullName varchar(100))
returns varchar(100)
as
begin
    declare @Surname varchar(50)
    declare @Name varchar(50)
    declare @Patronymic varchar(50)
    declare @Result varchar(100)
    declare @Pos1 int
    declare @Pos2 int
    set @Pos1 = charindex(' ', @FullName)
    set @Pos2 = charindex(' ', @FullName, @Pos1 + 1)
    if @Pos1 = 0 or @Pos2 = 0
        return @FullName
    set @Surname = substring(@FullName, 1, @Pos1 - 1)
    set @Name = substring(@FullName, @Pos1 + 1, @Pos2 - @Pos1 - 1)
    set @Patronymic = substring(@FullName, @Pos2 + 1, len(@FullName) - @Pos2)
    set @Result = @Surname + ' ' + substring(@Name, 1, 1) + '.' + substring(@Patronymic, 1, 1) + '.'
    return @Result
end
go
/*
NOTE:

select dbo.Convert_full_name_to_initials_func('Ivanov Ivan Ivanovich')
*/

create function Get_days_in_current_year_func()
returns int
as
begin
    declare @CurrentYear int
    declare @StartOfYear date
    declare @StartOfNextYear date
    declare @DaysInYear int
    set @CurrentYear = year(getdate())
    set @StartOfYear = datefromparts(@CurrentYear, 1, 1)
    set @StartOfNextYear = datefromparts(@CurrentYear + 1, 1, 1)
    set @DaysInYear = datediff(day, @StartOfYear, @StartOfNextYear)
    return @DaysInYear
end
go
/*
NOTE:

select Get_days_in_current_year_func()
*/

create function Get_current_date_parts()
returns @DateParts table
(
    [Day] int,
    [Month] int,
    [Year] int,
    [Hour] int,
    [Minute] int,
    [Second] int
)
as
begin
    declare @Now datetime = getdate()
    insert into @DateParts
    select 
        day(@Now) as [Day],
        month(@Now) as [Month],
        year(@Now) as [Year],
        datepart(hour, @Now) as [Hour],
        datepart(minute, @Now) as [Minute],
        datepart(second, @Now) as [Second]
    return
end
go
/*
NOTE:

select* from Get_current_date_parts()
*/

create function Get_month_borders()
returns @MonthBorders table
(
    [First day] date,
    [Last day] date
)
as
begin
    declare @Now date = getdate()
    declare @FirstDay date
    declare @LastDay date
    set @FirstDay = datefromparts(year(@Now), month(@Now), 1)
    set @LastDay = eomonth(@Now)
    insert into @MonthBorders
    values (@FirstDay, @LastDay)
    return
end
go
/*
NOTE:

select * from dbo.Get_month_borders()
*/