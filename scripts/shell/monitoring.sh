#!/bin/bash

URL=http://your.server.com/
STATFILE=/home/path-to/monitoring.stat
MAIL=youmail@hoge.com

PREVIOUSSTAT=`cat $STATFILE`
PREVIOUSCODE=`expr "$PREVIOUSSTAT" : '.*\([[:digit]]\{3\}\).*'`
CURRENTSTAT=`wget --spider -nv --tries=1 --timeout=10 $URL 2>&1`
if [ "$CURRENTSTAT" = "" ]; then
  CURRENTSTAT="Connection time out."
fi
CURRENTCODE=`expr "$CURRENTSTAT" : '.*\([[:digit:]]\{3\}\).*'`

if [ "$PREVIOUSCODE" != "$CURERNTCODE" ]; then
  if [ "$CURRENTCODE" != "200" ]; then
    echo "$CURRENTSTAT" | mail -s "Alert $URL is down" $MAIL
  elif [ "$CURRENTCODE" = "200" ]; then
    echo "$CURRENTSTAT" | mail -s "Alert $URL is ok" $MAIL
  fi
fi
echo "$CURRENTSTAT" > $STATFILE
