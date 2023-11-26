myip=$(curl -X GET https://api.ipify.org)
echo "$myip"

read mylat mylon mycity < <(echo $(curl -X GET http://api.ipstack.com/"$myip"?access_key=$APIKEY_IPSTACK | jq -r '.latitude, .longitude, .city'))
echo "$mylat"
echo "$mylon"
echo "$mycity"

while true; do
echo "Press T to get current temperature for your IP location:"
read -rsn1 input
if [ "$input" = "t" ]; then
    mytemp=$(curl --location "http://api.openweathermap.org/data/2.5/weather?lat=$mylat&lon=$mylon&appid=$APIKEY_OPENWEATHERMAP&units=metric" | jq '.main.temp')
    echo -e "\033[0;32mTemperature in $mycity is $mytemp°C.\033[0m"
fi
done
