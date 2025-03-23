# 🔁 Dynamic Backup & Cleanup Script 

This project provides a **dynamic backup and cleanup solution** written in **Bash**, designed to work inside any directory — **no hardcoded paths**.
It detects changed files since the last backup, compresses them, and saves logs of operations. Designed for automation with **cron**.

## 🚀 Features

-  **Change Detection**: Only backs up files modified since the last run
-  **Compression**: Archives changed files into `.tar.gz` format
-  **Skip Log**: Tracks when no files changed, skipping unnecessary backups
-  **Automatic Cleanup**:
  - Deletes backups & logs older than 7 days
  - Removes old `skipLogs` and `cleanup` logs too
-  **Cron Compatible**: Easily schedule with `crontab` for full automation
-  **Dynamic & Portable**: Works wherever you place the folder


## 🧪 How to Use

### 1. Make scripts executable

chmod +x backup.sh cleanUp.sh


### 2. Run backup manually

./backup.sh

### 3. Run cleanup manually

./cleanUp.sh


### 4.Automate Backups Using Crontab

You can automate the backup process using crontab, which allows the script to run at regular intervals (e.g., every 5 minutes).

Note: Crontab is user-specific, so each user must set it up individually.

This ensures backups run automatically in the background without manual effort

## License
Created for educational purposes. Feel free to improve and customize it for your own needs!
