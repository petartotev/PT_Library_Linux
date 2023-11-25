myip=$(curl -X GET https://api.ipify.org)
echo "$myip"
mylat=$(curl -X GET http://api.ipstack.com/"$myip"?access_key=$APIKEY_IPSTACK | jq '.latitude')
echo "$mylat"
mylon=$(curl -X GET http://api.ipstack.com/"$myip"?access_key=$APIKEY_IPSTACK | jq '.longitude')
echo "$mylon"
mycity=$(curl -X GET http://api.ipstack.com/"$myip"?access_key=$APIKEY_IPSTACK | jq '.city' | tr -d '"')
echo "$mycity"
mytemp=$(curl --location "http://api.openweathermap.org/data/2.5/weather?lat=$mylat&lon=$mylon&appid=$APIKEY_OPENWEATHERMAP&units=metric" | jq '.main.temp')
echo -e "\033[0;32mTemperature in $mycity is $mytemp°C.\033[0m"
