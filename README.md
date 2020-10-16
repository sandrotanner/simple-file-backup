# Simple file backup
![ShellCheck](https://github.com/sandrotanner/simple-file-backup/workflows/ShellCheck/badge.svg)

Backs up a given set of directories and files into a gziped tar archive and **deletes** backups older than the configured retention time.

## Example usage (crontab)
```
0 4 */7 * * sh /path/to/backup_files.sh > /media/backups/weekly_file_backup_$(date +"%Y-%m-%d_%H-%M").log 2>&1
```
If you use the same prefix for the output of the script as you use in `$bakupNamePrefix` and store it in the same place, the script will also delete old logs for you.
