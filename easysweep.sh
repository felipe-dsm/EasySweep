#!/bin/bash

network=$1
network_exp='^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){2}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'

if [[ ! $network =~ $network_exp ]]; then
	echo -e "\n=== EASYSWEEP v1.0 ===\n"
	echo "Example of use: ./easysweep.sh 192.168.0"
	echo "Note: only /24 networks are supported"

	exit 1
fi

echo -e "\n=== EASYSWEEP v1.0 ===\n"
echo -e "List of hosts that replied:\n"

for host in {1..254}; do
{
	ip="$network.$host"
	resp=$(ping -w 1 -c 1 "$ip" | grep "64 bytes")

	if [[ $resp != "" ]]; then
		echo "$ip"
	fi
} &
done

wait
