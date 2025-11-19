/* first example */
create table Control_table (
	Control_code int,
	Control_type varchar(20)
);
go

/* second example */
drop table Control_table;
go

/* third example */
create table Control_table (
	Control_code int unique,
	Control_type varchar(20) not null
);
go

/* fourth example */
create table Control_table_with_check (
	Control_code int check(Control_code < 200),
	Control_type varchar(20) default 'Presidential republic'
);
go

/* fifth example */
create table Control_table_with_primary_key (
	Control_code int primary key identity(5,3),
	Control_type varchar(20)
);
go