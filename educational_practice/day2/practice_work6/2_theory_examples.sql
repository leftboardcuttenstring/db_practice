/* first example */
select 
	Faculties.Faculty_name 
		as Faculty, 
	Deparments.Department_name 
		as Department 
	from Faculties_table Faculties, Departments_table Deparments 
	where Faculties.Faculty_abbreviation = Deparments.Department_faculty_abbreviation 
	order by Faculty, Department;
go

/* second example */
select
	Faculties.Faculty_name 
		as Faculty, 
	Departments.Department_name 
		as Department
	from Faculties_table Faculties
	inner join Departments_table Departments 
		on Faculties.Faculty_abbreviation = Departments.Department_faculty_abbreviation
	order by Faculty, Department;
go

/* third example */
SELECT
	Faculties.Faculty_name 
		as Faculty,
	Departments.Department_name 
		as Department
	from Faculties_table Faculties
	left outer join Departments_table Departments 
		on Faculties.Faculty_abbreviation = Departments.Department_faculty_abbreviation
	order by Faculty, Department;
go

/* fourth example */
select
	Students.Student_name_and_initials, 
	Specialties.Specialty_name,
	Departments.Department_name 
		as Department
	from Students_table Students
	inner join Specialties_table Specialties 
		on Students.Student_specialty_number = Specialties.Specialty_number
	inner join Departments_table Departments 
		on Specialties.Specialty_abbreviation = Departments.Department_abbreviation;
go

/* fifth example */
select
	S_Employees.Employee_name_and_initials, 
	S_Employees.Employee_job_title, 
	S_Employees.Employee_salary, 
	P_Employees.Employee_name_and_initials 
		as Supervisor
	from Employees_table S_Employees
	inner join Employees_table P_Employees 
		on S_Employees.Employee_chief = P_Employees.Employee_in_table_number;
go

/* sixth example */
select
	Students.Student_name_and_initials
	from Students_table Students
	inner join Exams_table Exams 
		on Students.Student_registration_number = Exams.Exam_in_registration_number
	group by Students.Student_name_and_initials;
go

/* seventh example */
select
	Students.Student_name_and_initials, 
	count(Exams.Exam_assessment) 
		as [Quantity of exams], 
	avg(Exams.Exam_assessment) 
		as [Average score]
	from Students_table Students
	inner join Exams_table Exams 
		on Students.Student_registration_number = Exams.Exam_in_registration_number
	group by Students.Student_name_and_initials;
go

/* eighth example */
select
	Employees.Employee_name_and_initials, 
	Employees.Employee_salary, 
	Heads_of_departments.Head_of_department_expirience
	from Employees_table Employees
	inner join Heads_of_departments_table Heads_of_departments 
		on Employees.Employee_in_table_number = Heads_of_departments.Head_of_department_employee_in_table_number;
go

/* ninth example */
select
	Employees.Employee_name_and_initials, 
	Teachers.Teacher_degree
	from Employees_table Employees
	inner join Teachers_table Teachers 
		on Employees.Employee_in_table_number = Teachers.Teacher_in_table_number
	where Teachers.Teacher_degree in ('k. f.-m. n.', 'd. f.-m. n.');
go

/* tenth example */
select distinct
	Disciplines.Discipline_name 
		as Discipline, 
	Employees.Employee_name_and_initials, 
	Employees.Employee_job_title, 
	Teachers.Teacher_degree, 
	Exams.Exam_date, 
	Exams.Exam_audience
	from Exams_table Exams
	inner join Disciplines_table Disciplines 
		on Exams.Exam_code = Disciplines.Discipline_code
	inner join Employees_table Employees 
		on Exams.Exam_in_table_number = Employees.Employee_in_table_number
	inner join Teachers_table Teachers 
		on Exams.Exam_in_table_number = Teachers.Teacher_in_table_number
	order by Exams.Exam_date;
go

/* eleventh example */
select
	Employees.Employee_name_and_initials, 
	count(Exams.Exam_date) 
		as [Quiantity of exams]
	from Exams_table Exams
	inner join Employees_table Employees 
		on Exams.Exam_in_table_number = Employees.Employee_in_table_number
	group by Employees.Employee_name_and_initials;
go

/* twelfth example */
select
	Students.Student_name_and_initials
	from Students_table Students
	left outer join Exams_table Exams 
		on Students.Student_registration_number = Exams.Exam_in_registration_number
	where Exams.Exam_in_registration_number is null;
go