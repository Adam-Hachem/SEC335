#!/bin/bash

prefix=$1
port=$2
printf "%-15s %s\n" "Host" "Port"
for i in {1..254}; do	
	timeout .1 bash -c "echo >/dev/tcp/$prefix.$i/$port" 2>/dev/null &&
		printf "%-15s %s\n" "$prefix.$i" "$port"
done
