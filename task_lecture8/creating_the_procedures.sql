/*
NOTE:

The teacher's PDF condition doesn't match the database 
the students currently have. For example, the PDF file 
mentions fields and table columns like "group name," 
"student absences," and so on. None of this is present, 
and as the teacher said, that's normal. It's normal 
for the condition to be inconsistent with the database 
you currently have, in which case you WILL have to 
invent an SQL query yourself. So, the solution below 
is my personal interpretation.

How to make your own interpretation of the condition 
applicable to the database: first, you don't need to 
create a new database, nor do you need new tables. 
Then, you apply the PDF condition to the existing database 
so that the functionality is similar, but the names are 
different (because you simply have a different database).

That is, if your condition says "display the number of 
student groups," you do something like "display the 
number of applicants." Thus, the code functionally does 
not differ much, and this is considered an acceptable 
solution.
*/

create procedure pr1_procedure
	@Applicant_name nvarchar(50)
as
	select * from Applicants
	where Applicants.Applicant_name = @Applicant_name
go

/*
DISCRIPTION:
the 'pr1' is the first procedure from PDF-document from
the teacher

exec pr1 'Ivan'
*/

create procedure Find_an_applicant_with_a_predefined_name_procedure
	@Applicant_name nvarchar(50) = 'Peter'
as
	select * from Applicants
	where Applicants.Applicant_name = @Applicant_name
go
/*
DISCRIPTION:
This procedure was written by me. Its purpose is to search 
for applicants based on a pre-defined string (specified as 
a predefined argument). You can substitute any name for 
'Peter'.

exec Find_peter_proc
*/

create procedure Set_exam_date_procedure
	@Exam_code date,
	@New_date date
as
	update Exams set Exams.Exam_date = @New_date
	where Exams.Exam_code = @Exam_code
go
/*
DISCRIPTION:
My own interpretation of the procedure, based on the condition. 
I recommend double-checking it before executing it—in case this 
(my) version doesn't work for you.

exec Set_exam_date_proc '2024-07-08', 9
*/

create procedure Increase_assessment_procedure
	@Assessment_code int
as
	update Assessments set Assessments.Assessment_assessment = Assessments.Assessment_assessment + 1
	where Assessments.Assessment_code = @Assessment_code
go
/*
DISCRIPTION:
My own interpretation of the procedure, based on the condition. 
I recommend double-checking it before executing it—in case this 
(my) version doesn't work for you.

exec Increase_assessment_procedure 5
*/

create procedure Select_average_assessment_procedure
	@Applicant_code itnt
as
	select avg(S.Assessment_assessment) as Average_assessment from Assessments as S
		where S.Assessment_applicant_code = @Applicant_code
go
/*
DISCRIPTION:
My own interpretation of the procedure, based on the condition. 
I recommend double-checking it before executing it—in case this 
(my) version doesn't work for you.

exec Select_average_assessment_procedure 5
*/

create procedure Select_assessment_by_exam_code_and_applicant_code_proceture
	@Applicant_code int,
	@Exam_code int
as
	select S.Assessment_assessment from Assessments as S
	where S.Assessment_applicant_code = @Applicant_code and
		S.Assessment_exam_code = @Exam_code
go
/*
DISCRIPTION:
My own interpretation of the procedure, based on the condition. 
I recommend double-checking it before executing it—in case this 
(my) version doesn't work for you.

exec Select_average_assessment_procedure 5
*/