/*declare @Specialty_code int
select @Specialty_code=Specialty_code
	from Specialties
	where Specialty_name='ASOIU'
update Specialties set Specialty_vacancies=40
	where Specialty_code=@Specialty_code
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
update Specialties set Specialty_vacancies=40
	where Specialty_code=@Specialty_code
select * from Specialties
	where Specialty_code=@Specialty_code
commit tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a lost update 
with a transaction
*/


/*begin tran
update Applicants
	set Applicant_status = 'Enrolled'
	where Applicant_code = 2
waitfor delay '00:00:05'
rollback tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a dirty reading
*/


/*begin tran
update Applicants
	set Applicant_status = 'Enrolled'
	where Applicant_code = 2
waitfor delay '00:00:05'
rollback tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a dirty reading with
changed level of isolation
*/


/*begin tran
update Statements
	set Statement_status = 'Not enrolled'
	where Statement_applicant_code = 1
	and Statement_specialty_code = 1
commit tran*/
/*
NOTE:
An example query that demonstrates 
the phenomenon of a non-repeatable
reading
*/


begin tran
update Statements
	set Statement_status = 'Not enrolled'
	where Statement_applicant_code = 1
	and Statement_specialty_code = 1
commit tran
/*
NOTE:
An example query that demonstrates 
the phenomenon of a non-repeatable
reading with another level of isolation
*/