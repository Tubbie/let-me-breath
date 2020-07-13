#!/bin/bash
# This install the project creates the correct folder and sets the cron job.

mkdir -p /home/pi/code/repo
mkdir -p /home/pi/code/out

cd /home/pi/code/repo

git clone https://github.com/Tubbie/let-me-breath.git

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

cp /home/pi/code/repo/camera/simple_record.sh /home/pi/code/simple_record.sh
cp /home/pi/code/repo/upload/simple_dropbox_upload.sh /home/pi/code/simple_dropbox_upload.sh

sed -i 's/access-token/$ACCESS_TOKEN/g' /home/pi/code/simple_dropbox_upload.sh
sed -i 's/record-duration/$DURATION/g' /home/pi/code/simple_dropbox_upload.sh

crontab -l > cronJob
#echo new cron into cron file
echo "@reboot /home/pi/code/simple_record.sh" >> cronJob
echo "@reboot /home/pi/code/simple_dropbox_upload.sh" >> cronJob
#install new cron file
crontab cronJob
rm cronJob
