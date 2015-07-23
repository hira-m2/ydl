#!/bin/sh
# 
# /usr/bin  path to add script



#check for install youtube-dl

problem=$(dpkg -s youtube-dl|grep installed)
echo "Checking for youtube-dl: $problem"
if [ "" = "$problem" ]; then
	echo "Youtube-dl do not install.\nSetting up libxul"
	sudo apt-get --force-yes --yes install youtube-dl 
fi

#end check


check=true
while [ $check = true ]
do
	echo "Do you use proxy for accesse to youtube?(y/n)"
	read proxy_use

	if [ "y" = "$proxy_use" ]; then
		echo "Enter your proxy:(user:pass@hoet:port)"
		read proxy
		echo $proxy #for debug
		check=false
	elif [ "n" = "$proxy_use" ]; then
		check=false
	fi
done
#export http_proxy="127.0.0.1:8123"
#export https_proxy="127.0.0.1:8123"

#cd ~/Downloads/youtube/
#wget -c $*
#ret_code=1
#while [ $ret_code -ne 0 ]
#do
#	youtube-dl $*
#	ret_code=$?
#	echo $ret_code
#	sleep 23
#	done
