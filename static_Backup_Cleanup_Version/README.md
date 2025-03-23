
# 📦 Static Backup Script (Initial Version)

## Purpose
This is the **first version** of the backup script developed during the project.
It statically compresses and stores everything in a predefined directory regardless of changes.

---

## ⚙️ How It Works

## Backup.sh
- All files inside a fixed `source/` folder are compressed into a `.tar.gz` archive.
- The archive is saved in the `backups/` directory.
- Logs are generated for each backup operation in the `logs/` directory.

- A separate `cleanup.sh` script automatically deletes old backups and logs **older than 7 days**.
- Scripts can be run manually or scheduled with `cron`.

---

## Cleanup Logic

- The `cleanup.sh` script:
  - Scans `backups/` and `logs/` folders
  - Deletes `.tar.gz` and `.log` files older than 7 days
  - Logs cleanup activity under `cleanup/` directory

---

##  Use Case

This version is useful for:

- Practicing static backup operations
- Understanding the basics of Bash scripting
- Learning how to automate repetitive tasks with `cron`
- Implementing simple cleanup and log maintenance logic

---

## Limitations

- Always backs up everything in the `source/` folder, even if nothing changed
- Not suitable for very large directories or production use
- Paths are hardcoded and not dynamic
- No check for file changes (every run = full backup)

---

✅ Recommended only for **educational use and initial testing**.

