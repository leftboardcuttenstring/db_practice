/* first task */
insert into 
	Students_table 
	(Students_table.Student_surname, Students_table.Student_subject, Students_table.Student_school, Students_table.Student_score) 
	values (N'Трошкова', N'Химия', N'Школа №18', null);
go

/* second task */
insert into 
	Students_table 
	(Students_table.Student_surname, Students_table.Student_subject, Students_table.Student_school, Students_table.Student_score) 
	values (N'Кондратьев', N'Информатика', N'Школа №15', 77),
		(N'Петров', N'Физика', N'Школа №17', null),
		(N'Гаврилов', N'Изобразительное искусство', N'Школа №12', null);
go

/* third task */
update 
	Students_table 
	set Students_table.Student_school = N'Школа №21',
		Students_table.Student_subject = N'Математика',
		Students_table.Student_score = 56
	where Students_table.Student_surname = N'Трошкова';
go

/* fourth task */
update 
	Students_table
	set Students_table.Student_score = Students_table.Student_score + ((Students_table.Student_score / 100) * 10)
	where Students_table.Student_subject = N'Химия'
		and Students_table.Student_score < 60;
go

/* fifth task */
delete from
	Students_table
	where Students_table.Student_school = N'Школа №21';
go

/* sixth task */
select
	Student_code,
	Student_surname,
	Student_subject,
	Student_school,
	Student_score
	into High_school_students_table
	from Students_table
	where Students_table.Student_score < 60;
go

/* seventh task */
truncate table High_school_students_table;
go