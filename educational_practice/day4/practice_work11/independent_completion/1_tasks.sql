/* first task */
declare @a int, 
        @b int, 
        @c int
set @a = 5
set @b = 10
set @c = @a * @b
print @c;
go


/* second task */
declare 
    @licey float, 
    @gimn float, 
    @diff float
set @licey = 
    (select
        avg(Students_table.Student_score)
        from Students_table
        where Students_table.Student_school = N'Лицей'
    )
set @gimn = 
    (select
        avg(Students_table.Student_score)
        from Students_table
        where Students_table.Student_school = N'Гимназия'
    )
set @diff = abs(@licey - @gimn)
print cast(@diff as nvarchar(100));
go


/* third task */
declare 
    @rows int
select 
    @rows = count(*)
from Students_table;
if @rows % 2 = 0
    print N'The number of lines is even'
else
    print N'The number of lines is not even'
go


/* fourth task */
declare 
    @X int = 5834;
select
      @X / 1000
    + (@X / 100 % 10)
    + (@X / 10  % 10)
    + (@X % 10)     as Digits_sum;
go


/* fifth task */
declare 
    @a5 int = floor(rand()*100),
    @b5 int = floor(rand()*100),
    @c5 int = floor(rand()*100)
print 'a = ' + cast(@a5 as varchar(10))
print 'b = ' + cast(@b5 as varchar(10))
print 'c = ' + cast(@c5 as varchar(10))
if @a5 < @b5 and @a5 < @c5
    print '@a is the smallest'
else if @b5 < @a5 and @b5 < @c5
    print '@b is the smallest'
else if @c5 < @a5 and @c5 < @b5
    print '@c is the smallest'
else
    print 'Values are equal or ambiguous'
go


/* sixth task */
declare 
    @a6 int = floor(rand() * 100)
if @a6 % 11 = 0
    print cast(@a6 as varchar(10)) + ' divides for 11'
else
    print cast(@a6 as varchar(10)) + ' does not divide for 11';
go


/* seventh task */
declare 
    @a7 int = floor(rand() * 1000)
if @a7 < 1
    set @a7 = 1
declare @t7 int = @a7
while @t7 % 3 = 0 and @t7 > 1
    set @t7 = @t7 / 3
if @t7 = 1
    print cast(@a7 as varchar(20)) + ' - Yes'
else
    print cast(@a7 as varchar(20)) + ' - No'
go


/* eighth task (НОД через цикл, затем НОК) */
declare 
    @x int = 18,
    @y int = 24;
declare 
    @gcd int,
    @aa int,
    @bb int;
set @aa = abs(@x);
set @bb = abs(@y);
while @bb <> 0
begin
    declare @tmp int = @aa % @bb;
    set @aa = @bb;
    set @bb = @tmp;
end
set @gcd = @aa;
select (@x * @y) / @gcd as LCM;
go


/* ninth task (сумма квадратов от A до B) */
declare 
    @a9 int = 5, 
    @b9 int = 10, 
    @s9 int = 0,
    @i9 int;
set @i9 = @a9;
while @i9 <= @b9
begin
    set @s9 = @s9 + @i9 * @i9;
    set @i9 = @i9 + 1;
end
print N'Сумма = ' + cast(@s9 as varchar(20));
go


/* tenth task 
   математическое решение: НОК(2..6)=60, нужно n ≡ 1 (mod 60) и n ≡ 0 (mod 7).
   Минимальное решение = 301 (проверка CRT).
*/
select 301 as Answer;
go


/* eleventh task (вывести фамилию len раз) */
declare @surname nvarchar(50) = N'Иванов';
declare @len int = len(@surname);
declare @i int = 1;
declare @tbl table (rn int identity(1,1), s nvarchar(200));
while @i <= @len
begin
    insert into @tbl(s) values(@surname);
    set @i = @i + 1;
end
select s as Surname_repeated from @tbl;
go


/* twelfth task (равнобедренный треугольник из строки "нжиНижневартовск") */
declare @s nvarchar(200) = N'нжиНижневартовск';
declare @n int = len(@s);
declare @k int = 1;
declare @p table (line nvarchar(400));
while @k <= @n
begin
    declare @left nvarchar(200) = substring(@s,1,@k);
    declare @revleft nvarchar(200) = reverse(substring(@s,1,@k-1));
    declare @spaces nvarchar(200) = replicate(N' ', @n - @k);
    insert into @p(line) values(@spaces + @left + @revleft);
    set @k = @k + 1;
end
select line as Pyramid from @p;
go
