# Ping Sweeper

A bash script for network reconnaissance that performs IP discovery via ping sweep and enriches the results with nmap port scanning.

## Features

- **Ping Sweep**: Rapidly scans a network range to identify live hosts
- **Parallel Processing**: Uses background processes for fast scanning
- **Nmap Integration**: Automatically runs nmap scans on discovered IPs for port and service enumeration
- **Single Output File**: All results (live IPs and nmap data) saved to `ips.txt`

## Prerequisites

- Linux/Unix environment (WSL on Windows 11)
- `ping` command
- `nmap` installed

## Usage

```bash
./sweeper.sh <network_range>
```

### Example

```bash
./sweeper.sh 192.168.1
```

This will scan all IPs from 192.168.1.1 to 192.168.1.254

## Output

Results are saved to `ips.txt` with the following structure:

```
192.168.1.10
192.168.1.20
192.168.1.45

========== NMAP RESULTS ==========

[nmap output for each IP]
```

## How It Works

1. **Ping Sweep Phase**: Sends ICMP ping requests to all 254 addresses in the subnet
2. **IP Collection**: Live hosts are extracted and saved to `ips.txt`
3. **Nmap Phase**: Iterates through discovered IPs and runs nmap scans in parallel
4. **Results Storage**: All nmap output is appended to `ips.txt`

## Notes

- The script uses background processes (`&`) for parallel execution to speed up scanning
- Results are appended to `ips.txt`, so clear the file between runs if needed
- Nmap scans can be time-intensive; larger networks may take several minutes
