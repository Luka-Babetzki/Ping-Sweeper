#!/bin/bash
if [ "$1" == "" ]
then
echo "You forgot an IP address!" 
echo "Syntax: ./ipsweep.sh 192.168.1"
 
else
for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" & # The '&' allows for many loops at once instead of ';' which processes sequentially (slow)
done
wait
echo "Ping sweep complete: $(wc -l < ips.txt) addresses found!"
fi


# for ip in $(cat ips.txt); do nmap $ip & done
# wait
# echo "Nmap scan complete!"
# fi