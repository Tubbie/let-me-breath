#!/bin/bash
# This install the project creates the correct folder and sets the cron job.

mkdir -p /home/pi/code/out

cd /home/pi/code

wget https://raw.githubusercontent.com/Tubbie/let-me-breath/master/camera/simple_record.sh
wget https://raw.githubusercontent.com/Tubbie/let-me-breath/master/upload/simple_dropbox_upload.sh

until [[ $DURATION =~ ^[0-9]+$ ]]; do
   read -p "Enter record duration in minutes. Max 10   -> " DURATION
   if [[ ! $DURATION =~ ^[0-9]+$ ]] ; then
    echo "Invalid duration try again."
  fi
done

echo Record duration is $DURATION minutes.

DURATION=$(($DURATION * 60 * 1000))
echo Record duration is $DURATION ms.

read -p "Enter dropbox access token: " ACCESS_TOKEN
echo Dropbox acces token is $ACCESS_TOKEN

chmod +x /home/pi/code/simple_record.sh
chmod +x /home/pi/code/simple_dropbox_upload.sh

sed -i 's/access-token/'"$ACCESS_TOKEN"'/g' /home/pi/code/simple_dropbox_upload.sh
sed -i 's/sleep-duration/'"$DURATION"'/g' /home/pi/code/simple_dropbox_upload.sh
sed -i 's/record-duration/'"$DURATION"'/g' /home/pi/code/simple_record.sh

crontab -l > cronJob
#echo new cron into cron file
echo "@reboot /home/pi/code/simple_record.sh" >> cronJob
echo "@reboot /home/pi/code/simple_dropbox_upload.sh" >> cronJob
#install new cron file
crontab cronJob
rm cronJob
