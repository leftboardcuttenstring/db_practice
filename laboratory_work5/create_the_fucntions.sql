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

create function Access_check_func(@Schema_and_table sysname, @Column sysname)
returns int
as
begin
	declare @Result int
	select @Result = has_perms_by_name(@Schema_and_table, @Column, 'select')
	if (@Result = 1)
	begin
		print 'You have an access'
	end
	else
	begin
		print 'You dont have an access'
	end
	return @Result
end
go

create function Pounds_to_kilogramms_func(@Pounds float)
returns int
as
begin
	declare @grams float = @pounds * 453.6;
	declare @kg int = floor(@grams / 1000);
	declare @g int = round(@grams - @kg * 1000, 0);
	print cast(@pounds as varchar(10)) + ' pounds are ' 
	    + cast(@kg as varchar(10)) + ' kg ' + cast(@g as varchar(10)) + ' g';
	return 0
end
go
/**/

create function Names_info_func()
returns int
as
begin
	declare @server nvarchar(100) = @@servername;
	declare @login nvarchar(100) = suser_sname();
	declare @user nvarchar(100) = user_name();
	print 'You logged in ' + @server + ' as ' + @login 
      + ' with ' + @user + ' permissions.';
	return 0
end
go
/**/

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
    set @Result = 'С момента запуска SQL Server прошло ' +
                  cast(@Hours as varchar(10)) + ' ч. ' +
                  cast(@RemainingMinutes as varchar(10)) + ' мин.'
    return @Result
end
go
/**/

create function Is_current_year_leap_func()
returns varchar(50)
as
begin
    declare @Year int = year(getdate())
    declare @Result varchar(50)
    if ((@Year % 4 = 0 and @Year % 100 <> 0) or (@Year % 400 = 0))
        set @Result = 'Текущий год ' + cast(@Year as varchar(10)) + ' — високосный.'
    else
        set @Result = 'Текущий год ' + cast(@Year as varchar(10)) + ' — невисокосный.'
    return @Result
end
go
/**/

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
/**/

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
    set @Result = 'Количество слов: ' + cast(@WordCount as varchar(10)) + 
                  ', стоимость = ' + cast(@Rubles as varchar(10)) + ' руб. ' + 
                  cast(@Kopecks as varchar(10)) + ' коп.'
    return @Result
end
go
/**/

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
/**/

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
/**/
