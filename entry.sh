#!/bin/sh

# start cron
#/usr/sbin/crond -f -l 8

FILE=/config/zap2xml.pl
while [ ! -f "$FILE" ]
do
    echo "File not found: $FILE"
    sleep 5
done


while :
do
	DATE=$(date)
	/config/zap2xml.pl -u "$USERNAME" -p "$PASSWORD" -U -o /data/"$XMLTV_FILENAME" "$OPT_ARGS"
	echo "Last run time: $DATE"
	echo "Will run in $SLEEPTIME seconds"
	sleep "$SLEEPTIME"
done
