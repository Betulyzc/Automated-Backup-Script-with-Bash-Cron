#!/bin/bash


# Settings

cd /home/beti/simple-backup

mkdir -p /home/beti/simple-backup/logs
mkdir -p /home/beti/simple-backup/backups

Source_Directory="/home/beti/simple-backup/source"
Backup_Directory="/home/beti/simple-backup/backups"
Log_Directory="/home/beti/simple-backup/logs"

Date=$(date +"%Y-%m-%d_%H-%M-%S") #Date was used for unique records.

Backup_File="$Backup_Directory/backup_$Date.tar.gz"
Log_File="$Log_Directory/backup_$Date.log"

echo "[$Date] Backup start." > "$Log_File"

if [ ! -d "$Source_Directory" ] ; then
	echo "Error : Source directory not found! Backup aborted." >> "$Log_File"
	exit 1
fi


tar -czf "$Backup_File" "$Source_Directory"  >> "$Log_File" 2>&1

if [ $? -eq 0 ]; then
	echo "Success: $Backup_File created" >> "$Log_File"
else
	echo  "Error occurred:Backup failed!" >> "$Log_File"
	exit 1
fi

echo "[$Date] Backup completed. " >> "$Log_File"



