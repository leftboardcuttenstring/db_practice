begin try
    dbcc checkdb(N'my_new_batabase') with no_infomsgs;
    print 'The database is okay';
end try
begin catch
    print 'You have some troubles with the database';
    return
end catch

/*backup database my_new_batabase
to disk = 'D:\Documents\college\mdk1101\backups\my_database_backup.bak'
with differential, compression

other ways to make a backup (differential backup)
*/

/*backup log my_new_batabase
to disk = 'D:\Documents\college\mdk1101\backups\my_database_backup.bak'
with compression;

other ways to make a backup (log backup)
*/

dbcc checkdb (N'my_new_batabase') with no_infomsgs
go
declare @sql nvarchar(max) = N'';
select @sql += N'alter index ' + quotename(i.name)
    + ' on ' + quotename(s.name) + '.' + quotename(t.name)
    + ' rebuild with (online = off);' + char(13)
from sys.indexes i
join sys.tables t ON i.object_id = t.object_id
join sys.schemas s ON t.schema_id = s.schema_id
where i.type_desc <> 'heap';

exec (@sql);

backup database my_new_batabase
to disk = 'D:\Documents\college\mdk1101\backups\my_database_backup.bak'
with init, compression
go


/*RESTORE DATABASE my_new_batabase_copy
FROM DISK = 'D:\backups\mydb.bak'
WITH 
    MOVE 'my_new_batabase' TO 'D:\MSSQL\DATA\my_new_batabase_copy.mdf',
    MOVE 'my_new_batabase_log' TO 'D:\MSSQL\DATA\my_new_batabase_copy_log.ldf',
    REPLACE;
*/





/*CREATE TABLE BackupLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    BackupDate DATETIME NOT NULL DEFAULT(GETDATE()),
    DatabaseName NVARCHAR(200),
    BackupPath NVARCHAR(500),
    Status NVARCHAR(50),
    Message NVARCHAR(MAX)
);


EXEC sp_MSforeachdb 'USE ?; EXEC sp_updatestats;';
*/