#!/bin/bash

# Date:                 09/12/2019
# Description:          A script to send MongoDB stats to zabbix server by using zabbix sender
# Requires:             Zabbix Sender, zabbix-mongodb.py

CDIR="`dirname "$0"`"
HOME_PATH=`(cd "$CDIR"/ ; pwd)`


get_MongoDB_metrics(){
 eval "python3 $HOME_PATH/zabbix-mongodb.py"
}

result=$(get_MongoDB_metrics | /usr/bin/zabbix_sender -z $1 -s "$2"  -i - 2>&1)
response=$(echo "$result" | awk -F ';' '$1 ~ /^info/ && match($1,/[0-9].*$/) {sum+=substr($1,RSTART,RLENGTH)} END {print sum}')
if [ -n "$response" ]; then
        echo "$response"
else
        echo "$result"
fi
