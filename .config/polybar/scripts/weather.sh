#!/bin/bash
city=""
api_key=""
lang="en"
unit="imperial"
api="http://api.openweathermap.org/data/2.5/weather"
url="$api?q=$city&lang=$lang&APPID=$api_key&units=$unit"

weather=$(curl -s $url | jq -r '. | "\(.weather[].main)"')
temp=$(curl -s $url | jq -r '. | "\(.main.temp)"')
icons=$(curl -s $url | jq -r '. | "\(.weather[].icon)"')

case $icons in
  01d) icon= ;;
  01n) icon=;;
  02d) icon=;;
  02n) icon=;;
  03*) icon=;;
  04*) icon=;;
  09*) icon=;;
  10*) icon=;;
  11*) icon=;;
  13*) icon=ﰕ;;
  50*) icon=敖;;
  *) icon=摒;;
esac

echo $icon\  $weather, $temp"°F"
sleep 120
