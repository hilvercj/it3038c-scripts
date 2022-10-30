import requests, re
from bs4 import BeautifulSoup


url = "https://en.wikipedia.org/wiki/Portal:Current_events"

r = requests.get(url)
soup = BeautifulSoup(r.text, 'html.parser')
span = soup.find("div", {"class":"current-events-content description"})
print(span)
