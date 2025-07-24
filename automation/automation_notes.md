# 03_automation – SQL Agent Jobs and Alerts

## Objectives
- Automate key DBA tasks using SQL Server Agent.
- Schedule backup jobs for full, differential, and transaction log backups.
- Simulate database activity using a recurring data insert job.
- Configure Database Mail and Operators to receive job failure alerts.
- Document job configuration, history, and alert testing.

## Tasks Completed
1. **Backup Job**  
   - Created a SQL Agent job (`backup_job.sql`) that runs full, differential, and transaction log backups automatically.
2. **Data Insert Job**  
   - Implemented a SQL Agent job (`data_insert_job.sql`) to insert records into the `Sales` table every 5 minutes to simulate database workload.
3. **Database Mail Setup**  
   - Configured Database Mail using Gmail SMTP for sending notifications.
4. **Operator Alerts**  
   - Added `DBA_Operator` to receive emails when job failures occur.
5. **Verification**  
   - Tested Database Mail with a sample email.
   - Reviewed job history to ensure successful runs.

## Scripts Used
- `backup_job.sql` – Automates backup operations (full, differential, and transaction logs).
- `data_insert_job.sql` – Inserts test data into the `Sales` table.
- `job_creation.sql` – Creates and schedules SQL Agent jobs, linking them with Database Mail alerts.

## Screenshots
- `sql_agent_job.png` – Shows the SQL Agent job configuration.
- `job_history.png` – Displays the history of job executions.
- `db_mail_alert.png` – Demonstrates successful Database Mail test alerts.

## Lessons Learned
- SQL Server Agent is a powerful tool for automating critical DBA tasks like backups and data inserts.
- Configuring Database Mail and Operators ensures immediate awareness of job failures.
- Regular monitoring of job history improves reliability and helps identify problems early.
