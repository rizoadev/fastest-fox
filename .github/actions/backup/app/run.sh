#!/bin/sh

echo "running..."
cd /home

PGPASSWORD=postgres pg_dump -Upostgres -h194.233.88.100 --port 5401 -F c ikamai_hive > /home/ikamai_hive.sql
ls

mkdir -p /github/home/.config/rclone/
cp /app/rclone.conf /github/home/.config/rclone/rclone.conf

rclone sync /home idrive:/lume/jclone --progress