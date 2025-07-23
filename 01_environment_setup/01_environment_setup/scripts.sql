/* ===========================================================
   SQL Server DBA Lab - 01 Environment Setup
   Author: Marvin jb
   Date: 2025-07-23
   Description: 
       - Creates core databases (ProdDB, LogsDB, ReportsDB)
       - Sets up logins, users, and roles
       - Creates Sales table and inserts sample data
       - Configures SQL Agent jobs:
           * Backup_Job (daily full backup)
           * InsertSalesJob (insert random data every 5 mins)
   =========================================================== */

/* 1. Create Databases */
CREATE DATABASE ProdDB;
CREATE DATABASE LogsDB;
CREATE DATABASE ReportsDB;
GO

/* 2. Create Logins and Users */
USE master;
CREATE LOGIN Mary WITH PASSWORD = 'Password123!';
CREATE LOGIN John WITH PASSWORD = 'Password123!';
CREATE LOGIN Tom WITH PASSWORD = 'Password123!';
GO

USE ProdDB;
CREATE USER Mary FOR LOGIN Mary;
CREATE USER John FOR LOGIN John;
CREATE USER Tom FOR LOGIN Tom;
GO

/* Grant Role-Based Permissions */
EXEC sp_addrolemember 'db_datareader', 'Mary';
EXEC sp_addrolemember 'db_datawriter', 'Mary';

EXEC sp_addrolemember 'db_datareader', 'John';

EXEC sp_addrolemember 'db_datareader', 'Tom';
EXEC sp_addrolemember 'db_datawriter', 'Tom';
GO

/* 3. Create Sales Table */
USE ProdDB;
CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    Product NVARCHAR(50),
    Quantity INT,
    SaleDate DATETIME DEFAULT GETDATE()
);
GO

/* 4. Insert Initial Sample Data */
INSERT INTO Sales (Product, Quantity) VALUES 
('Laptop', 2),
('Monitor', 1),
('Keyboard', 5);
GO

/* 5. Configure SQL Agent Job - InsertSalesJob */

/* Step 5.1: Create Job */
USE msdb;
EXEC sp_add_job 
    @job_name = 'InsertSalesJob', 
    @enabled = 1,
    @description = 'Inserts random data into Sales table every 5 minutes';

/* Step 5.2: Add Job Step */
EXEC sp_add_jobstep 
    @job_name = 'InsertSalesJob',
    @step_name = 'Insert Random Sales Data',
    @subsystem = 'TSQL',
    @command = 'USE ProdDB;
                INSERT INTO Sales (Product, Quantity)
                VALUES (
                    CHOOSE(1, ''Laptop'', ''Monitor'', ''Keyboard'', ''Mouse'', ''Printer''),
                    FLOOR(RAND() * 10) + 1
                );';

/* Step 5.3: Create Schedule (every 5 minutes) */
EXEC sp_add_schedule 
    @schedule_name = 'InsertSalesSchedule',
    @freq_type = 4,               -- Daily
    @freq_interval = 1,           -- Every day
    @freq_subday_type = 4,        -- Minutes
    @freq_subday_interval = 5;    -- Every 5 minutes

/* Step 5.4: Attach Schedule to Job */
EXEC sp_attach_schedule 
    @job_name = 'InsertSalesJob', 
    @schedule_name = 'InsertSalesSchedule';

/* Step 5.5: Assign Job to Server */
EXEC sp_add_jobserver 
    @job_name = 'InsertSalesJob';
GO

/* 6. Configure SQL Agent Job - Backup_Job */

/* Step 6.1: Create Backup Job */
EXEC sp_add_job 
    @job_name = 'Backup_Job',
    @enabled = 1,
    @description = 'Performs full backup of ProdDB once per day';

/* Step 6.2: Add Job Step for Backup */
EXEC sp_add_jobstep 
    @job_name = 'Backup_Job',
    @step_name = 'Backup ProdDB',
    @subsystem = 'TSQL',
    @command = 'BACKUP DATABASE ProdDB
                TO DISK = ''C:\DBA_Backups\ProdDB_Full.bak''
                WITH INIT, COMPRESSION;';

/* Step 6.3: Create Schedule (daily at midnight) */
EXEC sp_add_schedule 
    @schedule_name = 'DailyBackupSchedule',
    @freq_type = 4,        -- Daily
    @freq_interval = 1,    -- Every day
    @active_start_time = 000000; -- 12:00 AM

/* Step 6.4: Attach Schedule to Backup Job */
EXEC sp_attach_schedule 
    @job_name = 'Backup_Job',
    @schedule_name = 'DailyBackupSchedule';

/* Step 6.5: Assign Backup Job to Server */
EXEC sp_add_jobserver 
    @job_name = 'Backup_Job';
GO
