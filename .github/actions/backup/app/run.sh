#!/bin/sh

# setup
mkdir -p /github/home/.config/rclone/
mkdir -p /root/.config/rclone/
cp /app/rclone.conf /github/home/.config/rclone/rclone.conf
cp /app/rclone.conf /root/.config/rclone/rclone.conf

# define
today=$(date '+%Y-%m-%d')
echo $today

echo "running..."
mkdir -p /home/backups/$today/

echo "backup postgre"
PGPASSWORD=postgres pg_dump -Upostgres -h194.233.88.100 --port 5401 -F c ikamai_hive > /home/backups/$today/ikamai_hive.sql

# echo "backup mysql"
# mysqldump -uaimigroup -h194.233.86.165 -pzw43uyaoYTJHKGTYFhyuit3435t9w4n8yt8 aimi_dev > /home/backups/$today/aimi_dev.sql

echo "backup mongo"
mongodump --uri="mongodb://root:aimi_mothership1234@194.233.86.165:27017/mothership_prod?authSource=admin" -o /home/backups/$today

# sync
rclone sync /home/backups idrive:/lume/jclone/backups --progress