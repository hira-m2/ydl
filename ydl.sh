#!/bin/sh


export http_proxy="127.0.0.1:8123"
export https_proxy="127.0.0.1:8123"

cd ~/Downloads/youtube/
#wget -c $*
ret_code=1
while [ $ret_code -ne 0 ]
do
	youtube-dl $*
	ret_code=$?
	echo $ret_code
	sleep 23
done
