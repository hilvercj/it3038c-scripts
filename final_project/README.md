#Final Project
##Weather/Temperature Script in Python, hilvercj

###Documentation
The goal of this script is to show small amount of information about the weather, in a very quick and easy to do way. The code itself revolves around 
the API from OpenWeatherAPI. In the script, a user inputs the city which they live in, or any city for that matter, and will receive a small popup window display the
temperature of the city they inputed in three separate measurements. The script sends requests for information, which are then converted from JSON into python.
The script then checks if the requests were able to receive the information about the city, and then converts the data into readable information. If the city is not
found, or if a city was not enter at all, the script will give an error message.

###How to start
First make sure python is installed, preferably python3
Open up Powershell and navigate to the directory with the file "weather.py"
Type "python weather.py" and run the script
Finally, enjoy the temperature report for the city you inputed

###Use Case
This script can be an easy introduction to API's as well as other parts of python, such as popup messages. Also, the script provides an easy way to see the temperature
in any city in fahrenheit, as well as celcius and even kelvin.

###Sources
https://www.geeksforgeeks.org/python-find-current-weather-of-any-city-using-openweathermap-api/
