/* you can separate that heap of shit 
   to another database - I did it
*/

/* creating the first table */
create table Faculties_table (
	Faculty_abbreviation nvarchar(5) not null,
	Faculty_name nvarchar(60) not null
);

-- insert data
insert into Faculties_table values ('NS',  'Natural sciences')
insert into Faculties_table values ('HS',  'Humanity sciences')
insert into Faculties_table values ('IT',  'Information technology')
insert into Faculties_table values ('PAM', 'Physics and mathematics');
go


/* creating the second table */
create table Departments_table (
	Department_abbreviation nvarchar(5) not null,
	Department_name nvarchar(60) not null,
	Department_faculty_abbreviation nvarchar(5) not null
);

-- insert data
insert into Departments_table values ('HM',  'Higher Mathematics',       'NS')
insert into Departments_table values ('IS',  'Information systems',      'IT')
insert into Departments_table values ('MM',  'Mathematical modeling',    'PAM')
insert into Departments_table values ('GP',  'General physics',          'NS')
insert into Departments_table values ('ACS', 'Applied computer science', 'IT')
insert into Departments_table values ('EP',  'Experimental physics',     'PAM');
go



/* creating the third table */
create table Employees_table (
	Employee_in_table_number int not null,
	Employee_department_abbreviation nvarchar(5) not null,
	Employee_name_and_initials nvarchar(60) not null,
	Employee_job_title nvarchar(60) not null,
	Employee_salary nvarchar(60) not null,
	Employee_chief int not null
);

-- insert data
insert into Employees_table values (101, 'ACS', 'Prokhorov P.P.',  'Head of department', '35 000 r.', 101)
insert into Employees_table values (102, 'ACS', 'Semenov S.S.',    'Teacher',            '25 000 r.', 101)
insert into Employees_table values (105, 'ACS', 'Petrov P.P.',     'Teacher',            '35 000 r.', 101)
insert into Employees_table values (153, 'ACS', 'Sidorova S.S.',   'Teacher',            '15 000 r.', 102)
insert into Employees_table values (201, 'IS',  'Andreev P.P.',    'Head of department', '35 000 r.', 201)
insert into Employees_table values (202, 'IS',  'Borisov B.B.',    'Teacher',            '25 000 r.', 201)
insert into Employees_table values (241, 'IS',  'Glukhov P.P.',    'Engineer',           '20 000 r.', 201)
insert into Employees_table values (242, 'IS',  'Chernov Ch.Ch.',  'Engineer',           '15 000 r.', 202)
insert into Employees_table values (301, 'MM',  'Basov B.B.',      'Head of department', '35 000 r.', 301)
insert into Employees_table values (301, 'MM',  'Sergeeva S.S.',   'Teacher',            '25 000 r.', 301)
insert into Employees_table values (401, 'GP',  'Volkov V.V.',     'Head of department', '35 000 r.', 401)
insert into Employees_table values (402, 'GP',  'Zaitsev Z.Z.',    'Teacher',            '25 000 r.', 401)
insert into Employees_table values (403, 'GP',  'Smirnov S.S.',    'Teacher',            '15 000 r.', 401)
insert into Employees_table values (435, 'GP',  'Lisin L.L.',      'Engineer',           '20 000 r.', 402)
insert into Employees_table values (501, 'HM',  'Kuznetsov K.K.',  'Head of department', '35 000 r.', 501)
insert into Employees_table values (502, 'HM',  'Romantsev R.R.',  'Teacher',            '25 000 r.', 501)
insert into Employees_table values (503, 'HM',  'Solovyov S.S.',   'Teacher',            '25 000 r.', 501)
insert into Employees_table values (601, 'EP',  'Zverev Z.Z.',     'Head of department', '35 000 r.', 601)
insert into Employees_table values (602, 'EP',  'Sorokina S.S.',   'Teacher',            '25 000 r.', 601)
insert into Employees_table values (614, 'EP',  'Grigorieva G.G.', 'Engineer',           '20 000 r.', 602);
go



