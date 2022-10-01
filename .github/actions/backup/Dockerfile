# FROM quay.io/rizoa/ikamai-backup
FROM alpine:3.16

RUN apk add --nocache --repository=http://dl-cdn.alpinelinux.org/alpine/v3.16/community \
    mongodb-tools \
    mysql-client \
    postgresql14-client \
    rclone

COPY ./app /app
COPY ./rclone.conf /app/rclone.conf

CMD sh /app/run.sh
