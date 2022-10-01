FROM python:3.11-rc-alpine

RUN apk add \
    postgresql-client \
    rclone

COPY ./app /app
COPY ./rclone.conf ~/.config/rclone/rclone.conf

CMD sh /app/run.sh
