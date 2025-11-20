/* first example */
declare @a int, 
	@b int, 
	@c int
set @a = 5
set @b = 10
set @c = @a + @b
print @c;
go

/* second example */
declare @licey float, 
	@gimn float, 
	@diff float
set @licey = 
	(select
		max(Students_table.Student_score)
		from Students_table
		where Students_table.Student_school = N'Лицей'
	)
set @gimn = 
	(select
		max(Students_table.Student_score)
		from Students_table
		where Students_table.Student_school = N'Гимназия'
	)
set @diff = abs(@licey - @gimn)
print @diff;
go

/* third example */
declare @maxp float, 
	@minp float, 
	@diff float
select
	@maxp = max(Students_table.Student_score),
	@minp = min(Students_table.Student_score)
	from Students_table
	set @diff = @maxp - @minp
print @diff;
go

/* fourth example */
declare @a int = rand() * 1000,	
	@b int
set @b = square(@a)
print @b;
go

/* fifth example */
declare @a int = rand() * 100, 
	@b int = rand() * 100
if @a > @b
	print '@a = ' + cast(@a as varchar(3))
else
	print '@b = ' + cast(@b as varchar(3));
go

/* sixth example */
declare @a int = rand() * 100
if @a % 3 = 0
	print cast(@a as varchar(3)) + ' делится на 3'
else
	print cast(@a as varchar(3)) + ' не делится на 3';
go

/* seventh example */
declare @a int = rand() * 1000
while @a % 3 = 0
	set @a = @a / 3
if @a = 1
	print 'Да'
else
	print 'Нет';
go

/* eighth example */
declare @a int = rand() * 1000, 
	@b int = rand() * 1000
print '@a = ' + cast(@a as varchar(4))
print '@b = ' + cast(@b as varchar(4))
while @a != @b
begin
	if @a > @b
		set @a = @a - @b
	else
		set @b = @b - @a
end
print 'НОД = ' + cast(@a as varchar(4));
go

/* ninth example */
declare @a int = 5, 
	@b int = 10, 
	@s int = 0
while @a <= @b
begin
	set @s = @s + @a
	set @a = @a + 1
end
print 'Сумма = ' + cast(@s as varchar(5));
go

/* tenth example */
declare @N int = rand() * 10, 
	@M int = 1, 
	@S int = 0
while @M <= 2 * @N - 1
begin
	set @S = @S + @M
	print @S
	set @M = @M + 2
end;
go

/* eleventh example */
declare @A int = rand() * 5, 
	@C int = 1
declare @B int = @A + rand() * 5
print '@A = ' + cast(@A AS CHAR(1)) 
	+ ', @B = ' + cast(@B AS CHAR(1))
while @A <= @B
begin
	print REPLICATE(@A, @C)
	set @A = @A + 1
	set @C = @C + 1
end;
go

/* twelfth example */
declare @A int = 10
while @A < 100
begin
	if (@A % 4 = 0) and (@A % 6 != 0)
	print @A
	set @A = @A + 1
end;
go

/* thirteenth example */
declare @D int = 31, 
	@M int = 12
set @D = case
	when @M in (1, 3, 5, 7, 8, 10, 12) and @D = 31 then 1
	when @M in (4, 6, 9, 11) and @D = 30 then 1
	when @M = 2 and @D = 29 then 1
	else @D + 1
end
set @M = case
	when @D = 1 and @M = 12 then 1
	when @D = 1 and @M < 12 then @M + 1
	else @M
end
print cast(@D as varchar(2)) + '/' + cast(@M as varchar(2));
go

/* fourteenth example */
declare @L int, @N char(13) = 'Нижневартовск'
set @L = len(@N)
while @L > 0
begin
	print @N
	set @L = @L - 1
end;
go

/* fifteenth example */
declare @L int, 
	@M int, 
	@N char(13)
set @N = 'Нижневартовск'
set @L = len(@N)
set @M = @L
while @L > 0
begin
	print left(@N, @L) + space(2 * (@M - @L)) + right(reverse(@N), @L)
	set @L = @L - 1
end
set @L = 2
while @L <= @M
begin
	print left(@N, @L) + space(2 * (@M - @L)) + right(reverse(@N), @L)
	set @L = @L + 1
end;
go
