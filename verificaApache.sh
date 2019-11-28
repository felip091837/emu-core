#!/bin/bash

while true; do
    status=$(curl --write-out %{http_code} --connect-timeout 5  --silent --output /dev/null http://10.0.1.10/index.html)
        if [ $status -eq 200 ]; then  
            time=`uptime | awk '{print $1}'`
            echo "on($status): $time" >> /tmp/log_pache.txt            
        else
            tempo=`uptime | awk '{print $1}'`            
            echo "off($status): $time" >> /tmp/log_pache.txt
        fi
	  
sleep 1
done
