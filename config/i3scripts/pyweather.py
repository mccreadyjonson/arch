#!/usr/bin/env python
import json
import requests

url = "https://api.weather.gov/gridpoints/ILM/55,39/forecast/hourly"
forecast = requests.get(url).json()


def get_emoji(short_forecast):
    match short_forecast:
        case "Mostly Clear" | "Mostly Sunny":
            emoji = "⛅"
        case "Sunny" | "Clear":
            emoji = "☀️"
        case "Mostly Cloudy":
            emoji = "☁️"
        case "Cloudy":
            emoji = "🌥️"
        case "Partly Cloudy":
            emoji = "⛅"
        case "Areas Of Fog" | "Patchy Fog":
            emoji = "🌁"
        case "Partly Sunny" | "Mostly Clear":
            emoji = "🌤️"
        case "Intermittent Very Light Rain" | "Chance Light Rain" | "Slight Chance Light Rain" | "Rain Showers Likely" | "Slight Chance Rain Showers" | "Slight Chance Showers And Thunderstorms":
            emoji = "🌦️"
        case "Isolated Rain Showers" | "Rain" | "Chance Rain Showers" | "Rain Showers":
            emoji = "🌧️"
        case "Showers And Thunderstorms" | "Thunderstorms":
            emoji = "⛈️ "
        case "Patchy Frost":
            emoji = "🌨️ "

        case _:
            emoji = "😎"
    return emoji


temp = forecast["properties"]["periods"][0]["temperature"]
short = forecast["properties"]["periods"][0]["shortForecast"]
emoji = get_emoji(short)
print(f"{emoji} {temp}°F")
