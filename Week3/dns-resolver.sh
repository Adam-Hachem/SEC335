#!/bin/bash

prefix=$1
dns=$2
printf "%-23s %s\n" "IP" "Hostname"
for i in {1..254}; do	
	timeout .4 bash -c "nslookup $prefix.$i $dns" 2>/dev/null | grep "="
done
