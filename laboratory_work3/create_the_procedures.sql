create procedure Specialty_info_insert_proc
	@Specialty_name varchar(50),
	@Quantity_of_vacancies int
as
	insert into Specialties values (@Specialty_name, @Quantity_of_vacancies)
go

/*
NOTE:
executing query (it works like - you
added some procedure, right? so, then you have to
execute it to get the result from it, and it means
you have to write another query what'll describe
how you want to call that procedure

below is a code what can help you execute 
that procedure (second line shows whole table to
what you're inserting the data):

exec Specialty_info_insert 'FIL (RYaL)', 25
select * from Specialties
*/

create procedure Specialty_delete_proc
    @Specialty_code int
as
begin
    if not exists (select 1 from Specialties where Specialty_code = @Specialty_code)
    begin
        raiserror('Error: this specialty does not exist', 16, 1);
        return;
    end;
    begin try
        begin tran;
        delete from Statements 
        where Statement_specialty_code = @Specialty_code;
        delete from Assessments 
        where Assessment_exam_code in (
            select Exam_code 
            from Exams 
            where Exam_specialty_code = @Specialty_code
        );

        delete from Exams 
        where Exam_specialty_code = @Specialty_code;
        delete from Specialties 
        where Specialty_code = @Specialty_code;
        commit tran;
    end try
    begin catch
        rollback tran;
        raiserror('Error: transaction rollback due to an internal error', 16, 1);
    end catch;
end;
go
/*
NOTE:
that procedure didnt work 'out-of-the-box' in some way of sayin
so, i fixed it...somehow

exec Specialty_delete 14
*/

create procedure Discipline_insert_proc
	@Exam_code int,
	@Discipline_code int
as
begin
	if not exists (select 1 from Disciplines where Discipline_code = @Discipline_code)
	begin
		raiserror('Error: this discipline does not exist', 16, 1);
		return;
	end
	if not exists (select 1 from Exams where Exam_code = @Exam_code)
	begin
		raiserror('Error: this exam does not exist', 16, 1);
		return;
	end
	insert into Exams (Exam_discipline_code) values (@Discipline_code)
end
go
/*
NOTE:
The idea of ??how to make a function for adding 
the discipline code (only it) hasn't occurred 
to me yet, because this assumes that we have 
an exam row in which the value of the Discipline_code 
field is not filled in, but this can't happen 
according to the dimension, because the value 
of the Discipline_code field cannot be equal 
to NULL

exec Discipline_insert_proc 1, 3
*/

create procedure Applicant_insert_proc
	@Applicant_surname varchar(30),
	@Applicant_name varchar(20),
	@Applicant_patronymic varchar(20),
	@Applicant_status varchar(20),
	@Applicant_city varchar(20)
as
begin
	if (@Applicant_surname = NULL OR @Applicant_name = NULL OR @Applicant_patronymic = NULL OR @Applicant_city = NULL)
	begin
		raiserror('Error: some of the data you entered is NULL. The values ??of all fields in the applicant row cannot be NULL', 16, 1);
		return;
	end
	insert into Applicants (Applicant_surname, Applicant_name, Applicant_patronymic, Applicant_status, Applicant_city) 
		values (@Applicant_surname, @Applicant_name, @Applicant_patronymic, @Applicant_patronymic, @Applicant_status, @Applicant_city);
end
go
/*
NOTE:

exec Discipline_insert_proc 'Ivanov', 'Ivan', 'Ivanovich', 'Enrolled', 'Ulan-Ude'
*/

create procedure Statement_insert_not_enrolled_applicant_proc
	@Statement_applicant_code int,
	@Statement_specialty_code int
as
begin
	if not exists (select 1 from Applicants where Applicant_code = @Statement_applicant_code)
	begin
		raiserror('Error: this applicant does not exist', 16, 1);
		return;
	end
	if not exists (select 1 from Specialties where Specialty_code = @Statement_specialty_code)
	begin
		raiserror('Error: this specialty does not exist', 16, 1);
		return;
	end
	insert into Statements (Statement_applicant_code, Statement_specialty_code, Statement_status) 
		values (@Statement_applicant_code, @Statement_specialty_code, 'Not enrolled')
end
go
/*
NOTE:

exec Statement_insert_not_enrolled_applicant_proc 1, 2 
*/

create procedure Discipline_delete_proc
	@Discipline_code int
as
begin
	if not exists (select 1 from Disciplines where Discipline_code= @Discipline_code)
	begin
		raiserror('Error: this disciplint does not exist', 16, 1);
		return;
	end
	delete Disciplines where Discipline_code = @Discipline_code
end
go
/*
NOTE:

exec Discipline_delete_proc 1
*/

create procedure Applicant_delete_enrolled_proc
	@Applicant_code int
as
begin
	--Applicants as appl
	if not exists (select 1 from Applicants where Applicant_code = @Applicant_code)
	begin
		raiserror('Error: this applicant does not exist', 16, 1);
		return;
	end
	if not exists (select 1 from Applicants where Applicants.Applicant_status = 'Enrolled')
	begin
		raiserror('Error: the applicants status must be "Enrolled"', 16, 1);
		return;
	end
	delete Applicants where Applicant_code = @Applicant_code
end
go
/*
NOTE:

exec Applicant_delete_enrolled_proc 1
*/

create procedure Exam_delete_proc
	@Exam_code int
as
begin
	if not exists (select 1 from Exams where Exam_code = @Exam_code)
	begin
		raiserror('Error: this exam does not exist', 16, 1);
		return;
	end
	if exists (select 1 from Assessments where Assessment_exam_code = @Exam_code)
	begin
		print 'Warning: there is a assessnent for this exam. The assessnent is being deleted...'
		delete Assessments where Assessment_exam_code = @Exam_code
	end
	delete Exams where Exam_code = @Exam_code
end
go
/*
NOTE:

exec Exam_delete_proc 1
*/

create procedure Specialties_update_proc
as
begin
    update Specialties
    set Specialty_vacancies = Specialty_vacancies * 1.1;
end
go
/*
NOTE:

exec Specialties_update_proc
*/

create procedure Exam_update_proc
	@Exam_code int,
	@Exam_date date
as
begin
	if not exists (select 1 from Exams where Exam_code = @Exam_code)
	begin
		raiserror('Error: this exam does not exist', 16, 1);
		return;
	end
	update Exams set Exam_date = @Exam_date where Exams.Exam_code = @Exam_code
end
go
/*
NOTE:

exec Exam_update_proc 1, 2007-12-09
*/

create procedure Applicant_update_status_proc
	@Applicant_code int
as
begin
	if not exists (select 1 from Applicants where Applicant_code = @Applicant_code)
	begin
		raiserror('Error: this exam applicant not exist (in table Applicants)', 16, 1);
		return;
	end
	if not exists (select 1 from Statements where Statement_applicant_code = @Applicant_code)
	begin
		raiserror('Error: this exam applicant not exist (in table Statements)', 16, 1);
		return;
	end
	update Applicants set Applicant_status = 'Enrolled' where Applicant_code = @Applicant_code
	update Statements set Statement_status = 'Enrolled' where Statement_applicant_code = @Applicant_code
end
go
/*
NOTE:

exec Applicant_update_status_proc 1
*/