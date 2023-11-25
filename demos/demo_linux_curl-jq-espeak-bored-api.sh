#!/bin/bash
while true; do
read -rsn1 input
if [ "$input" = "b" ]; then
	activity=$(curl -X GET https://www.boredapi.com/api/activity | jq '.activity')
	sudo espeak "$activity"
	sudo echo -e "\033[0;33m$activity\033[m"
fi
done 
