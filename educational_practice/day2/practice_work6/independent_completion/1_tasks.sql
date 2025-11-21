/* first example */
select
    Students.Student_name_and_initials, 
    Specialties.Specialty_name,
    Departments.Department_name as Department
    from Students_table Students
inner join Specialties_table Specialties 
    on Students.Student_specialty_number = Specialties.Specialty_number
inner join Departments_table Departments 
    on Specialties.Specialty_abbreviation = Departments.Department_abbreviation
where Departments.Department_faculty_abbreviation = 'PAM';
go


/* second example */
select
    Departments.Department_abbreviation,
    Departments.Department_faculty_abbreviation,
    Departments.Department_name,
    Employees.Employee_name_and_initials
    from Departments_table Departments
join Employees_table Employees
    on Employees.Employee_department_abbreviation = Departments.Department_faculty_abbreviation
join Specialties_table Specialties
    on Specialties.Specialty_abbreviation = Departments.Department_abbreviation;
go


/* third example */
select
    S_Employees.Employee_in_table_number,
    S_Employees.Employee_name_and_initials as Supervisor
    from Employees_table S_Employees
inner join Employees_table P_Employees 
    on S_Employees.Employee_chief = P_Employees.Employee_in_table_number
where P_Employees.Employee_in_table_number not in 
    (select Head_of_department_employee_in_table_number from Heads_of_departments_table);
go


/* fourth example */
select
    Students.Student_name_and_initials
    from Students_table Students
inner join Exams_table Exams 
    on Students.Student_registration_number = Exams.Exam_in_registration_number
group by Students.Student_name_and_initials
having count(Students.Student_registration_number) >= 2;
go


/* fifth example */
select
    *
    from Employees_table Employees
where Employees.Employee_job_title = 'Engineer'
    and cast(left(replace(ltrim(rtrim(Employees.Employee_salary)), ' ', ''), 5) as int) < 20000;
go


/* sixth example */
select
    Students.Student_name_and_initials
    from Students_table Students
inner join Exams_table Exams 
    on Students.Student_registration_number = Exams.Exam_in_registration_number
    and Exams.Exam_audience = 't505'
group by Students.Student_name_and_initials;
go

/* seventh example */
select
    Students.Student_name_and_initials, 
    count(Exams.Exam_assessment) as [Quantity of exams], 
    avg(Exams.Exam_assessment) as [Average score]
    from Students_table Students
inner join Exams_table Exams 
    on Students.Student_registration_number = Exams.Exam_in_registration_number
group by Students.Student_name_and_initials
having avg(Exams.Exam_assessment) >= 4;
go


/* eighth example */
select
    Employees.Employee_name_and_initials, 
    Employees.Employee_salary, 
    Teachers.Teacher_rank
    from Employees_table Employees
inner join Teachers_table Teachers
    on Teachers.Teacher_in_table_number = Employees.Employee_in_table_number;
go


/* ninth example */
select
    Employees.Employee_name_and_initials, 
    Teachers.Teacher_degree
    from Employees_table Employees
inner join Teachers_table Teachers 
    on Employees.Employee_in_table_number = Teachers.Teacher_in_table_number
where Teachers.Teacher_rank = 'Professor';
go

/* tenth example */
select distinct
    Disciplines.Discipline_name as Discipline, 
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
where Exams.Exam_date between '2015-06-05' and '2015-06-17';
go


/* eleventh example */
select
    Employees.Employee_name_and_initials, 
    count(Exams.Exam_date) as [Quiantity of exams]
    from Exams_table Exams
inner join Employees_table Employees 
    on Exams.Exam_in_table_number = Employees.Employee_in_table_number
inner join Teachers_table Teachers
    on Teachers.Teacher_in_table_number = Employees.Employee_in_table_number
group by Employees.Employee_name_and_initials
having count(Exams.Exam_date) > 3;
go


/* twelfth example */
select distinct
    Students.*
    from Students_table Students
inner join Exams_table Exams 
    on Students.Student_registration_number = Exams.Exam_in_registration_number
where Exams.Exam_date = '2015-06-05';
go
