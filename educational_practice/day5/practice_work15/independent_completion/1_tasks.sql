use educational_practice;
go
/* first task */
create view Task_view_1
as
select
	Countries.Country_name,
	Countries.Country_capital,
	Countries.Country_area,
	Countries.Country_population,
	Countries.Country_continent
from Countries
where Countries.Country_population < 10000000
	and Countries.Country_area > 500000;
go

select
	Task_view_1.Country_name,
	Task_view_1.Country_capital,
	Task_view_1.Country_area,
	Task_view_1.Country_population,
	Task_view_1.Country_continent
from Task_view_1;
go

/* second task */
create view Task_view_2 (
	View2_Continent,
	View2_Area,
	View2_Population
)
as
select
	Countries.Country_continent,
	avg(Countries.Country_area),
	SUM(Countries.Country_population)
from Countries
group by Countries.Country_continent;
go

select
	Task_view_2.View2_Continent,
	Task_view_2.View2_Area,
	Task_view_2.View2_Population
from Task_view_2;
go

/* third task */
use educational_practice_university;
go

create view Task_view_3
(
	Task_view_3_surname,
	Task_view_3_job_title,
	Task_view_3_rank,
	Task_view_3_degree,
	Task_view_3_department,
	Task_view_3_exams
)
as
select
	Employees.Employee_name_and_initials,
	Employees.Employee_job_title,
	Teachers.Teacher_rank,
	Teachers.Teacher_degree,
	Departments.Department_name,
	count(Exams.Exam_in_table_number)
from Employees_table Employees
inner join Teachers_table Teachers 
	on Employees.Employee_in_table_number = Teachers.Teacher_in_table_number
inner join Departments_table Departments 
	on Employees.Employee_department_abbreviation = Departments.Department_faculty_abbreviation
inner join Exams_table Exams
	on Exams.Exam_in_table_number = Teachers.Teacher_in_table_number
go

select
	Task_view_3.Task_view_3_surname,
	Task_view_3.Task_view_3_job_title,
	Task_view_3.Task_view_3_rank,
	Task_view_3.Task_view_3_degree,
	Task_view_3.Task_view_3_department,
	Task_view_3.Task_view_3_exams
from Task_view_3;
go

/* fourth task */
declare @Months table
(
    [Month number] int,
    [Month name] nvarchar(20),
    [Days count] int
);

declare 
    @year int = year(getdate()),
    @m int = 1;

while @m <= 12
begin
    insert into @Months
    values
    (
        @m,
        datename(month, datefromparts(@year, @m, 1)),
        day(eomonth(datefromparts(@year, @m, 1)))
    );

    set @m = @m + 1;
end;

select 
    [Month number],
    [Month name],
    [Days count]
from @Months;
go


/* fifth task */
use educational_practice;
go

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
where Countries.Country_area * 100 <= 
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

/* sixth task */
use educational_practice_university;
go

select
	datename(week, Exams_table.Exam_date) as [Week number],
	count(Exams_table.Exam_code) as [Quantity of exams],
	count(Students_table.Student_specialty_number) as [Quantity of students]
into #Example6
from Exams_table
inner join Students_table
	on Students_table.Student_registration_number = Exams_table.Exam_in_registration_number
group by datename(week, Exams_table.Exam_date)

select 
	* 
from #Example6;
go

/* seventh task */
use educational_practice;
go

create table ##Example7
(
	##Example7_max_area int,
	##Example7_min_area int
)
insert into ##Example7 
	(##Example7.##Example7_max_area, ##Example7.##Example7_min_area)
select
	max(Countries.Country_area),
	min(Countries.Country_area)
from Countries

/* eighth task */


/* ninth task */
drop view Task_view_1
drop view Task_view_2

use educational_practice_university
drop view Task_view_3

