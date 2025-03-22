
#!/bin/bash

cd /home/beti/simple-backup

Backup_Directory="/home/beti/simple-backup/backups"
Log_Directory="/home/beti/simple-backup/logs"
Cleanup_Log_Directory="/home/beti/simple-backup/cleanup"

mkdir -p "$Backup_Directory"
mkdir -p "$Log_Directory"
mkdir -p "$Cleanup_Log_Directory"

Date=$(date +"%Y-%m-%d_%H:%M:%S")

Old_Backups=$(find "$Backup_Directory" -type f -name "*.tar.gz" -mtime +7 )
Old_Logs=$(find "$Log_Directory" -type f -name "*.log" -mtime +7 )

if [ -z "$Old_Backups" ] && [ -z "$Old_Logs" ]; then 
	echo "[$Date] No old backup or log files found. Nothing to clean up." >> "$Cleanup_Log_Directory/cleanup_$Date.log"
	exit 0
fi

#Removing
find "$Backup_Directory" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
find "$Log_Directory" -type f -name "*.log" -mtime +7 -exec rm {} \;

cat <<EOF >> "$Cleanup_Log_Directory/cleanup_$Date.log"
--------------------------------------------------

[$Date] Cleanup Completed.

Deleted backup files:
$Old_Backups

Deleted log files:
$Old_Logs

--------------------------------------------------
EOF

