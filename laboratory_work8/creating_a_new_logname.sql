sp_addlogin 'Michael S.', 'new_millenium_cyanide_christ1998_11_10_1En$_K1Dman'

--sp_addsrvrolemember 'Michael S.', 'securityadmin'
/*
NOTE:
the command above is outdated, it doesn't work
*/

alter server role [securityadmin] add member [Michael S.];
go
/*
NOTE:
and this one will work normally
*/

exec sp_helprole
go
/*
NOTE:
old command, but it still works. If you want to be modern,
so use that:

select name as [Role name]
from sys.database_principals
where type = 'R';
*/

sp_adduser 'Mike_SQL', 'Michael S.'
alter server role [db_datareader] add member [Michael S.];
go

grant select on Applicants to [Michael S.]
go

grant update on Applicants(Applicant_surname, Applicant_name, Applicant_patronymic) to [Michael S.]
go

exec sp_helpsrvrolemember 'dbcreator';
go

exec sp_helpsrvrole 'securityadmin';
go
/*
NOTE:
that is task 11 from pdf document
*/

exec sp_password 
    @old = 'new_millenium_cyanide_christ1998_11_10_1En$_K1Dman',
    @new = 'new_millenium_cyanide_christ1998_11_10_1En$_K1Dman1',
    @loginame = 'Michael S.';
go
/*
NOTE:
that is task 12 from pdf document
*/

sp_addlogin 'Michael_task13', 'moshEW(inverted)1Z(invertedfor())eM!)@(#*$&%^'
exec sp_addrolemember 'Michael_task13', 'dbcreator'
go
/*
NOTE:
that is task 13 from pdf document
*/

create user manager for login Michael_task13;
exec sp_helpuser
go
/*
NOTE:
that is task 14 from pdf document
*/

exec sp_addrolemember 'db_datareader', 'manager';
exec sp_helprolemember 'db_datareader';
/*
NOTE:
that is task 15 from pdf document
*/

exec sp_addrolemember 'db_denydatareader', 'manager';
exec sp_helprolemember 'db_datareader';
/*
NOTE:
that is task 16 from pdf document
*/
