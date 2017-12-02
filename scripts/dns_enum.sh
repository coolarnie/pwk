#!/usr/bin/env bash

TARGET="megacorpone.com"

echo "The DNS servers are:"
host -t	ns ${TARGET} |cut -d" " -f4

echo "Performing zone transfers on all DNS servers:"
for	server in $(host -t	ns ${TARGET} |cut -d" " -f4);do
    host -l ${TARGET} ${server} |grep "has address"
done
