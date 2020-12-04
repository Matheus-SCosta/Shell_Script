#!/bin/bash

CONF="useDisc.conf"
DATE=$(date "+%Y/%m/%d")
TIME=$(date "+%H:%M:%S")

source $CONF

echo -e "\nUSE OF DISC FOR STORED BACKUPS\n"
echo -e "=====================================\n"
for i in ${!REMOTE_USER[@]}; do
        use=$(du -csh ${SOURCE[$i]} | awk 'NR==1 {print $1}')
        echo "${REMOTE_USER[$i]}  -  $use"
done
echo -e "\n=====================================\n"
echo -e "Data for $DATE as $TIME\n"

