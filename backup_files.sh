#!/usr/bin/env sh
# Backs up a given set of directories and files into a gziped tar archive
# and deletes backups older than the configured retention time

# Configuration
backupTo=/backup/to/this/dir # Where the backups will be stored
backupTargets="/var/www /etc/example/config.ini" # What to back up
backupNamePrefix="weekly_file_backup_" # Prefix of the resulting .tar.gz
backupRetention=47520 # 33 days, delete backups older than x minutes

# Current date and time
backupDate=`date +%Y-%m-%d_%H-%M`

# Archive and compress the files
echo Backup from $backupTargets
echo to $backupTo
echo Backup started at $(date +"%T")
echo ""
tar -vcf "$backupTo"/"$backupNamePrefix""$backupDate".tar.gz -z $backupTargets
echo ""

# Delete old backups (and logs)
echo Deleting backups older than "$backupRetention" minutes
echo ""
find $backupTo -name "${backupNamePrefix}*" -cmin +$retentionMinutes | xargs -r rm -v
echo ""
echo Backup finished at $(date +"%T")
