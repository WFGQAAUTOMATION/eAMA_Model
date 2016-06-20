from selenium                           import webdriver
from selenium.webdriver.support.ui      import WebDriverWait
from selenium.webdriver.common.by       import By
from selenium.webdriver.support.select  import Select
import unittest
import FakerLibrary
import Collections
import String
import time
import Selenium2Library
import OperatingSystem


def setUp(self):
    global driver
    driver = webdriver.Firefox()
    driver.get("http://www.w3schools.com/js/tryit.asp?filename=tryjs_confirm")
    driver.maximize_window()

