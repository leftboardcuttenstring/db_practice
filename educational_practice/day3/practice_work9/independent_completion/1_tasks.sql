/* first task */
create table Control_Strangewood (
	Control_code int primary key identity(1, 1),
	Control_type varchar(20) default 'Democracy'
);
go

/* second task */
create table Countries_Strangewood (
	Country_code int primary key identity(1, 1),
	Country_name varchar(20) not null,
	Country_population int check(Country_population < 500000000)
);
go

/* third task */
create table Flowers_Strangewood (
	Flower_code int primary key identity(1, 1),
	Flower_ID int unique,
	Flower_class varchar(20) default 'Dicotyledons'
);
go

/* fourth task */
create table Animals_Strangewood (
	Animal_code int primary key identity(1, 1),
	Animal_ID int unique,
	Animal_class varchar(20) default 'Predatory'
);
go

