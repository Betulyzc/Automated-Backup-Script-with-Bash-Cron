
#!/bin/bash


# Settings

Script_Directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$Script_Directory"

Source_Directory="$Script_Directory"
Backup_Directory="$Script_Directory/backups"
Log_Directory="$Script_Directory/logs"
Timestamp_File="$Script_Directory/.last_backup_time"
SkipLog_Directory="$Script_Directory/skipLogs"

mkdir -p "$SkipLog_Directory"
mkdir -p "$Log_Directory"
mkdir -p "$Backup_Directory"
#mkdir -p "$Source_Directory"


Date=$(date +"%Y-%m-%d_%H-%M-%S") #Date was used for unique records.

Backup_File="$Backup_Directory/backup_$Date.tar.gz"
Log_File="$Log_Directory/backup_$Date.log"
SkipLog_File="$SkipLog_Directory/skip_$Date.log"

if [ ! -f "$Timestamp_File" ]; then 
	echo "[$Date] Timestamp file not found.Creating first one... " >> "$Log_File"
	touch -d "1970-01-01" "$Timestamp_File"
fi


Changed_Files=$(find "$Script_Directory" -mindepth 1 \
	! -path "$Backup_Directory/*" \
	! -path "$Log_Directory/*" \
	! -path "$Timestamp_File" \
	! -name "$(basename "$0")" \
	-type f -newer "$Timestamp_File")

if [ -z "$Changed_Files" ];then
	echo "[$Date] No new or modified files found. Skipping backup." >> "$SkipLog_File" 2>&1	
	exit 0
else
	echo "[$Date] Backup start" >> "$Log_File"	
	tar -czf "$Backup_File" $Changed_Files  >> "$Log_File" 2>&1
	if [ $? -eq 0 ]; then
        	echo "Success: $Backup_File created" >> "$Log_File"
        	touch "$Timestamp_File"
	else
        	echo  "Error occurred:Backup failed!" >> "$Log_File"
        	exit 1
	fi
	echo "[$Date] Backup completed. " >> "$Log_File"
fi