/* creating the fourth table */
create table Specialties_table (
	Specialty_number nvarchar(15) not null,
	Specialty_name nvarchar(60) not null,
	Specialty_abbreviation nvarchar(5) not null
);

-- insert data
insert into Specialties_table values ('01.03.04', 'Applied mathematics', 'MM')
insert into Specialties_table values ('09.03.02', 'Information systems and technologies', 'IS')
insert into Specialties_table values ('09.03.03', 'Technologies applied informatics', 'ACS')
insert into Specialties_table values ('14.03.02', 'Nuclear physics and technologies', 'EP')
insert into Specialties_table values ('38.03.05', 'Technologies business informatics', 'IS');
go



/* creating the fifth table */
create table Disciplines_table (
	Discipline_code int not null,
	Discipline_valume int not null,
	Discipline_name nvarchar(60) not null,
	Discipline_performer nvarchar(5) not null
);

-- insert data
insert into Disciplines_table values (101, 320, 'Mathematics', 'HM')
insert into Disciplines_table values (102, 160, 'Informatics', 'ACS')
insert into Disciplines_table values (103, 160, 'Physics', 'GP')
insert into Disciplines_table values (202, 120, 'Databases', 'IS')
insert into Disciplines_table values (204, 160, 'Electronics', 'EP')
insert into Disciplines_table values (205, 80, 'Programming', 'ACS')
insert into Disciplines_table values (209, 80, 'Modeling', 'MM');
go



/* creating the sixth table */
create table Requests_table (
	Request_code int not null,
	Request_specialty_number nvarchar(15) not null
);

-- insert data
insert into Requests_table values (101, '01.03.04')
insert into Requests_table values (205, '01.03.04')
insert into Requests_table values (209, '01.03.04')
insert into Requests_table values (101, '09.03.02')
insert into Requests_table values (102, '09.03.02')
insert into Requests_table values (103, '09.03.02')
insert into Requests_table values (202, '09.03.02')
insert into Requests_table values (205, '09.03.02')
insert into Requests_table values (209, '09.03.02')
insert into Requests_table values (101, '09.03.03')
insert into Requests_table values (102, '09.03.03')
insert into Requests_table values (103, '09.03.03')
insert into Requests_table values (202, '09.03.03')
insert into Requests_table values (205, '09.03.03')
insert into Requests_table values (101, '14.03.02')
insert into Requests_table values (102, '14.03.02')
insert into Requests_table values (103, '14.03.02')
insert into Requests_table values (204, '14.03.02')
insert into Requests_table values (101, '38.03.05')
insert into Requests_table values (103, '38.03.05')
insert into Requests_table values (202, '38.03.05')
insert into Requests_table values (209, '38.03.05');
go



/* creating the seventh table */
create table Heads_of_departments_table (
	Head_of_department_employee_in_table_number int not null,
	Head_of_department_expirience int not null
);

-- insert data
insert into Heads_of_departments_table values (101, 15)
insert into Heads_of_departments_table values (201, 18)
insert into Heads_of_departments_table values (301, 20)
insert into Heads_of_departments_table values (401, 10)
insert into Heads_of_departments_table values (501, 18)
insert into Heads_of_departments_table values (601, 8);
go



/* creating the eighth table */
create table Engineers_table (
	Engineer_in_table_number int not null,
	Engineer_specialty nvarchar(50) not null
);

-- insert data
insert into Engineers_table values (153, 'Electronic')
insert into Engineers_table values (241, 'Electronic')
insert into Engineers_table values (242, 'Programmer')
insert into Engineers_table values (435, 'Electronic')
insert into Engineers_table values (614, 'Programmer');
go



/* creating the ninth table */
create table Teachers_table (
	Teacher_in_table_number int not null,
	Teacher_rank nvarchar(50) not null,
	Teacher_degree nvarchar(50) not null
);

