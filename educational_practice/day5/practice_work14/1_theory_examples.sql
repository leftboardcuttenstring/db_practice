/* first example */
create trigger Example1 on Students_table
for insert
as
begin
	print 'Note was added'
end;
go

/* second example */
create trigger Example2 on Students_table
after delete
as
begin
	print 'Note was deleted'
end;
go

/* third example */
create trigger Example3 on Students_table
for insert, update, delete
as
begin
	print 'Table was modifyed'
end;
go

/* fourth example */
create trigger Example4 on Students_table
instead of delete
as
begin
	print 'You cant delete data'
end;
go

/* fifth example */
create table Students_archive_table (
	Student_archive_code int not null,
	Student_archive_full_name varchar(50) null,
	Student_archive_subject varchar(50) null,
	Student_archive_school varchar(50) null,
	Student_archive_score float null,
	Student_archive_deleted datetime NOT null
);
go

create trigger Example5 on Students_table
for delete
as
begin
	insert Students_archive_table
	select 
		deleted.Student_code,
		deleted.Student_surname,
		deleted.Student_subject,
		deleted.Student_school,
		deleted.Student_score,
		getdate() as Deleted
	from deleted
end;
go

/* sixth example */
disable trigger Example5 on Students_table
--enable trigger Example5 on Students_table

/* seventh example */
drop trigger Example5