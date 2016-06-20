*** Settings ***
Documentation    Suite description
Library           Selenium2Library

*** Variables ***
${URL}   http://m2-www.mywfg.com

*** Test Cases ***
Open URL in Google Chrome
#	[Arguments]  ${url}
    [Documentation]  Starts the Google Chrome browser.
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --lang\=de
    Create WebDriver  Chrome  chrome_options=${options}
    Go To  ${URL}



*** Keywords ***
