import requests, json, ctypes

#This url links to an open source weather api. In this code it is part of a long string that is needed to request information from the website.
Base_URL = 'https://api.openweathermap.org/data/2.5/weather?'

#The user will any city.
City = input("Enter city name: ")

#The api key that is used is rather to long to write, so it is placed in its own variable to avoid typing mistakes.
API_Key = "f37a315e5c6a79ec2c03b264b178815b"

#The long URL is condensed into a variable to make it easier to type and read.
URL = Base_URL + "appid=" + API_Key + "&q=" + City

#These two lines gets the information from the website and converts the infromation from json to readable python code.
response = requests.get(URL)
data = response.json()

#This line is used to check the see if the city inputed exists. If the "cod" is 404, then the city is not found, similar to a website.
if data["cod"] != "404":

    new_data = data['main']
    temperature = new_data['temp']
    #The temperature returns in kelvin. I used math to convert kelvin into fahrenheit, and then rounded the number into a much nicer looking number.
    fahrenheit = (temperature - 273.15) * 1.8 + 32
    Rfahrenheit = round(fahrenheit)
    #I also applied the conversion and rounding to celcius.
    celcius = (temperature - 273.15)
    Rcelcius = round(celcius)

    #This module creates an easier way to create and input information into a popup message.
    def Message(title, text, style):
        return ctypes.windll.user32.MessageBoxW(0, text, title, style)

    #This rather long line shows a popup message with all the information about which city the user entered, and temperatures in three separate measurements.
    Message('Your Temperature Report for ' + City, 'The Temperature in fahrenheit is ' + str(Rfahrenheit) + ' degrees.' '\nThe Temperature in celcius is ' + str(Rcelcius) + ' degrees.' '\nThe Temperature in kelvin is ' + str(temperature) + ' degrees.', 1)

#This piece of code is to catch most, if not all errors the user may cause when inputting a name of a city.
else :
    print("City Not Found")

#Citation:
#Title: Find current weather of any city using OpenWeatherMap API in Python
#Author: N/A
#Date: September 6th, 2022
#Code: Python3
#Website: geeksforgeeks.org/python-find-current-weather-of-any-city-using-openweathermap-api/ 