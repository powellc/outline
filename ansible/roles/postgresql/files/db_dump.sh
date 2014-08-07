#!/bin/bash
# Location to place backups.
backup_dir="/var/backups/databases/"
nightly_dir="/var/backups/databases/latest/"
#String to append to the name of the backup files
backup_date=`date +%d-%m-%Y`
#Numbers of days you want to keep copie of your databases
number_of_days=15
databases=`psql -l -t | cut -d'|' -f1 | sed -e 's/ //g' -e '/^$/d'`
for i in $databases; do  if [ "$i" != "postgres" ] && [ "$i" != "template0" ] && [ "$i" != "template1" ] && [ "$i" != "template_postgis" ]; then    
    echo Dumping $i to $backup_dir$i\_$backup_date.sql
    pg_dump $i > $backup_dir$i\_$backup_date.sql
    bzip2 $backup_dir$i\_$backup_date.sql
    # upload an encrypted version to S3
    ln -fs $backup_dir$i\_$backup_date.sql.bz2 $nightly_dir$i-nightly.sql.bz2
    python upload2s3.py $backup_dir$i\_$backup_date.sql.bz2
    python upload2s3.py $nightly_dir$i-nightly.sql.bz2
  fi
done
find $backup_dir -type f -prune -mtime +$number_of_days -exec rm -f {} \;
