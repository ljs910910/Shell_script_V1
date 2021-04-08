#!/bin/bash

echo shell start

TOMCAT_LOG_BACK_DIR=/data/logs/tomcat_api/catalina_back
TOMCAT_LOG_DIR=/data/logs/tomcat_api/catalina.out

LOGFILE='/home/ktipmedia/CRON_EXEC_LOG_API.log'

if [ `find $TOMCAT_LOG_DIR -size +3G` ]
then
    if [ ! -d $TOMCAT_LOG_BACK_DIR ]
    then
        mkdir $TOMCAT_LOG_BACK_DIR
    fi

echo `date +'%Y-%m-%d %H:%M:%S'`' [START]' >> ${LOGFILE}

cp -apf $TOMCAT_LOG_DIR $TOMCAT_LOG_BACK_DIR/catalina.out.`date +%Y-%m-%d-%H`

find /data/logs/tomcat_api/ -name 'catalina.*[0-9]' -exec nice -n10 gzip {} \;
find /data/logs/tomcat_api/ -name 'localhost_access_log.*.txt' -mtime +2 -exec nice -n10 gzip {} \;

cat /dev/null > $TOMCAT_LOG_DIR

echo `date +'%Y-%m-%d %H:%M:%S'`' [END]' >> ${LOGFILE}
fi
