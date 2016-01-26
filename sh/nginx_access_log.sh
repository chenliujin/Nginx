#!/bin/bash

pattern=`date +"%Y%m%d-%H"`

for file in /home/datasync/nginx_access_log/*/*/log.$pattern*.gz
do
	[ ! -e $file ] && continue

	filename=`echo $file | sed 's/.gz//'`
	[ -e $filename".ok" ] && continue

	gunzip $file

	site=`echo $file | awk -F '/' '{print $5}'`

	cat $filename | grep -iv  '\.\(css\|js\|gif\|jpg\|jpeg\|JPG\|png\|swf\)' | 
	awk -F '|' -v site=$site ' BEGIN { OFS="|"; } 
		{ 
			gsub(/\//, " ", $6);
			sub(/:/, " ", $6);

			"date -d \""$6"\" +\"%Y-%m-%d %H:%M:%S\"" | getline created_at;
			close("date -d \""$6"\" +\"%Y-%m-%d %H:%M:%S\"");

			created_date=substr(created_at, 1, 10);
			created_time=substr(created_at, 12, 2);
			created_time=created_time

			$6=created_at;

			date1=created_date;
			time1=created_time;
			gsub(/-/, "", date1);
			gsub(/:/, "", time1);

			path="/data/rawlog/log/nginx_access_log/"site"/"created_date"/"created_time;
			filename="nginx_access_log_"site"_"date1"_"time1".log";

			system("mkdir -p "path);

			print $0 >> path"/"filename 
		} ' && touch $filename".ok" && echo $file; 

	gzip $filename
done
