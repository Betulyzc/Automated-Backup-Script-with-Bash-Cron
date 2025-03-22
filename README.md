# Automated Backup Automation with Bash & Cron

## Project Description

This project contains a Bash script that automatically backs up files from a specified directory.
The script runs at set intervals, compressing files and logging the backup process.
Additionally, it can be scheduled using cron jobs, ensuring automated backups without manual intervention.

## Technologies Used

- Bash Scripting (Automating backup operations)
- tar & gzip (Compressing files)
- Cron Job (Running the script periodically)
- Linux File Management

## How the Script Works

1) When the script starts, it ensures the correct working directory is set.
2) If missing, required folders (logs/, backups/) are automatically created.
3) Backup and log filenames are generated based on the current date.
4) The source directory (source/) is checked; if missing, the script exits with an error.
5) All files are compressed into a .tar.gz archive and stored in backups/.
6) If the backup is successful, a log entry is recorded.
7) Every operation is logged for easier debugging and monitoring.


 ##  Installation
1) Clone the Repository
git clone https://github.com/your-username/simple-backup.git
cd simple-backup

2) Grant Execution Permission to the Script
chmod +x backup.sh

3) Run the Script Manually For Controlling
bash backup.sh

4) Automate the Script with Cron Job
crontab -e

5) Check Log Files
cat logs/backup_*.log

6) To check for any errors in cron jobs, use:
cat cron_debug.log

## License
This project was created for educational purposes.

