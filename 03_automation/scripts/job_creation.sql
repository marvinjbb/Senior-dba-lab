USE msdb;
GO

-- Create the Daily Backup Job
EXEC sp_add_job @job_name = N'Daily Backup Job';

-- Add job step
EXEC sp_add_jobstep
    @job_name = N'Daily Backup Job',
    @step_name = N'Full Backup',
    @subsystem = N'TSQL',
    @command = N'BACKUP DATABASE ProdDB 
                 TO DISK = ''C:\SQLBackups\ProdDB_Full.bak''
                 WITH INIT, COMPRESSION, STATS = 10;';
                 
-- Add job schedule
EXEC sp_add_schedule
    @schedule_name = N'Daily 1AM',
    @freq_type = 4,         -- Daily
    @freq_interval = 1,     -- Every day
    @active_start_time = 010000;  -- 1:00 AM

-- Attach schedule to job
EXEC sp_attach_schedule 
    @job_name = N'Daily Backup Job', 
    @schedule_name = N'Daily 1AM';

-- Add notification to Operator
EXEC msdb.dbo.sp_notify_operator
    @profile_name = N'Database Mail Profile',
    @operator_name = N'DBA_Operator',
    @body = N'Backup job status notification.';
