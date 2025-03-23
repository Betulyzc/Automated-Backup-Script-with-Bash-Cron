
#!/bin/bash

Script_Dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$Script_Dir"


Backup_Directory="$Script_Dir/backups"
Log_Directory="$Script_Dir/logs"
Cleanup_Log_Directory="$Script_Dir/cleanup"
SkipLog_Directory="$Script_Dir/skipLogs"

mkdir -p "$Backup_Directory"
mkdir -p "$Log_Directory"
mkdir -p "$Cleanup_Log_Directory"
mkdir -p "$SkipLog_Directory"

Date=$(date +"%Y-%m-%d_%H-%M-%S")


Old_Backups=$(find "$Backup_Directory" -type f -name "*.tar.gz" -mtime +7)
Old_Logs=$(find "$Log_Directory" -type f -name "*.log" -mtime +7)
Old_SkipLogs=$(find "$SkipLog_Directory" -type f -name "*.log" -mtime +7) 
Old_CleanupLogs=$(find "$Cleanup_Log_Directory" -type f -name "*.log" -mtime +7)

if [ -z "$Old_Backups" ] && [ -z "$Old_Logs" ] && [ -z "$Old_SkipLogs" ] && [ -z "$Old_CleanupLogs" ]; then
    echo "[$Date] No old backup or log files found. Nothing to clean up." >> "$Cleanup_Log_Directory/cleanup_$Date.log"
    exit 0
fi


find "$Backup_Directory" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;
find "$Log_Directory" -type f -name "*.log" -mtime +7 -exec rm {} \;
find "$SkipLog_Directory" -type f -name "*.log" -mtime +7 -exec rm {} \;
find "$Cleanup_Log_Directory" -type f -name "*.log" -mtime +7 -exec rm {} \;


cat <<EOF >> "$Cleanup_Log_Directory/cleanup_$Date.log"
--------------------------------------------------

[$Date] Cleanup Completed.

Deleted backup files:
$Old_Backups

Deleted log files:
$Old_Logs

Deleted skip log files:
$Old_SkipLogs

Deleted old cleanup logs:
$Old_CleanupLogs


--------------------------------------------------
EOF
