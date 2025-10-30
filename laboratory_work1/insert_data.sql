insert into Disciplines (Name) values ('Mathematics')
insert into Disciplines (Name) values ('Physics')
insert into Disciplines (Name) values ('Biology')
insert into Disciplines (Name) values ('Literature')
insert into Disciplines (Name) values ('Geometry')
insert into Disciplines (Name) values ('Chermistry')
insert into Disciplines (Name) values ('English')
insert into Disciplines (Name) values ('Programming')
insert into Disciplines (Name) values ('Russian')
insert into Disciplines (Name) values ('History')

insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Ivanov', 'Peter', 'Sergeevich', 'Not enrolled', 'Khanty-Mansiysk')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Popova', 'Lyudmila', 'Valentinovna', 'Not enrolled', 'Surgut')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Syroezhkin', 'Sergey', 'Pavlovich', 'Enrolled', 'Khanty-Mansiysk')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Sharikov', 'Egor', 'Andreevich', 'Enrolled', 'Pyt-Yakh')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Karenina', 'Anna', 'Vasilievna', 'Collected documents', 'Khanty-Mansiysk')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Trubetskoy', 'Peter', 'Fomich', 'Not enrolled', 'Surgut')
insert into Applicants (Surname, Name, Patronymic, Status, City) values ('Romanova', 'Anastasia', 'Yuryevna', 'Not enrolled', 'Khanty-Mansiysk')

insert into Statements
select Applicant_code, Speciality_code, Status
	from Applicants, Specialties
	where Name='ASOIU'

insert into Statements
select top 5 Applicant_code, Speciality_code, Status
	from Applicants, Specialties
	where Name='BUAA'

insert into Statements
select top 6 Applicant_code, Speciality_code, Status
	from Applicants, Specialties
	where Name='YR'

update Statements
set Status='Not enrolled'
from Statements z, Applicants a, Spetialties s
where a.Speciality_code = z.Applicant_code and
	  z.Speciality_code = s.Speciality_code and
	  a.Surname = 'Sharikov' and s.Name in ('ASOIU', 'YR')

insert into Exams
select Specialty_code, Discipline_code, '17.07.2012', 20
	from Disciplines, Specialties
	where Disciplines.Name = 'Russian'

insert into Exams
select Specialty_code, Discipline_code, '27.07.2012', 25
	from Disciplines, Specialties
	where Disciplines.Name = 'Russian'

insert into Exams
select Specialty_code, Discipline_code, '25.07.2012', 25
	from Disciplines, Specialties
	where Disciplines.Name = 'History'

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
