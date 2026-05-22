#!/bin/bash

url='https://calendar.google.com/calendar/ical/ja.japanese%23holiday%40group.v.calendar.google.com/public/basic.ics'

result=$(
    curl -s "$url"                           |
    sed -n '/^BEGIN:VEVENT/,/^END:VEVENT/p'  |
    awk '/^BEGIN:VEVENT/{
           rec++;
         }
         match($0,/^DTSTART.*DATE:/){
           print rec,1,substr($0,RLENGTH+1);
         }
         match($0,/^SUMMARY:/){
           s=substr($0,RLENGTH+1);
           gsub(/ /,"_",s);
           print rec,2,s;
         }'                                  |
    sort -k1n,1 -k2n,2                       |
    awk '$2==1{printf("%d ",$3);}
         $2==2{print $3;}
         '                                   |
    sort
)

if [ -n "$1" ]; then
    echo "$result" | grep "$1"
else
    echo "$result"
fi
