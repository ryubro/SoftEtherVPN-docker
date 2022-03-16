#!/bin/sh

vpnserver start
until vpncmd /server localhost /cmd HubList
do
	sleep 0.1s
done
vpncmd /server localhost /cmd HubCreate VPN /PASSWORD
vpncmd /server localhost /cmd IPSecEnable /L2TP:yes /L2TPRAW:no /ETHERIP:no /PSK:$SECRET /DEFAULTHUB:VPN
vpncmd /server localhost /hub:VPN /cmd SecureNatEnable
for PAIR in $USERS
do
	vpncmd /server localhost /hub:VPN /cmd UserCreate ${PAIR%:*} /GROUP:none /REALNAME:none /NOTE:none
	vpncmd /server localhost /hub:VPN /cmd UserPasswordSet ${PAIR%:*} /PASSWORD:${PAIR#*:}
done
vpncmd /server localhost /hub:VPN /cmd UserList

while true
do
	sleep 1h
done
