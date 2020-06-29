import datetime
import os

import requests

url = 'https://content.dropboxapi.com/2/files/upload'
access_token = 'access-token'

for fname in os.listdir('.'):  # /home/pi/picam/archive
    if fname.endswith('.txt'):
        print("Found" + fname)
        x = requests.post(url, data="TestUpload", headers={
            "Authorization": "Bearer " + access_token,
            "Dropbox-API-Arg": "{\"path\": \"/" + datetime.date.today().strftime(
                "%Y-%m-%d") + "/" + fname + "\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}",
            "Content-Type": "application/octet-stream"
        })
        print("Uploaded")
