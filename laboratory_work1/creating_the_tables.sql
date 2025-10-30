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
	Name varchar(64) not null
)

create table Specialties (
	Speciality_code int identity(1,1) not null primary key,
	Name varchar(50) not null,
	Vacancies int not null
)

create table Applicants (
	Applicant_code int identity(1,1) not null primary key,
	Surname varchar(30) not null,
	Name varchar(20) not null,
	Patronymic varchar(20) not null,
	Status varchar(20),
	City varchar(20) not null
)

create table Statements (
	Statement_code int identity(1,1) not null primary key,
	Applicant_code int not null,
	Speciality_code int not null,
	Status varchar(20)
)

create table Assessments (
	Assessment_code int identity(1,1) not null primary key,
	Applicant_code int not null,
	Exam_code int not null,
	Assessment int
)

create table Journal (
	Event_code int identity(1,1) not null primary key,
	Description varchar(100) not null,
	Event_date date not null
)

create table Exams (
	Exam_code int identity(1,1) not null primary key,
	Speciality_code int not null,
	Discipline_code int not null,
	Exam_date date not null,
	Positive_score int not null
)