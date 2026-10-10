# EasySweep

A learning project exploring ping sweep implementations in different programming languages.

## Bash implementation

Checks which hosts respond to ping within an IPv4 `/24` network.

- Validates the network address.
- Accepts and normalizes leading zeros.
- Checks hosts from `.1` to `.254` concurrently.
- Prints responding hosts.

## Usage

Requires Linux, Bash, `ping`, and `cut`.

```bash
bash easysweep.sh 192.168.1.0
```

Provide the network address without `/24`. The last octet must be zero.

Addresses with leading zeros are also accepted:

```bash
bash easysweep.sh 192.168.001.000
```

Example output:

```text
=== EasySweep ===

Host 192.168.1.1 is up!
Host 192.168.1.42 is up!
```

Results may appear in any order because checks run concurrently.
