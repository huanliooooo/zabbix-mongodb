#!/bin/bash

# Date:                 09/12/2019
# Description:          A script to send MongoDB stats to zabbix server by using zabbix sender
# Requires:             Zabbix Sender, zabbix-mongodb.py

CDIR="`dirname "$0"`"
HOME_PATH=`(cd "$CDIR"/ ; pwd)`
FILE_CONF=zabbix.conf

cd $HOME_PATH
echo $HOME_PATH
source $FILE_CONF

get_MongoDB_metrics(){
 eval "python3 ./zabbix-mongodb.py $MONGO_HOST $MONGO_PORT"
}

result=$(get_MongoDB_metrics | /usr/bin/zabbix_sender -z $SERVER -s "$HOST_NAME"  -i - 2>&1)
response=$(echo "$result" | awk -F ';' '$1 ~ /^info/ && match($1,/[0-9].*$/) {sum+=substr($1,RSTART,RLENGTH)} END {print sum}')
if [ -n "$response" ]; then
        echo "$response"
else
        echo "$result"
fi
