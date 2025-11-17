/*
Tasks:
  1. create views
*/

create view [Appliants (for a speciality)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
spec.Specialty_name as Specialty_name
from Applicants appl, Statements stat, Specialties spec
where appl.[Applicant_code] = stat.[Statement_applicant_code] and stat.[Statement_specialty_code] = spec.[Specialty_code];
go

create view [Applicants (quantity)] as
select count(*) as Applicants
from Applicants;
go

create view [Statements (divided quantity)] as
select Specialties.Specialty_name, count(Statements.Statement_code) as [Quantity]
from Specialties inner join
	 Statements on Specialties.Specialty_code = Statements.Statement_specialty_code
group by Specialties.Specialty_name;
go

create view [Applicants (collected documents)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname'
from Applicants appl
where appl.Applicant_status = 'Collected documents';
go

create view [Applicants (enrolled)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
	spec.Specialty_name as Specialty_name
from Applicants appl, Statements stat, Specialties spec
where appl.[Applicant_code] = stat.[Statement_applicant_code] and stat.[Statement_specialty_code] = spec.[Specialty_code] and appl.Applicant_status = 'Enrolled';
go

create view [Specialty (enrolled)] as
select spec.Specialty_name as [Specialty name], count(*) as [Quantity of enrolled]
from Applicants appl, Statements stat, Specialties spec
where appl.Applicant_code = stat.Statement_applicant_code and stat.Statement_specialty_code = spec.Specialty_code and appl.Applicant_status = 'Enrolled'
group by spec.Specialty_name;
go

create view [Specialty (exams)] as
select spec.Specialty_name as [Specialty name], count(*) as [Quantity of exams]
from Exams exam, Specialties spec
where spec.Specialty_code = exam.Exam_specialty_code
group by spec.Specialty_name;
go

create view [Applicants (passed exams)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname', 
	spec.Specialty_name as 'Specialty name', 
	count(*) as [Quantity of pased exams]
from Applicants appl, Specialties spec, Exams exam, Assessments asse
where appl.Applicant_status = 'Enrolled' and spec.Specialty_code = exam.Exam_specialty_code and asse.Assessment_applicant_code = appl.Applicant_code and asse.Assessment_exam_code = exam.Exam_code and asse.Assessment_assessment > exam.Exam_positive_score
group by appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic, spec.Specialty_name;
go

create view [Applicants (dormitory)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname'
from Applicants appl
where appl.Applicant_city != 'Khanty-Mansiysk' and appl.Applicant_status = 'Enrolled'
group by appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic;
go

create view [Applicants (by cities)] as
select appl.Applicant_city as [City], count(*) as [Quantity]
from Applicants appl
where appl.Applicant_status = 'Enrolled'
group by appl.Applicant_city;
go

create view [Applicants (by score)] as
select appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
	sum(asse.Assessment_assessment) as [Total score]
from Assessments as asse, Applicants as appl, Exams as exam
where appl.Applicant_code = asse.Assessment_applicant_code and asse.Assessment_exam_code = exam.Exam_code
group by appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic;
go

create view [Specialties (contest)] as
select spec.Specialty_name as [Specialty name], count(stat.Statement_code) / spec.Specialty_vacancies as [Relation]
from Statements as stat, Specialties as spec
where stat.Statement_specialty_code = spec.Specialty_code
group by spec.Specialty_name, spec.Specialty_vacancies;
go

create view [Specialties (passing score)] as
select spec.Specialty_name as [Specialty name], min(asse.Assessment_assessment) as [Minimal passing score]
from Applicants as appl, Specialties as spec, Assessments as asse, Exams as exam
where appl.Applicant_status = 'Enrolled' and appl.Applicant_code = asse.Assessment_applicant_code and asse.Assessment_exam_code = exam.Exam_code and exam.Exam_specialty_code = spec.Specialty_code
group by spec.Specialty_name;
go

create view [Applicants (number of passed exams)] as
select appl.Applicant_code as [Applicant code],
	appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
	spec.Specialty_code as [Specialty code],
	spec.Specialty_name as [Specialty name],
	count(*) as [Number of passed exams]
from Applicants as appl, Specialties as spec, Exams as exam, Assessments as asse
where appl.Applicant_code = asse.Assessment_applicant_code and asse.Assessment_exam_code = exam.Exam_code and asse.Assessment_assessment >= exam.Exam_positive_score
group by appl.Applicant_code, appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic, spec.Specialty_code, spec.Specialty_name
having count(*) = (
    select count(*) 
    from Exams as e
    where e.Exam_specialty_code = spec.Specialty_code
);
go

create view [Applicants (didnt pass exams)] as
select appl.Applicant_code as [Applicant code],
	appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
	spec.Specialty_code as [Specialty code],
	spec.Specialty_name as [Specialty name]
from Applicants as appl, Specialties as spec, Assessments as asse, Exams as exam
where asse.Assessment_exam_code = exam.Exam_code and asse.Assessment_assessment < exam.Exam_positive_score and exam.Exam_specialty_code = spec.Specialty_code and appl.Applicant_code = asse.Assessment_applicant_code
group by appl.Applicant_code, appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic, spec.Specialty_code, spec.Specialty_name
go

create view [Applicants (not enrolled)] as
select appl.Applicant_code as [Applicant code],
	appl.Applicant_surname + ' ' + substring(appl.Applicant_name, 1, 1) + '.' + substring(appl.Applicant_patronymic, 1, 1) + '.' as 'Fullname',
	spec.Specialty_code as [Specialty code],
	spec.Specialty_name as [Specialty name],
	count(*) as [Number of passed exams]
from Applicants as appl, Specialties as spec, Exams as exam, Assessments as asse
where appl.Applicant_code = asse.Assessment_applicant_code and asse.Assessment_exam_code = exam.Exam_code and asse.Assessment_assessment >= exam.Exam_positive_score and appl.Applicant_status = 'Not enrolled' and exam.Exam_specialty_code = spec.Specialty_code
group by appl.Applicant_code, appl.Applicant_surname, appl.Applicant_name, appl.Applicant_patronymic, spec.Specialty_code, spec.Specialty_name
having count(*) = (
    select count(*) 
    from Exams as e
    where e.Exam_specialty_code = spec.Specialty_code
);
go

create view [Specialty (free vacancies)] as
select spec.Specialty_name as [Specialty name], spec.Specialty_vacancies - count(*) as [Number of free vacancies]
from Specialties as spec, Applicants as appl, Statements as stat
where spec.Specialty_code = stat.Statement_specialty_code and stat.Statement_applicant_code = appl.Applicant_code and appl.Applicant_status = 'Enrolled'
group by spec.Specialty_name, spec.Specialty_vacancies;
go

create view [Applicants (enrolled percent, percent)] as
select cast(100.0 * sum(case when Applicant_status = 'Enrolled' then 1 else 0 end) / count(*) as decimal(5,2)) as [Percent of enrolled]
from Applicants;
go

create view [Applicants (enrolled percent, cities)] as
select Applicant_city as [City], count(*) as [Applicants count], sum(case when Applicant_status = 'Enrolled' then 1 else 0 end) as [Enrolled count]
from Applicants
group by Applicant_city;
go

create view [Applicants (combined info)] as 
select c.City, c.[Applicants count], c.[Enrolled count], e.[Percent of enrolled]
from [Applicants (enrolled percent, cities)] as c
cross join [Applicants (enrolled percent, percent)] as e;
go