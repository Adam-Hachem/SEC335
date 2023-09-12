#!/bin/bash
hostfile=$1
portfile=$2
printf "%-15s %s\n" "Host" "Port"
# printf gives you nice formatting. the "%-15s %s\n" is the configuration for the columns
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    # Try to establish a quick TCP connection and echo only if successful.
    timeout .1 bash -c "echo >/dev/tcp/$host/$port"  2>/dev/null &&
      printf "%-15s %s\n" "$host" "$port"
  done
done
