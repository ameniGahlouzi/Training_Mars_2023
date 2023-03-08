from selenium.webdriver import Chrome
import time
from selenium.webdriver.common.by import By

# set up the browser driver
driver = Chrome()

# navigate to the web page
driver.get("https://google.com/")

# find the search box and enter a search term
search_box = driver.find_element("name", "q")
search_box.send_keys("how to install python on macos")

# submit the search query
search_box.submit()

time.sleep(3)

# find the first div element on the page
parent_element = driver.find_element(By.CLASS_NAME, 'MjjYud')

# find the first link (a tag) within the parent element
link = parent_element.find_element(By.TAG_NAME,"a")

# click on the link
link.click()
time.sleep(3)

# find the site title on the page
site_title = driver.find_element(By.CLASS_NAME, 'site-title')

assert "Ways to Install Python on MacOS" in driver.title

try:
    assert "Ways to Install Python on MacOS cc" in driver.title
    # if the assertion passes, Load a page success
    driver.get('https://c7.alamy.com/compfr/gpx6wk/caractere-signification-reussite-succes-triomphal-et-le-rendu-3d-gpx6wk.jpg')

except AssertionError:
    # if the assertion fails, Load a page failure
    driver.get('https://media.istockphoto.com/id/951985126/vector/fail-ink-stamp.jpg?s=612x612&w=0&k=20&c=YIHZIUaRLJqNArnsvWWIswGIn3Q5y7FWxUsNQs-rzrQ=')

time.sleep(3)

# close the browser
driver.quit()



 








 






 
