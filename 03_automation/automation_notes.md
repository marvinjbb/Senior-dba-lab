# 03_automation – SQL Server Agent Jobs and Alerts

## Objectives
- Automate core DBA tasks using SQL Server Agent.
- Schedule database backups (full, differential, and log backups).
- Simulate a real workload using a recurring data insert job.
- Configure Database Mail and Operators for proactive job failure alerts.
- Verify and document job history, notifications, and configurations.

---

## Tasks Completed

### 1. Backup Job
- Created a SQL Agent backup job to automate:
  - Full backups (once daily).
  - Differential backups (every 4 hours).
  - Transaction log backups (every 15 minutes).
- Verified the backup files in `C:\SQLBackups\`.

---

### 2. Data Insert Job (Workload Simulation)
- Created a `Sales` table (if not already present).
- Built a SQL Agent job to insert sample data every 5 minutes.
- Used this job to simulate activity for backup and monitoring tests.

---

### 3. Database Mail Configuration
- Configured Database Mail in SQL Server Management Studio (SSMS):
  - Created a new mail account using Gmail SMTP (smtp.gmail.com, port 587, SSL/TLS).
  - Tested Database Mail successfully with a test email.

**Screenshot:**  
- db_mail_alert.png – Test email success.

---

### 4. Operator Setup
- Created a DBA_Operator:
  - Configured email address for alerts.
  - Linked to Database Mail for job failure notifications.

---

### 5. Job Alerts
- Configured SQL Agent jobs to:
  - Send an email to DBA_Operator on failure.
  - Document alerts and errors in job history.

---

### 6. Job History Review
- Verified job history via SSMS > SQL Server Agent > Jobs > View History.
- Confirmed:
  - Backup job ran successfully.
  - Data insert job ran every 5 minutes.
  - Failure alerts (via Database Mail) worked as expected.

**Screenshot:**  
- job_history.png – Job execution history.

---

### 7. SQL Scripts
- backup_job.sql – Full, differential, and log backups.
- data_insert_job.sql – Simulates database activity with data inserts.
- job_creation.sql – Creates and schedules jobs with operator notifications.

---

### 8. Final Verification
- Manually tested:
  - Database Mail by sending test emails.
  - Triggered job failures (by using invalid paths) to confirm alert emails.
- Confirmed successful integration of SQL Agent jobs with alerts.

**Screenshot:**  
- sql_agent_job.png – Job setup in SSMS.

---

## Lessons Learned
- SQL Server Agent automates recurring tasks (backups, data inserts) efficiently.
- Database Mail and Operators provide proactive monitoring of job failures.
- Reviewing job history is essential for troubleshooting and confirming success.
- A mix of scripts (T-SQL) and GUI configurations (SSMS) is needed for full automation and alerting.
