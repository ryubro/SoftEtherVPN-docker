#!/bin/sh

vpnserver start
until vpncmd /server localhost /cmd HubList
do
	sleep 0.1s
done
vpncmd /server localhost /cmd HubCreate VPN /PASSWORD $PASSWORD
for PAIR in $USERS
do
	vpncmd /server localhost /hub:VPN /password $PASSWORD /cmd UserCreate ${PAIR%:*} /GROUP:none /REALNAME:none /NOTE:none
	vpncmd /server localhost /hub:VPN /password $PASSWORD /cmd UserPasswordSet ${PAIR%:*} /PASSWORD:${PAIR#*:}
done
vpncmd /server localhost /hub:VPN /password $PASSWORD /cmd UserList

while true
do
	sleep 1h
done
