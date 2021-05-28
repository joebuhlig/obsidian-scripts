require 'json'
require 'open-uri'
location = ARGV[0]
apikey = "YOUR-KEY-HERE"
payload = open('https://api.weatherapi.com/v1/forecast.json?key=' + apikey + '&q=' + location + '&days=1&aqi=no&alerts=no')
json = JSON.parse(payload.read)
forecast = json["forecast"]["forecastday"][0]
summary = forecast["day"]["condition"]["text"]
sunrise = forecast["astro"]["sunrise"]
sunset = forecast["astro"]["sunset"]
maxTemp = "**" + forecast["day"]["maxtemp_f"].round().to_s + "°F**"
minTemp = "**" + forecast["day"]["mintemp_f"].round().to_s + "°F**"
moonNumber = forecast["astro"]["moon_illumination"].to_i
moonPhases = ["🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘"]
case moonNumber
when 0...13
moonEmoji = moonPhases[0] + " New Moon"
when 13...25
moonEmoji = moonPhases[1] + " Waxing Crescent"
when 25...38
moonEmoji = moonPhases[2] + " First Quarter"
when 38...50
moonEmoji = moonPhases[3] + " Waxing Gibbous"
when 50...63
moonEmoji = moonPhases[4] + " Full Moon"
when 63...75
moonEmoji = moonPhases[5] + " Waning Gibbous"
when 75...88
moonEmoji = moonPhases[6] + " Last Quarter"
when 88...100
moonEmoji = moonPhases[7] + " Waning Crescent"
else
moonEmoji = ""
end

if forecast["day"]["daily_will_it_rain"] == 0
rain=""
else
rainAmount = forecast["day"]["totalprecip_in"].to_s
rainProb = forecast["day"]["daily_chance_of_rain"]
rain = "\n- 💧 Rain: **" + rainAmount + '"** ' + rainProb + "%"
end

if forecast["day"]["daily_will_it_snow"] == 0
snow=""
else
snowAmount = forecast["day"]["totalprecip_in"].to_s
snowProb = forecast["day"]["daily_chance_of_snow"]
snow = "\n- ❄️ Snow: **" + snowAmount + '"** ' + snowProb + "%"
end

wind = forecast["day"]["maxwind_mph"].round()

humidity = forecast["day"]["avghumidity"]
output = "**" + location + "**" + "\n- " + summary + "\n- 🌞 Sunrise: **" + sunrise + "**\n- 🌅 Sunset: **" + sunset + "**\n- " + moonEmoji + "\n- 🌡 High: " + maxTemp + "\n- 🌡 Low: " + minTemp + rain + snow + "\n- 💨 Wind: **" + wind.to_s + "mph**\n- 🌫 Humidity: **" + humidity.round().to_s + "%**"

print output
