#!/bin/sh

/sbin/ifconfig wwan0 >/dev/null 2>/dev/null
if [[ $? -ne 0 ]]
then
    echo wwan0 not found, terminating
    exit 0
else
    echo wwan0 is available
fi
 
if [[ "$(/sbin/ifconfig wwan0)" = *"UP BROADCAST"* ]]
then
    echo wwan0 is already up
else
    echo wwan0 needs to go up
    /sbin/ifconfig wwan0 up
    if [[ $? -ne 0 ]]
    then
        echo Failed to bring wwan0 up, terminating
        exit 0
    fi
fi
 
if [[ "$(/usr/bin/qmi-network /dev/cdc-wdm0 status)" = *"Status: connected"* ]]
then
    echo Network already connected
else
    echo Starting modem
    /usr/bin/qmi-network /dev/cdc-wdm0 start
    if [[ $? -ne 0 ]]
    then
        echo Failed to start QMI network, terminating
        exit 0
    fi
fi
 
if [[ "$(/sbin/ifconfig wwan0)" = *"inet addr"* ]]
then
    echo wwan0 already has an IP
else
    echo Requesting DHCP for wwan0
    /sbin/dhclient wwan0
fi
 
ip="$(/sbin/ifconfig wwan0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://')"
echo We have the IP $ip
exit 0
