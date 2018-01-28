#!/bin/bash

url="http://www.bing.com"

link="http://www.bing.com/HPImageArchive.aspx?idx=0&n=1"

re="<startdate>.*</startdate>|<url>.*</url>|<copyright>.*</copyright>"

sentence=`curl -X GET ${link} | grep -Eo {$re} | perl -pe 's/<.*?>//g'`

while(( ${#sentence} == 0 ))
do
	notify-send "Can't download, we will try again in 3s!"
	
	sleep 3s
	
	sentence=`curl -X GET {$link} | grep -Eo {$re} | perl -pe 's/<.*?>//g'`

done

stringarray=($sentence)

startdata=${stringarray[0]}
url_laha=${stringarray[1]}
copyright=${stringarray[2]}

file_url=${url}${url_laha}

file_name=${startdata}".jpg"

home_path=`echo ~`

file_path=$home_path"/Pictures/BingWallpaper"

if [ ! -d $file_path ]
then 
	if [ ! -d ${file_path%/*} ]
	then
		mkdir ${file_path%/*}
	fi
	mkdir $file_path
fi

cd $file_path

echo $startdata" about "$copyright > $startdata".txt"
if [ ! -f "$file_name" ]
then
	wget $file_url -O $file_name
fi

gsettings set org.gnome.desktop.background picture-uri "file://$file_path/$file_name"

notify-send "Replace wallpaper successfully!"

tar -cf $startdata".tar" $startdata".txt"  $file_name

rm $startdata".txt" 

cd -