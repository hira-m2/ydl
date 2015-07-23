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



# Get Proxy	
bool=true
while [ $bool = true ]
do
	echo "Do you use proxy for accesse to youtube?(y/n)"
	read proxy_use

	if [ "y" = "$proxy_use" ]; then
		echo "Enter your http proxy:(user:pass@host:port)"
		read hproxy
		echo "Enter your https proxy:(user:pass@host:port)"
		read sproxy
		bool=false
	elif [ "n" = "$proxy_use" ]; then
		bool=false
	fi
done

#Create File in /usr/bin for easy run script

sudo touch /usr/bin/ydl
sudo chmod 777 /usr/bin/ydl



#Insert code to /usr/bin/ydl

echo "#!/bin/sh" > /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "#Set proxy" >> /usr/bin/ydl
echo "export http_proxy=\"$hproxy\"" >> /usr/bin/ydl
echo "export https_proxy=\"$sproxy\"" >> /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "#Go to Download directory" >> /usr/bin/ydl
echo "cd ~/Downloads/youtube/" >> /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "" >> /usr/bin/ydl
echo "#Retry Download until Download completed" >> /usr/bin/ydl
echo "ret_code=1" >> /usr/bin/ydl
echo "while [ \$ret_code -ne 0 ]" >> /usr/bin/ydl
echo "do" >> /usr/bin/ydl
echo "	youtube-dl \$*" >> /usr/bin/ydl
echo "#Get return code of youtube-dl" >> /usr/bin/ydl
echo "	ret_code=\$?" >> /usr/bin/ydl
echo "	sleep 100" >> /usr/bin/ydl
echo "done" >> /usr/bin/ydl

sudo chmod 755 /usr/bin/ydl
	
