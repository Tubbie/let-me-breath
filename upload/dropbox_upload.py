import datetime
import os

import requests

url = 'https://content.dropboxapi.com/2/files/upload'
access_token = 'access-token'  # Add access token here.

for fname in os.listdir('/home/pi/picam/archive'):  # /home/pi/picam/archive
    if fname.endswith('.txt'):
        print("Found" + fname)
        try:
            x = requests.post(url, data="TestUpload", headers={
                "Authorization": "Bearer " + access_token,
                "Dropbox-API-Arg": "{\"path\": \"/" + datetime.date.today().strftime(
                    "%Y-%m-%d") + "/" + fname + "\",\"mode\": \"add\",\"autorename\": true,\"mute\": false,\"strict_conflict\": false}",
                "Content-Type": "application/octet-stream"
            })
        except requests.exceptions.RequestException as e:
            print("Error in upload")
        print("Uploaded")
