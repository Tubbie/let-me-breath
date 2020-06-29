#!/bin/bash
# Setting up RasPi with this project.

FILE_PATH='/home/pi/picam/archive/'
FILENAME='2020-06-14_01-35-39.ts'
FILENAME=$1
TODAY=`date +"%Y-%m-%d"`
ACCESS_TOKEN='access-token'

if [[ -f "$FILE_PATH$FILENAME" ]]; then

  curl -X POST https://content.dropboxapi.com/2/files/upload \
      --header "Authorization: Bearer $ACCESS_TOKEN" \
      --header "Dropbox-API-Arg: {\"path\": \"/$TODAY/$FILENAME\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" \
      --header "Content-Type: application/octet-stream" \
      --data-binary @$FILE_PATH$FILENAME
fi
