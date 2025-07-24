# 03_automation – SQL Agent Jobs and Alerts

## Objectives
- Automate essential DBA tasks using SQL Server Agent.
- Create and schedule backup jobs (full, differential, and transaction log backups).
- Simulate a workload using a recurring data insert job.
- Configure Database Mail and Operators for job failure alerts.
- Track and document job history for monitoring and troubleshooting.

## Tasks Completed
1. **Backup Job**  
   - Created a SQL Agent job (`backup_job.sql`) that performs daily full backups, differential backups, and frequent transaction log backups.
2. **Data Insert Job**  
   - Built a SQL Agent job (`data_insert_job.sql`) to insert sample records into the `Sales` table every 5 minutes to simulate activity.
3. **Database Mail Configuration**  
   - Configured Database Mail with Gmail SMTP for email notifications.
4. **Operator Alerts**  
   - Created a `DBA_Operator` to receive email alerts when jobs fail.
5. **Verification**  
   - Checked job history to confirm successful runs and tested Database Mail notifications.

## Scripts Used
- `backup_job.sql` – Automates full, differential, and log backups.
- `data_insert_job.sql` – Inserts workload data into `Sales`.
- `job_creation.sql` – Creates and schedules SQL Agent jobs with notifications.

## Screenshots
- `sql_agent_job.png` – SQL Agent job setup.
- `job_history.png` – Job execution history.
- `db_mail_alert.png` – Confirmation of successful Database Mail test.

## Lessons Learned
- SQL Agent significantly reduces manual workload by automating backups and data inserts.
- Database Mail and Operators ensure timely alerts for proactive issue resolution.
- Regular job history reviews are crucial for detecting failures early and maintaining system reliability.
