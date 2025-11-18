create table Countries (
    Country_code int identity(1,1) not null primary key,
    Country_name nvarchar(50) not null,
    Country_capital nvarchar(50) not null,
    Country_area int not null,
    Country_population bigint not null,
    Country_continent nvarchar(20) not null
);