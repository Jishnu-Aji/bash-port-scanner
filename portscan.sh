#!/bin/bash

if [ $# -lt 3 ]; then
  echo "Usage: $0 <IP> <start_port> <end_port>"
  exit 1
fi

ip=$1
start_port=$2
end_port=$3

scan_ports() {
  for ((port=$start_port; port<=$end_port; port++)); do
    (echo > /dev/tcp/$ip/$port) &>/dev/null && echo "Port $port is open"
  done
}

echo "Scanning $ip from port $start_port to $end_port..."
scan_ports

