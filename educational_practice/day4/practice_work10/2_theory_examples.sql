/* first example */
create table Students_table (
	Student_code int primary key identity(1,1),
	Student_surname varchar(50) not null,
	Student_subject varchar(50) not null,
	Student_school varchar(50) not null,
	Student_score float check ((Student_score >= 0) 
		and (Student_score <= 100)) null
);
go

/* second example */
insert into 
	Students_table 
	(Students_table.Student_surname, Students_table.Student_subject, Students_table.Student_school, Students_table.Student_score) 
	values (N'Маркин', N'Физика', N'Гимназия', 96);
go

/* third example */
insert into 
	Students_table 
	(Students_table.Student_surname, Students_table.Student_subject, Students_table.Student_school, Students_table.Student_score) 
	values (N'Никишина', N'Химия', N'Лицей', 77),
		(N'Андреев', N'Математика', N'Школа №18', NULL);
go

/* fourth example */
update 
	Students_table 
	set Students_table.Student_score = 87 
	where Students_table.Student_surname = N'Андреев';
go

/* fifth example */
update 
	Students_table 
	set Students_table.Student_school = N'Школа №31',
		Students_table.Student_subject = N'Математика'
	where Student_surname = N'Андреев';
go

/* sixth example */
update 
	Students_table
	set Students_table.Student_score = Students_table.Student_score - 5
	where Students_table.Student_subject = N'Математика';
go

/* seventh example */
delete from
	Students_table
	where Students_table.Student_school = N'Школа №18';
go

/* eighth example */
/*create table Lyceum_students_table (
	Student_code int primary key identity(1,1),
	Student_surname varchar(50) not null,
	Student_subject varchar(50) not null,
	Student_school varchar(50) not null,
	Student_score float check ((Student_score >= 0) 
		and (Student_score <= 100)) null
)*/

select
	Student_code,
	Student_surname,
	Student_subject,
	Student_school,
	Student_score
	into Lyceum_students_table
	from Students_table
	where Students_table.Student_school = N'Лицей';
go


/* ninth example */
truncate table Lyceum_students_table;
go
