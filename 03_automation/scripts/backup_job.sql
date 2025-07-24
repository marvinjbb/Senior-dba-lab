-- Full Backup of ProdDB
BACKUP DATABASE ProdDB
TO DISK = 'C:\SQLBackups\ProdDB_Full.bak'
WITH INIT, COMPRESSION, STATS = 10;

-- Differential Backup of ProdDB
BACKUP DATABASE ProdDB
TO DISK = 'C:\SQLBackups\ProdDB_Diff.bak'
WITH DIFFERENTIAL, INIT, COMPRESSION, STATS = 10;

-- Transaction Log Backup of ProdDB
BACKUP LOG ProdDB
TO DISK = 'C:\SQLBackups\ProdDB_Log.trn'
WITH INIT, COMPRESSION, STATS = 10;
