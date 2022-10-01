FROM python:3.11-rc-alpine

RUN apk add \
    postgresql-client \
    rclone

COPY ./app /app
COPY ./rclone.conf /app/rclone.conf

CMD sh /app/run.sh
