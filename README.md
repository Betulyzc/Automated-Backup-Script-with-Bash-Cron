#Backup and Cleanup Script  

This project provides a modular, Bash-based backup automation system with optional cleanup and cron job integration. 
It includes static and dynamic backup options, offering flexibility for different usage needs.

## Project Structure:

simple-backup/
│
├── dynamic_Backup_Cleanup_Version/    # Dynamic backup script (works in any directory)
│   ├── backup.sh
│   ├── cleanUp.sh
│   ├── backups/
│   ├── logs/
│   ├── skipLogs/
│   └── README.md
│
├── static_Backup_Cleanup_Version/      # Static backup script (uses hardcoded paths)
│   ├── backup.sh
│   ├── cleanUp.sh
│   ├── backups/
│   ├── logs/
│   └── cleanup/
│
├── non_bashed_dir_example_for_fdynamic/  # Example unstructured directory for before exucute dynamic.
│
├── imagesExample/                     # Screenshots for documentation
│   ├── crontab.jpg
│   ├── backups.jpg
│   └── cleanup.jpg
│
├── README.md                          # This file (project overview)
└── cron_debug.log                     # Cron job error output

## Versions:

🔹 Static Version
- Works only from a specific directory (e.g., /home/user/static_Backup_Cleanup_Version)
- Hardcoded backup & log paths
- Suitable for consistent and fixed environments
- Has a basic cleanup script
- **Static Version**:Backs up all files every time, regardless of changes.

🔹 Dynamic Version
- Can be placed and run from any directory
- Automatically excludes itself, logs, and backups
- Tracks file changes using timestamps
- Skips redundant backups and logs the skip events
- Advanced cleanup with multiple log types
- Easily integrable with crontab
- **Dynamic Version**:Backs up only modified or new files since the last backup.

## Technologies Used:
- Bash Scripting
- Cron Jobs
- tar + gzip
- find, touch, date

Getting Started:

To run a version:
chmod +x backup.sh cleanUp.sh
./backup.sh
./cleanUp.sh

To automate:
crontab -e

Example cron entry (every day at midnight):
0 0 * * * /path/to/your/dynamic_Backup_Cleanup_Version/backup.sh >> /path/to/cron_debug.log 2>&1


Notes:
- skipLogs/ are only created when no backup is performed.
- Cleanup scripts remove old backups and logs (default: 7 days).
- Errors from cron jobs are logged in cron_debug.log.

License:
This project was created for educational purposes and is open to improvements.
Feel free to fork and expand upon it!


