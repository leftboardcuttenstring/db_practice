/*
Tasks:
  0. create a database
  1. create Disciplines table using SQL query
  2. create Specialties table using GUI in SQL MS
  3. create Applicants table using GUI in SQL MS
  4. create Statements table using GUI in SQL MS
  5. create Assessments table using GUI in SQL MS
  6. create Journal table using GUI in SQL MS
  7. create constraints (see in add_constraints.sql)
  8. create relationships between tables (see in add_relationships.sql)
  9. insert the data into tables (see in insert_data.sql)
*/

create table Disciplines (
	Discipline_code int identity(1,1) not null primary key,
	Discipline_name varchar(64) not null
)

create table Specialties (
	Specialty_code int identity(1,1) not null primary key,
	Specialty_name varchar(50) not null,
	Specialty_vacancies int not null
)

create table Applicants (
	Applicant_code int identity(1,1) not null primary key,
	Applicant_surname varchar(30) not null,
	Applicant_name varchar(20) not null,
	Applicant_patronymic varchar(20) not null,
	Applicant_status varchar(20),
	Applicant_city varchar(20) not null
)

create table Statements (
	Statement_code int identity(1,1) not null primary key,
	Statement_applicant_code int not null,
	Statement_specialty_code int not null,
	Statement_status varchar(20)
)

create table Assessments (
	Assessment_code int identity(1,1) not null primary key,
	Assessment_applicant_code int not null,
	Assessment_exam_code int not null,
	Assessment_assessment int
)

create table Journal (
	Journal_event_code int identity(1,1) not null primary key,
	Journal_description varchar(100) not null,
	Journal_event_date date not null
)

create table Exams (
	Exam_code int identity(1,1) not null primary key,
	Exam_specialty_code int not null,
	Exam_discipline_code int not null,
	Exam_date date not null,
	Exam_positive_score int not null
)