# SoftEtherVPN-docker

## How To Use
The following command will run the SoftEtherVPN server and create a hub called `VPN` (hard-coded) with the password `hubpassword`, with the two users with the user name and password combo `user1` / `pass1` and `user2` / `pass2`
```
docker run --env PASSWORD=hubpassword --env USERS="user1:pass1 user2:pass2" -p 500:500/udp -p 1701:1701/udp -p 4500:4500/udp ryubro/softether-vpn
```
