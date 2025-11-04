/*declare @Specialty_code int
select @Specialty_code=Specialty_code
	from Specialties
	where Specialty_name='ASOIU'
update Specialties set Specialty_vacancies=50
	where Specialty_code=@Specialty_code
waitfor delay '00:00:10'
select * from Specialties
	where Specialty_code=@Specialty_code*/
/*
NOTE:
An example query that 
demonstrates the phenomenon of a lost update
*/


/*begin tran
declare @Specialty_code int
select @Specialty_code=Specialty_code
	from Specialties
	where Specialty_name='ASOIU'
update Specialties set Specialty_vacancies=50
	where Specialty_code=@Specialty_code
waitfor delay '00:00:05'
select * from Specialties
	where Specialty_code=@Specialty_code
commit tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a lost update 
with a transaction
*/


/*set transaction isolation level
	read uncommitted
select count(Applicant_code)
	from Applicants
	where Applicant_status='Enrolled'*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a dirty reading
*/


/*set transaction isolation level
	read committed
select count(Applicant_code)
	from Applicants
	where Applicant_status='Enrolled'*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a dirty reading with
changed level of isolation
*/


/*begin tran
select count(Statement_applicant_code) as Enrolled
	from Statements stat,
	Specialties spec
	where stat.Statement_applicant_code = spec.Specialty_code
	and spec.Specialty_name = 'Software Engineering'
	and stat.Statement_status = 'Erolled'
waitfor delay '00:00:05'
select Applicant_surname
	from Statements stat,
	Specialties spec,
	Applicants appl
	where stat.Statement_specialty_code = spec.Specialty_code
	and appl.Applicant_code = stat.Statement_applicant_code
	and spec.Specialty_name = 'Software Engineering'
	and stat.Statement_status ='Enrolled'
commit tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a non-repeatable
reading
*/


begin tran
set transaction isolation level
	repeatable read
select count(Statement_applicant_code) as Enrolled
	from Statements stat,
	Specialties spec
	where stat.Statement_specialty_code = spec.Specialty_code
	and spec.Specialty_name = 'Software Engineering'
	and stat.Statement_status = 'Enrolled'
waitfor delay '00:00:05'
select Applicant_surname
	from Statements stat,
	Specialties spec,
	Applicants appl
	where stat.Statement_specialty_code = spec.Specialty_code
	and appl.Applicant_code = stat.Statement_applicant_code
	and spec.Specialty_name = 'Software Engineering'
	and stat.Statement_status = 'Enrolled'
commit tran
/*
NOTE:
An example query that demonstrates 
the phenomenon of a non-repeatable
reading with another level of isolation
*/