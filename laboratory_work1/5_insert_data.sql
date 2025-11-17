insert into Disciplines (Discipline_name) values ('Mathematics')
insert into Disciplines (Discipline_name) values ('Physics')
insert into Disciplines (Discipline_name) values ('Biology')
insert into Disciplines (Discipline_name) values ('Literature')
insert into Disciplines (Discipline_name) values ('Geometry')
insert into Disciplines (Discipline_name) values ('Chermistry')
insert into Disciplines (Discipline_name) values ('English')
insert into Disciplines (Discipline_name) values ('Programming')
insert into Disciplines (Discipline_name) values ('Russian')
insert into Disciplines (Discipline_name) values ('History')

insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Ivanov', 'Peter', 'Sergeevich', 'Not enrolled', 'Khanty-Mansiysk')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Popova', 'Lyudmila', 'Valentinovna', 'Not enrolled', 'Surgut')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Syroezhkin', 'Sergey', 'Pavlovich', 'Enrolled', 'Khanty-Mansiysk')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Sharikov', 'Egor', 'Andreevich', 'Enrolled', 'Pyt-Yakh')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Karenina', 'Anna', 'Vasilievna', 'Collected documents', 'Khanty-Mansiysk')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Trubetskoy', 'Peter', 'Fomich', 'Not enrolled', 'Surgut')
insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) values ('Romanova', 'Anastasia', 'Yuryevna', 'Not enrolled', 'Khanty-Mansiysk')

insert into Statements
select Applicants.Applicant_code, Specialties.Specialty_code, Applicants.Applicant_status
	from Applicants, Specialties
	where Specialties.Specialty_name='ASOIU'

insert into Statements
select top 5 Applicants.Applicant_code, Specialties.Specialty_code, Applicants.Applicant_status
	from Applicants, Specialties
	where Specialties.Specialty_name='BUAA'

insert into Statements
select top 6 Applicants.Applicant_code, Specialties.Specialty_code, Applicants.Applicant_status
	from Applicants, Specialties
	where Specialties.Specialty_name='YR'

/*update a
set a.Applicant_status='Not enrolled'
from Applicants a
join Statements z, Applicants a, Specialties s
where a.Applicant_code = z.Statement_applicant_code and
	  z.Statement_specialty_code = s.Specialty_code and
	  a.Applicant_surname = 'Sharikov' and s.Specialty_name in ('ASOIU', 'YR')*/

/*
NOTE: 
I decided to leave the query example from the lab conditions 
(in the comment above) and use the Join operator. I advise 
you to do the same, because Join is a newer function and more preferable
*/
UPDATE a
SET a.Applicant_status = 'Not enrolled'
FROM Applicants a
JOIN Statements z ON a.Applicant_code = z.Statement_applicant_code
JOIN Specialties s ON z.Statement_specialty_code = s.Specialty_code
WHERE a.Applicant_surname = 'Sharikov'
  AND s.Specialty_name IN ('ASOIU', 'YR');


insert into Exams
select Specialties.Specialty_code, Disciplines.Discipline_code, '2012-07-17', 20
	from Disciplines, Specialties
	where Disciplines.Discipline_name = 'Russian'

insert into Exams
select Specialties.Specialty_code, Disciplines.Discipline_code, '2012-07-27', 25
	from Disciplines, Specialties
	where Disciplines.Discipline_name = 'Russian'

insert into Exams
select Specialties.Specialty_code, Disciplines.Discipline_code, '2012-07-25', 25
	from Disciplines, Specialties
	where Disciplines.Discipline_name = 'History'

/*
NOTE:
This part of the query, written exactly as in the job specification, does not work:
	insert into Assessments
	select Applicant_code, Exam_code
		cast(100*rand(Applicant_code * Exam_code * datepart(ms, getdate())) as int)
		from Applicants, Exams

A working version of the same thing, but which I have not tested:
INSERT INTO Assessments (Applicant_code, Exam_code, Grade)
SELECT 
    a.Applicant_code,
    e.Exam_code,
    CAST(RAND(CHECKSUM(NEWID())) * 100 AS INT) AS Grade
FROM Applicants a, Exams e;

*/