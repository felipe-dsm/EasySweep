#!/bin/bash

program_name="$0"

if (( $# != 1 )); then
	printf '\n=== EasySweep ===\nHow to use: %s <Network Address>\n' "$program_name"
	exit 1
fi

network_addr="$1"
regex='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0]{1,3}$'

if [[ ! "$network_addr" =~ $regex ]]; then
	printf "\n=== EasySweep ===\nInvalid Network Address\n"
	exit 1
fi

octets=()

for octet_number in {1..4}; do
	octet_text=$(echo "$network_addr" | cut -d "." -f "$octet_number")
	octets+=("$((10#$octet_text))")
done

for octet in "${octets[@]}"; do
	if (( octet > 255 )); then
		printf "\n=== EasySweep ===\nInvalid Network Address\n"
		exit 1
	fi
done

printf "\n=== EasySweep ===\n\n"

ip_base="${octets[0]}.${octets[1]}.${octets[2]}"

for host in {1..254}; do 
	{
		ip="$ip_base.$host"

		if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
			echo "Host $ip is up!"
		fi
	} &
done

wait
