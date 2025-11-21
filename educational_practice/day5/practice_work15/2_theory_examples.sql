/* third example */
create view View3
(
	View3_surname,
	View3_job_title,
	View3_rank,
	View3_degree,
	View3_department,
	View3_salary
)
as
select
	Employees.Employee_name_and_initials,
	Employees.Employee_job_title,
	Teachers.Teacher_rank,
	Teachers.Teacher_degree,
	Departments.Department_name,
	Employees.Employee_salary
from
Employees_table Employees
inner join Teachers_table Teachers 
	on Employees.Employee_in_table_number = Teachers.Teacher_in_table_number
inner join Departments_table Departments 
	on Employees.Employee_department_abbreviation = Departments.Department_faculty_abbreviation;
go

select
	View3.View3_surname,
	View3.View3_job_title,
	View3.View3_rank,
	View3.View3_degree,
	View3.View3_department,
	View3.View3_salary
from View3;
go

/* fourth example */
declare @Example4 table
(
	[Week number] int,
	[Start date] date,
	[Finish date] date
)
declare @T as date, @N int = 1
set @T = cast(year(getdate()) as char(4)) + '0101'
while datepart(weekday, @T) > 1
set @T = dateadd(day, -1, @T)
print datepart(week, @T)
while year(@T) < year(dateadd(year, 1, getdate()))
begin
insert @Example4
values
(@N, @T, dateadd(day, 6, @T))
set @T = dateadd(day, 7, @T)
set @N = @N + 1

select
	[Week number],
	[Start date],
	[Finish date]
from @Example4

/* sixth example */
select
	datename(month, Exams_table.Exam_date) as [Month name],
	count(distinct Exams_table.Exam_code) as [Quantity of exams],
	count(distinct Exams_table.Exam_in_registration_number) as [Quantity of students]
into #Example6
from Exams_table
group by datename(month, Exams_table.Exam_date)
select 
	* 
from #Example6

/* eighth example */
with CustomView as
(
	select
		Departments.Department_name as Department,
		Departments.Department_abbreviation,
		avg(cast(left(replace(ltrim(rtrim(Employees.Employee_salary)), ' ', ''), 5) as int)) as [Average salary]
	from Employees_table Employees
	inner join Departments_table Departments 
		on Employees.Employee_department_abbreviation = Departments.Department_abbreviation
	group by 
		Departments.Department_name, 
		Departments.Department_abbreviation
)
select
	Employees.Employee_name_and_initials, 
	Employees.Employee_salary, 
	CustomView.Department, 
	CustomView.[Average salary]
from Employees_table Employees
inner join CustomView 
	on Employees.Employee_department_abbreviation = CustomView.Department_abbreviation
where Employees.cast(left(replace(ltrim(rtrim(Employees.Employee_salary)), ' ', ''), 5) < CustomView.[Average salary];
go

select
	cast(left(replace(ltrim(rtrim(Employees.Employee_salary)), ' ', ''), 5) as int)
	from Employees_table Employees
	where Employees.Employee_job_title = 'Engineer'
go
