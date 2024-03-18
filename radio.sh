#!/bin/bash

IFS=$'\n'

clear

echo "Radio Browser"

read -p "Please enter tag to search for " TAGSEARCH

RESULT=`curl -d "limit=50" -s http://de1.api.radio-browser.info/json/stations/byname/${TAGSEARCH/ /%20} | jq -S '.[0:50]' | grep -E "\"codec\"|\"bitrate\"|\"country\"|\"name\"|\"url\""`

THEARRAY=()

for LINE in $RESULT; do 
    THEARRAY+=($LINE)
done;

ARRAYLENGTH=${#THEARRAY[@]}

COUNTER=0
for ((i = 0 ; i < $ARRAYLENGTH ; i+=5 )); do 
    BITRATE=`echo ${THEARRAY[i]:15:100} | grep -o -E "^[0-9]*"`
    BITRATE=`printf "%03dkbps" "$BITRATE"`
    FORMAT=`echo ${THEARRAY[i+1]} | cut -d'"' -f4`
    FORMAT=`printf "%-4s" "${FORMAT:0:4}"`
    COUNTRY=`echo ${THEARRAY[i+2]} | cut -d'"' -f4` 
    COUNTRY=`printf "%13s" "${COUNTRY:0:13}"`
    INDEXNO=$((i/5))
    INDEXNO=`printf "%02d" "$INDEXNO"`
    NAME=`echo ${THEARRAY[i+3]} | cut -d'"' -f4` 
    NAME=`printf "%-58s" "$NAME"`
    URL=`echo ${THEARRAY[i+4]} | cut -d'"' -f4` 
    MENUARRAY[COUNTER]=$(echo "$INDEXNO $BITRATE $FORMAT $COUNTRY")
    MENUARRAY[COUNTER+1]=$(echo ": ${NAME:0:58}")
    ((COUNTER+=2))
done
RADIO=$(whiptail --menu "Please select a stream..." --title "Search Results" 18 100 10  ${MENUARRAY[@]} 3>&1 1>&2 2>&3)
URL=`echo ${RADIO:0:2}`
ARRAYINDEX=$((URL*5+4))
URL=`echo ${THEARRAY[ARRAYINDEX]} | cut -d'"' -f4`

