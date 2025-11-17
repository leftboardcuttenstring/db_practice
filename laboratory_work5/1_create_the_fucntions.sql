create function func_1_func()
returns nvarchar(50)
as
begin
	declare @result nvarchar(50)
	if datalength(host_name()) > 9
		set @result = left(host_name(), 6);
	else
		set @result = host_name()
	return @result
end
go

create function func_2_func(@num int)
returns int
as
begin 
	declare @cnt int
	if (@num = 0)
		set @cnt = 1
	else
	begin
		set @cnt = 0
		while (@num <> 0)
		begin
			set @cnt = @cnt + 1;
			set @num = @num / 10;
		end
	end
	return @cnt
end
go

create function Access_check_func(
    @Schema_and_table sysname,
    @Column sysname
)
returns int
as
begin
    declare @Result int;
    select @Result = has_perms_by_name(@Schema_and_table, @Column, 'select');
    return @Result;
end
go

/*

declare @res int;

select @res = dbo.Access_check_func('dbo.MyTable', 'MyColumn');

if (@res = 1)
    print 'You have access';
else
    print 'You don''t have access';

*/
create function Pounds_to_kilogramms_func(@Pounds float)
returns nvarchar(100)
as
begin
    declare @grams float = @pounds * 453.6;
    declare @kg int = floor(@grams / 1000);
    declare @g int = round(@grams - @kg * 1000, 0);
    declare @result nvarchar(100);

    set @result = cast(@pounds as nvarchar(10)) + ' pounds are ' 
        + cast(@kg as nvarchar(10)) + ' kg ' 
        + cast(@g as nvarchar(10)) + ' g';

    return @result;
end
go
/*
NOTE:

select dbo.Pounds_to_kilogramms_func(3.3)
*/

create function Names_info_func()
returns nvarchar(300)
as
begin
    declare @server nvarchar(100) = @@servername;
    declare @login nvarchar(100) = suser_sname();
    declare @user nvarchar(100) = user_name();
    declare @result nvarchar(300);

    set @result = 'You logged in ' + @server + ' as ' + @login 
        + ' with ' + @user + ' permissions.';

    return @result;
end
go
/*
NOTE:

select dbo.Names_info_func()
*/

create function Get_sql_server_uptime_func()
returns varchar(100)
as
begin
    declare @StartDate datetime
    declare @Minutes int
    declare @Hours int
    declare @RemainingMinutes int
    declare @Result varchar(100)
    select @StartDate = sqlserver_start_time from sys.dm_os_sys_info
    set @Minutes = datediff(minute, @StartDate, getdate())
    set @Hours = @Minutes / 60
    set @RemainingMinutes = @Minutes % 60
    set @Result = 'Elapsed time since SQL Server started: ' +
                  cast(@Hours as varchar(10)) + ' h. ' +
                  cast(@RemainingMinutes as varchar(10)) + ' m.'
    return @Result
end
go
/*
NOTE:

select dbo.Get_sql_server_uptime_func()
*/

create function Is_current_year_leap_func()
returns varchar(50)
as
begin
    declare @Year int = year(getdate())
    declare @Result varchar(50)
    if ((@Year % 4 = 0 and @Year % 100 <> 0) or (@Year % 400 = 0))
        set @Result = 'Current year ' + cast(@Year as varchar(10)) + ' — is leap.'
    else
        set @Result = 'Current year ' + cast(@Year as varchar(10)) + ' — is not leap.'
    return @Result
end
go
/*
NOTE:

select Is_current_year_leap_func()
*/

create function Sum_numbers_in_string_func(@Input varchar(200))
returns int
as
begin
    declare @Sum int = 0
    declare @Pos int = 1
    declare @Num varchar(10) = ''
    while @Pos <= len(@Input)
    begin
        if substring(@Input, @Pos, 1) like '[0-9]'
            set @Num = @Num + substring(@Input, @Pos, 1)
        else
        begin
            if len(@Num) > 0
            begin
                set @Sum = @Sum + cast(@Num as int)
                set @Num = ''
            end
        end
        set @Pos = @Pos + 1
    end
    if len(@Num) > 0
        set @Sum = @Sum + cast(@Num as int)

    return @Sum
end
go
/*
NOTE:

select Sum_numbers_in_string_func('revolution will not be televised')
*/

create function Telegram_cost_func(@Text varchar(500))
returns varchar(100)
as
begin
    declare @WordCount int
    declare @Rubles int
    declare @Kopecks int
    declare @TotalKopecks int
    declare @Result varchar(100)
    set @Text = ltrim(rtrim(replace(replace(@Text, '.', ''), '  ', ' ')))
    set @WordCount = (len(@Text) - len(replace(@Text, ' ', ''))) + 1
    set @TotalKopecks = @WordCount * 33
    set @Rubles = @TotalKopecks / 100
    set @Kopecks = @TotalKopecks % 100
    set @Result = 'Quantity of words: ' + cast(@WordCount as varchar(10)) + 
                  ', price = ' + cast(@Rubles as varchar(10)) + ' rub. ' + 
                  cast(@Kopecks as varchar(10)) + ' kop.'
    return @Result
end
go
/*
NOTE:

select Sum_numbers_in_string_func('revolution will not be televised')
*/

create function Caesar_encrypt(@Text varchar(200), @Shift int)
returns varchar(200)
as
begin
    declare @Result varchar(200) = ''
    declare @i int = 1
    declare @ch char(1)
    declare @code int
    while @i <= len(@Text)
    begin
        set @ch = substring(@Text, @i, 1)
        if @ch like '[A-Z]'
            set @Result = @Result + char(((ascii(@ch) - 65 + @Shift) % 26) + 65)
        else if @ch like '[a-z]'
            set @Result = @Result + char(((ascii(@ch) - 97 + @Shift) % 26) + 97)
        else
            set @Result = @Result + @ch
        set @i = @i + 1
    end
    return @Result
end
go
/*
NOTE:

select Sum_numbers_in_string_func('revolution will not be televised', 3)
*/

create function Personality_number(@FullName varchar(100))
returns int
as
begin
    declare @i int = 1
    declare @ch char(1)
    declare @sum int = 0
    declare @num int
    set @FullName = upper(@FullName)
    while @i <= len(@FullName)
    begin
        set @ch = substring(@FullName, @i, 1)
        if @ch like '[A-Z]'
            set @sum = @sum + (ascii(@ch) - 64)
        set @i = @i + 1
    end
    while @sum > 9
        set @sum = (@sum / 10) + (@sum % 10)

    return @sum
end
go
/*
NOTE:

select Personality_number('Ivenov Ivan Ivanovich')
*/