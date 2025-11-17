create table Academicians_table (
	Academicians_code int identity(1,1) not null primary key,
	Academicians_full_name nvarchar(100) not null,
	Academicians_date_of_birth date not null,
	Academicians_specialization nvarchar(50) not null,
	Academicians_year_of_awarding_the_title int not null
)