-- insert data
insert into Teachers_table values (101, 'Professor', 'd. t.n.')
insert into Teachers_table values (102, 'Associate professor', 'k. f.-m. n.')
insert into Teachers_table values (105, 'Associate professor', 'k. t.n.')
insert into Teachers_table values (201, 'Professor', 'd. f.-m. n.')
insert into Teachers_table values (202, 'Associate professor', 'd. f.-m. n.')
insert into Teachers_table values (301, 'Professor', 'd. t.n.')
insert into Teachers_table values (302, 'Associate professor', 'k. t.n.')
insert into Teachers_table values (401, 'Professor', 'd. t.n.')
insert into Teachers_table values (402, 'Associate professor', 'k. t.n.')
insert into Teachers_table values (403, 'Assistant', '-')
insert into Teachers_table values (501, 'Professor', 'd. f.-m. n.')
insert into Teachers_table values (502, 'Professor', 'd. f.-m. n.')
insert into Teachers_table values (503, 'Associate professor', 'k. f.-m. n.')
insert into Teachers_table values (601, 'Professor', 'd. f.-m. n.');
go



/* creating the tenth table */
create table Students_table (
	Student_registration_number bigint not null,
	Student_specialty_number nvarchar(15) not null,
	Student_name_and_initials nvarchar(60) not null
);

-- insert data
insert into Students_table values (10101, '09.03.03', 'Nikolaeva N.N.')
insert into Students_table values (10102, '09.03.03', 'Ivanov I.I.')
insert into Students_table values (10103, '09.03.03', 'Kryukov K.K.')
insert into Students_table values (20101, '09.03.02', 'Andreev A.A.')
insert into Students_table values (20102, '09.03.02', 'Fedorov F.F.')
insert into Students_table values (30101, '14.03.03', 'Bondarenko B.B.')
insert into Students_table values (30102, '14.03.03', 'Tsvetkov T.T.')
insert into Students_table values (30103, '14.03.03', 'Petrov P.P.')
insert into Students_table values (50101, '01.03.04', 'Sergeev S.S.')
insert into Students_table values (50102, '01.03.04', 'Kudryavtsev K.K.')
insert into Students_table values (80101, '38.03.05', 'Makarov M.M.')
insert into Students_table values (80102, '38.03.05', 'Yakovlev Ya.Ya.')
go



/* creating the eleventh table */
create table Exams_table (
	Exam_date date not null,
	Exam_code int not null,
	Exam_in_registration_number int not null,
	Exam_in_table_number int not null,
	Exam_audience nvarchar(40) not null,
	Exam_assessment int not null
);

-- insert data
insert into Exams_table values ('05.06.2015', 102, 10101, 102, 't505', 4)
insert into Exams_table values ('05.06.2015', 102, 10102, 102, 't505', 4)
insert into Exams_table values ('05.06.2015', 202, 20101, 202, 't506', 4)
insert into Exams_table values ('05.06.2015', 202, 20102, 202, 't506', 3)
insert into Exams_table values ('07.06.2015', 102, 30101, 105, 'f419', 3)
insert into Exams_table values ('07.06.2015', 102, 30102, 101, 't506', 4)
insert into Exams_table values ('07.06.2015', 102, 80101, 102, 'm425', 5)
insert into Exams_table values ('09.06.2015', 205, 80102, 402, 'm424', 4)
insert into Exams_table values ('09.06.2015', 209, 20101, 302, 'f333', 3)
insert into Exams_table values ('10.06.2015', 101, 10101, 501, 't506', 4)
insert into Exams_table values ('10.06.2015', 101, 10102, 501, 't506', 4)
insert into Exams_table values ('10.06.2015', 204, 30102, 601, 'f349', 5)
insert into Exams_table values ('10.06.2015', 209, 80101, 301, 'e105', 5)
insert into Exams_table values ('10.06.2015', 209, 80102, 301, 'e105', 4)
insert into Exams_table values ('12.06.2015', 101, 80101, 502, 's324', 4)
insert into Exams_table values ('15.06.2015', 101, 80101, 503, 'f417', 4)
insert into Exams_table values ('15.06.2015', 101, 80101, 501, 'f201', 5)
insert into Exams_table values ('15.06.2015', 101, 50102, 501, 'f201', 3)
insert into Exams_table values ('15.06.2015', 103, 10101, 403, 'f414', 4)
insert into Exams_table values ('17.06.2015', 102, 10101, 102, 't505', 5);
go

