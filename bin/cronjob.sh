CDIR="`dirname "$0"`"
HOME_PATH=`(cd "$CDIR"/ ; pwd)`
FILE_EXECUTE=mongodb-stats.sh
FILE_CONF=zabbix.conf

cd $HOME_PATH
echo $HOME_PATH
source $FILE_CONF

echo `date` $SERVER $HOST_NAME
chmod +x $FILE_EXECUTE
croncmd1="$HOME_PATH/$FILE_EXECUTE $SERVER $HOST_NAME 1"
croncmd2="$HOME_PATH/$FILE_EXECUTE $SERVER $HOST_NAME 2"
cronjobFirst="* * * * * $croncmd1"
cronjobSecond="* * * * * sleep 30; $croncmd2"
( crontab -l | grep -v -F "$croncmd1" ; echo "$cronjobFirst" ) | crontab -
( crontab -l | grep -v -F "$croncmd2" ; echo "$cronjobSecond" ) | crontab -