#!/bin/bash


SENDER="xxx@xx.com"
RECV="xxx@xx.com"
DATE=`date`
echo "Quick and dirty SMTP relay checker"
echo "by brad a."
echo "----------------------------------"
if [[ $1 == "" ]]; then
	echo "[ERROR] must specify host"
else

	if [[ $2 == "" ]]; then
		PORT=25
	else
		PORT=$2
	fi
	cat >> tmpfile.txt << EOF
mail from: $SENDER
rcpt to: $RECV 
data
Subject: $1:$PORT - Relay Test
This is a smtp relay test for $1 $PORT
From $SENDER to $RECV on $DATE
.
quit
EOF
	echo "[+] Using target $1:$PORT"
	cat tmpfile.txt | nc $1 $PORT 
	rm tmpfile.txt

	
fi
