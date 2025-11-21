/* first task */
create trigger Task1 on Students_table
for update
as
begin
	print 'Note was updated'
end;
go

/*
NOTE:

update Students_table set Students_table.Student_surname = 'Петров' where Students_table.Student_code = 1
*/

/* second task */
create trigger Task2 on Students_table
for insert, delete
as
begin
	print 'Quantity of bars was updated'
end;
go

/*
NOTE:

insert Students_table values('Иванов', 'Математика', 'Школа %5', 15.6)
*/

/* third task */
create trigger Task3 on Students_table
for insert, update, delete
as
begin
	print current_user + ' updated the table'
end;
go

/*
NOTE:

insert Students_table values('Гаврилов', 'Физика', 'Школа %58', 87.3)
*/

/* fourth task */
create trigger Task4 on Students_table
instead of update
as
begin
	print 'You cant update data'
end;
go

/* fifth task */
create table Students_K (
	Students_K_student_name nvarchar(50) not null,
	Students_K_date_of_deleting date not null,
);
go

create trigger Task5 on Students_table
for delete
as
begin
	insert Students_K
	select 
		deleted.Student_surname,
		getdate() as Students_K_date_of_deleting
	from deleted
end;
go

/*
NOTE:

delete Students_table where Students_table.Student_code = 5
*/

/* sixth task */
disable trigger Task5 on Students_table
--enable trigger Task5 on Students_table

/* seventh task */
/*drop trigger Task1
drop trigger Task2
drop trigger Task3
drop trigger Task4
drop trigger Task5*/