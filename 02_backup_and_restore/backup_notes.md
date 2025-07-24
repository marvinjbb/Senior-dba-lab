# 02_backup_and_restore – Backup and Restore Strategies

## **Overview**
This phase focuses on designing and implementing professional backup and restore strategies for SQL Server. The primary goal is to ensure database recoverability, practice point-in-time restores, and perform routine maintenance to manage backup files. This simulates a real-world DBA workflow where backup validation and data recovery scenarios are critical for production readiness.

---

## **Tasks Completed**
- Configured **full backup** jobs for `ProdDB`.
- Implemented **differential backups** every 4 hours.
- Scheduled **transaction log backups** every 15 minutes.
- Verified backup integrity using `RESTORE VERIFYONLY`.
- Restored `ProdDB` to a **test database (`ProdDB_Restore`)** for validation.
- Performed **point-in-time restore** to recover deleted data.
- Manually cleaned up old backups and explored automated cleanup options.
- Documented all scripts and tested them in a real environment.

---

## **Key SQL Commands**
All backup and restore commands are placed in the `scripts` folder:

- [**full_backup.sql**](scripts/full_backup.sql) – Script for creating full backups.
- [**diff_backup.sql**](scripts/diff_backup.sql) – Script for differential backups.
- [**log_backup.sql**](scripts/log_backup.sql) – Script for transaction log backups.
- [**point_in_time_restore.sql**](scripts/point_in_time_restore.sql) – Script for point-in-time restores.

---

## **Screenshots**
All screenshots are stored in the `screenshots` folder:
- **backup_job.png** – SQL Agent job for backup configuration.
- **verify_backup.png** – Successful `RESTORE VERIFYONLY` operation.
- **restore_point.png** – Point-in-time restore confirmation.
- **backup_folder.png** – Folder structure with generated `.bak` files.

---

## **Lessons Learned**
- A backup is only as valuable as your ability to **restore** it — always test your backups.
- **Transaction log backups** are essential for point-in-time recovery in high-transaction environments.
- **Timestamped backup files** simplify identifying the correct backup chain during recovery.
- Regularly cleaning up old backups prevents storage issues on production servers.
- Automating backups and verification improves **DBA efficiency** and reduces human error.

---

