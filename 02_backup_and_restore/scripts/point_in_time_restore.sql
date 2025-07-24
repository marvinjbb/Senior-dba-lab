-- Point-in-Time Restore of ProdDB
-- Step 1: Restore full backup
RESTORE DATABASE ProdDB_Restore
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Full.bak'
WITH NORECOVERY,
MOVE 'ProdDB' TO 'C:\SQLData\ProdDB_Restore.mdf',
MOVE 'ProdDB_log' TO 'C:\SQLData\ProdDB_Restore.ldf';

-- Step 2: Restore log backup to specific point in time
RESTORE LOG ProdDB_Restore
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Log.trn'
WITH STOPAT = '2025-07-23T10:00:00', RECOVERY;
