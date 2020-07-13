#!/bin/bash

FILE_PATH=/home/pi/code/out/*
ACCESS_TOKEN='access-token'
TODAY=$(date +"%Y-%m-%d")

while true
do
  for FILE in $FILE_PATH
  do
    echo "Processing $FILE file..."
    # take action on each file. $f store current file name
    curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $ACCESS_TOKEN" \
    --header "Dropbox-API-Arg: {\"path\": \"/$TODAY/${FILE##*/}\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$FILE
    echo "Uploaded"
    rm  $FILEl
  done

sleep 1m
done
