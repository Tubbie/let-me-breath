#!/bin/bash

mkdir -p /home/pi/code/out
while true
do
NOW=`date +"%Y-%m-%d_%T"`
raspivid -t 60000 -w 640 -h 480 -fps 25 -b 1200000 -p 0,0,640,480 -o /home/pi/code/"$NOW".h264
mv /home/pi/code/"$NOW".h264 /home/pi/code/out/"$NOW".h264
done


