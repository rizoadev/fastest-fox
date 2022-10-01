#!/bin/sh

# setup
mkdir -p /github/home/.config/rclone/
cp /app/rclone.conf /github/home/.config/rclone/rclone.conf

# define
today=$(date '+%Y-%m-%d')
echo $today

echo "running..."
mkdir -p /home/backups/$today/

mysqldump -uaimigroup -h194.233.86.165 -pzw43uyaoYTJHKGTYFhyuit3435t9w4n8yt8 aimi_dev > /home/backups/$today/aimi_dev.sql

PGPASSWORD=postgres pg_dump -Upostgres -h194.233.88.100 --port 5401 -F c ikamai_hive > /home/backups/$today/ikamai_hive.sql

mongodump --uri mongodb://root:aimi_mothership1234@194.233.86.165:27017/mothership_prod \
--db mothership_prod  -o /home/backups/$today --authenticationDatabase admin

# sync
rclone sync /home/backups idrive:/lume/jclone/backups --progress