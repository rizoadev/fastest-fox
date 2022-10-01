#!/bin/bash

IMG=quay.io/rizoa/ikamai-backup

docker build -t $IMG .
docker push $IMG

