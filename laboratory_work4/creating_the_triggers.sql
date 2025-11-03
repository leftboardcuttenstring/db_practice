create trigger Statement_on_insert_trig on Statements
for insert
as
	declare @Applicant_code int
	select @Applicant_code = Statement_applicant_code from inserted
	declare @Statements_from_aplicant int
	select @Statements_from_aplicant = count(*)
	from Statements
	where Statement_applicant_code = @Applicant_code
	if (@Statements_from_aplicant > 3)
	begin
		raiserror('Applicant [%d] cannot submit more than three applications', 16, 1)
		rollback tran
	end
go
/*
NOTE:
it will execute automatically when you'll
make query with the next code (if will return with
error if it'll see more than three statements what're
attached to one applicant's code):

insert into Statements values (8, 4, 'Not enrolled')
*/

create trigger Applicant_on_update_trig on Applicants
for update
as
	if update(Applicant_status)
	begin
		declare @Apllicant_code int
		declare @Previous_status varchar(16)
		declare @Actual_status varchar(16)
		select @Apllicant_code= Applicant_code, @Actual_status = Applicant_status from inserted
		select @Previous_status = Applicant_status from deleted
		insert into Journal values ('Status of applicant [' 
									+ cast(@Apllicant_code as varchar(16)) 
									+ '] has been modified from [' 
									+ @Previous_status 
									+ '] to [' 
									+ @Actual_status 
									+ '] by user [' 
									+ current_user 
									+ ']', getdate())                             
end
go
/*
NOTE:

still the same, it will execute when
you'll give to it needed conditions
*/

create trigger Exam_on_insert_trig on Exams
for insert
as
begin
	declare @Inserted_exam_date date
	select @Inserted_exam_date = Exam_date from inserted
	if exists (select 1 from Exams where Exam_date = @Inserted_exam_date)
	begin
		raiserror('Error: an exam for this specialty is already scheduled on this date', 16, 1);
		rollback tran;
		return
	end
end
go
/*
NOTE:

still the same, it will execute when
you'll give to it needed conditions
*/

create trigger Specialty_on_update_trig on Specialties
for update
as
begin
	declare @Inserted_vacancies int
	declare @Specialty_code int
	select @Inserted_vacancies = Specialty_vacancies from inserted
	select @Specialty_code = Specialty_code from inserted
	insert into Journal values ('Number of vacancies in the specialty with code [' 
								+ cast(@Specialty_code as varchar(16)) 
								+ '] has been changed: now there are [' 
								+ cast(@Inserted_vacancies as varchar(16)) 
								+ ']. Changes were made by the user [' 
								+ current_user + ']', getdate())
end
go

create trigger Assessment_on_insert_trig on Assessments
for insert
as
begin
	declare @Inserted_applicant_code int
	declare @Inserted_specialty_code int
	declare @Exam_code int
	select @Inserted_applicant_code = Assessment_applicant_code from inserted
	select @Exam_code = Assessment_exam_code from inserted
	select @Inserted_specialty_code = Exam_specialty_code from Exams where Exam_code = @Exam_code
	if not exists (select 1 from Specialties where Specialty_code = @Inserted_specialty_code)
	begin
		raiserror('Error: the current applicant does not have an application for the specialty for which he/she took/is taking/will take the exam', 16, 1);
		rollback tran;
		return
	end
end
go
/*
NOTE:

still the same, it will execute when
you'll give to it needed conditions
*/