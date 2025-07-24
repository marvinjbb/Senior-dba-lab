-- Transaction Log Backup of ProdDB
BACKUP LOG ProdDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Log.trn'
WITH INIT, COMPRESSION, STATS = 10;
