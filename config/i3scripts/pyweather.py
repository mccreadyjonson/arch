#!/usr/bin/env python
import json
import requests

url = "https://api.weather.gov/gridpoints/ILM/55,39/forecast/hourly"
forecast = requests.get(url).json()


def get_emoji(short_forecast):
    if short_forecast in ["Mostly Clear", "Mostly Sunny"]:
        emoji = "⛅"
    elif short_forecast in ["Sunny", "Clear"]:
        emoji = "☀️"
    elif short_forecast == "Mostly Cloudy":
        emoji = "☁️"
    elif short_forecast == "Cloudy":
        emoji = "🌥️"
    elif short_forecast == "Partly Cloudy":
        emoji = "⛅"
    elif short_forecast in ["Partly Sunny", "Mostly Clear"]:
        emoji = "🌤️"
    elif short_forecast == "Slight Chance Rain Showers":
        emoji = "🌦️"
    elif short_forecast in ["Chance Rain Showers", "Rain Showers"]:
        emoji = "🌧️"
    elif "Thunderstorms" in short_forecast:
        emoji = "⛈️ "
    else:
        emoji = "😎"
    return emoji


temp = forecast["properties"]["periods"][0]["temperature"]
short = forecast["properties"]["periods"][0]["shortForecast"]
emoji = get_emoji(short)
print(f"{emoji} {temp}°F")
