#!/bin/bash


TARGET=$1
START_PORT=1
END_PORT=1024

echo "Scanning $TARGET..."

for ((port=$START_PORT; port<=$END_PORT; port++))
do
    timeout 1 bash -c "echo >/dev/tcp/$TARGET/$port" 2>/dev/null &&
        echo "Port $port is OPEN"
done
