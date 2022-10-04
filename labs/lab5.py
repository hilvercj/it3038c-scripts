from datetime import datetime

print("What year were you born?")
year = int(input())

print("What numerical month were you born in?")
month = int(input())

print("Which day were you born on?")
day = int(input())

ageInSeconds = (datetime.now() - datetime(year=year, month=month, day=day)).total_seconds()

print("You are currently " + str(ageInSeconds) + " seconds old.")
