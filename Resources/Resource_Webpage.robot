*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           OperatingSystem
Library           ../Resources/Various_Methods.py

*** Variables ***


*** Keywords ***
#*****************************************************
######   NAVIGATION  ######
#*****************************************************

Type "${Text}" in the Field With ID "${Fieldname}"
	input text      xpath=//*[@id='${FieldName}']   ${Text}

#*****************************************************

Type "${text}" in the Field Titled "${fieldname}"
	input text      xpath=//*[@title='${fieldname}']   ${text}

#*****************************************************

Browser is Open to eAMA
	Open Browser    ${LOGIN_URL}   ${Browser}  ff_profile_dir=${FF_PROFILE}

#*****************************************************

Click Menu Item "${menuitem}"
    Click Link    //a[contains(text(),'${menuitem}')]

#*****************************************************

Navigate to webpage
    click link  ${LinkName}

#*****************************************************

Hover Over "${hoverover}"
    mouse over       xpath=//a[(text()='${hoverover}')]

#*****************************************************

I Choose Country Named ${CountryName}
    click element    xpath=//*[(text()='${CountryName}')]

#*****************************************************

Wait "${seconds}" Seconds
    sleep  ${seconds}

#*****************************************************

Scroll Page to Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})
	get window size
#*********************************************************************

Scroll Page to Location Where Y equals "${y_location}"
    Execute JavaScript    window.scrollTo(0,${y_location})

#*********************************************************************

Click OK Button On Java Dialog
    Execute JavaScript    window.close()
#    driver.findelement(By.xpath("//span[@class="ui-button-text"][contains(text(),'Ok')]")).click();

#*****************************************************
######   INTERACT ELEMENTS    ######
#*****************************************************

Click Object Named "${clickelement}"
    click element    xpath=//*[(text()='${clickelement}')]

#*****************************************************

Click Element with ID = "${elementID}" and Index = "${index}"
	click element  xpath=(//*[@id='${elementID}'])[${index}]

#*****************************************************

Click Element with ID = "${elementID}"
	click element  xpath=//input[@id='${elementID}']

#*****************************************************

Click Button with ID = "${elementID}"
	click element  xpath=//*[@id='${elementID}']

#*****************************************************

Click Button named "${buttonname}"
    click button    xpath=//button[contains(text(),'${buttonname}')]

#*****************************************************

Click Button using style "${buttonstyle}"
    click button    xpath=//button[@style='${buttonstyle}']

#*****************************************************

Click Button using id "${buttonid}"
    click button    xpath=//button[@id='${buttonid}']

#*****************************************************

Click Button with the Value of "${buttonValue}"
	click button    xpath=//button[@value='${buttonValue}']

#*****************************************************

Click Link Named "${clicklick}"
    click link    xpath=//a[(text()='${clicklick}')]

#*****************************************************

Click Link With Name Contained "${clicklink}"
    click link    xpath=//a[contains(text(),'${clicklink}')]

#***************************************************************

Input "${Text}" in The "${FieldName}" Field
    input text  xpath=//input[@name='${FieldName}']   ${Text}

#***************************************************************

Input "${Text}" in the Field With ID "${Fieldname}"
    input text  xpath=//input[@id='${FieldName}']   ${Text}

#************************************************************************

Select Checkbox Where ID is "${cbName}"
    select checkbox     xpath=//*[@id='${cbName}']

#************************************************************************

Select Frame Where ID is "${frameID}"
    log  ${frameID}
    select frame    xpath=//iframe[@id='${frameID}']

#************************************************************************

Click List Box Named "${SelectItem}" and select "${Item}"
    Select From List     xpath=//select[@name='${SelectItem}']  ${Item}

#*************************************************************************

Click List Box With ID "${ItemID}" and select "${Item}"
    Select From List     xpath=//select[@id='${ItemID}']  ${Item}

#*************************************************************************

Click List Box With ID "${ItemID}" and select by index "${Index}"
    Select From List By Index    xpath=//select[@id='${ItemID}']  ${Index}

#*************************************************************************
Click image where ID is "${ImageID}"
    click image     xpath=//input[@id='${ImageID}']

#**************************************************************************

Click image named "${Image}"
    click image     xpath=//input[@name='${Image}']

#*****************************************************

Click image using img where ID is "${ImageID}"
    click image     xpath=//img[@id='${ImageID}']

#*****************************************************

Click Ok on Alert
    confirm action

#*****************************************************

Click Cancel on Alert
     Choose Cancel On Next Confirmation
     sleep      3
     confirm action

#*****************************************************

Switch to Frame Named "${framename}"
#	frame switch  ${framename}
	select frame  ${framename}

#*****************************************************

Select Checkbox using ID is "${cbName}" using Javascript
	chkCheckbox =   document.getElementsByName(${cbName})
	execute javascript   d.checked = "checked"



Click Label with Title = "${labeltitle}"
	Click Element   xpath=//input[@title='${labeltitle}']

#*****************************************************
######   FIND/VERIFY ELEMENTS      ######
#*****************************************************

Verify A Link Named "${linkname}" Is On The Page
    wait until page contains element    xpath=//a[contains(text(),'${linkname}')]   30s

#*****************************************************

Verify An Element Named "${elemName}" Is On The Page
    wait until page contains element    xpath=//*[contains(text(),'${elemName}')]   150s

#*****************************************************

Find "${textonpage}" On Webpage
    page should contain    ${textonpage}

#*****************************************************

Find "${AgentID}" in the Results List
    element should be visible    xpath=//a[@href="javascript:showAgentReports('${AgentID}')"]

#*****************************************************

Verify Title on the page "${titlename}"
    Title Should Be     ${titlename}

#*****************************************************

Find text on the page
    Page Should Contain Element    xpath=//
                                   .//*[@id='DueDate-10379399']
#*********************************************************************************
Elements should be equal ${SQL_Text} ${Webpage_Text}
    Should be equal    ${SQL_Text}    ${Webpage_Text}

#*********************************************************************************

Zoom out to "${zoomLevel}" (percentage)
	Execute javascript  document.body.style.zoom="${zoomLevel}"
	get window identifiers
