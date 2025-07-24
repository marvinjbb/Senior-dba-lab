/*
    FULL BACKUP SCRIPT FOR ProdDB
    This script creates a full backup of the ProdDB database with compression enabled.
*/

BACKUP DATABASE ProdDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Full.bak'
WITH INIT,             -- Overwrite existing backup file
     COMPRESSION,       -- Use backup compression to save space
     STATS = 10;        -- Show progress every 10%

/*
    DIFFERENTIAL BACKUP SCRIPT FOR ProdDB
    This script creates a differential backup capturing only the changes since the last full backup.
*/

BACKUP DATABASE ProdDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Diff.bak'
WITH DIFFERENTIAL,      -- Take a differential backup
     INIT,              -- Overwrite existing backup file
     COMPRESSION, 
     STATS = 10;

     /*
    TRANSACTION LOG BACKUP SCRIPT FOR ProdDB
    This script backs up the transaction log to enable point-in-time restores.
*/

BACKUP LOG ProdDB
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Log.trn'
WITH INIT,              -- Overwrite existing log backup file
     COMPRESSION,
     STATS = 10;

/*
    POINT-IN-TIME RESTORE SCRIPT FOR ProdDB
    This script restores ProdDB to a new database (ProdDB_Restore) and recovers data up to a specific point in time.
*/

-- STEP 1: Restore full backup (leave DB in NORECOVERY mode to apply log backups)
RESTORE DATABASE ProdDB_Restore
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Full.bak'
WITH NORECOVERY,
     MOVE 'ProdDB' TO 'C:\SQLData\ProdDB_Restore.mdf',
     MOVE 'ProdDB_log' TO 'C:\SQLData\ProdDB_Restore.ldf';

-- STEP 2: Restore log backup up to a specific time
RESTORE LOG ProdDB_Restore
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVERSENIOR\MSSQL\Backup\ProdDB_Log.trn'
WITH STOPAT = '2025-07-23T10:00:00',  -- Restore to this exact date/time
     RECOVERY;                        -- Bring the database online
