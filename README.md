# EasySweep

EasySweep is a Bash script that lists the addresses on a `/24` IPv4 network that respond to `ping`. It runs pings in parallel and prints addresses as replies arrive.

## Requirements

- Bash
- `ping` from the `iputils` package on Linux
- `grep`

## Usage

From the directory containing `easysweep.sh`, make the script executable and run it with the first three octets of the network address. For `192.168.0.0/24`, pass `192.168.0`.

```bash
chmod +x easysweep.sh
./easysweep.sh 192.168.0
```

The script checks addresses from `192.168.0.1` through `192.168.0.254`. It sends one packet per address, with a one-second deadline for each `ping` command.

## Example output

```text
=== EASYSWEEP v1.0 ===

List of hosts that replied:

192.168.0.12
192.168.0.1
```

Some devices ignore or block ICMP echo requests, so an active device may be absent from the list.
