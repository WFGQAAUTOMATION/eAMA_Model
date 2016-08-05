*** Settings ***
Documentation     A test for the eAMA Landing Page.
...
Metadata          Version   0.1
Resource          ../Resources/Resource_Webpage.robot
Library           FakerLibrary
Library           Collections
Library           String
Library           re
#Suite Teardown    Close Browser

*** Variables ***
#${var}    document.getElementsByClassName('btn btn-lg btn-main item-alt-inline-block')

*** Test Cases ***
Open eAMA and Choose Country
    Given Browser is Open to eAMA
Maximize
    Then Maximize Browser Window
    Then I Choose Country Named ${CountryName}

Enter SSN or SIN
	${fakeSSN}=         FakerLibrary.SSN
	Then Wait "2" Seconds
	Then Input "${fakeSSN}" in the Field With ID "SSNConfirm"
	Then Wait "2" Seconds
	And Type "${fakeSSN}" in the Field With ID "SSN"

Enter Birthdate
	${BirthMonth}=      FakerLibrary.Month Name
	${BirthYear}=       Evaluate     random.randint(1901, 1995)    random  #random.sample(range(1901, 1998), 1)    random
	${BirthYear}=       convert to string  ${BirthYear}
	And Click List Box With ID "DOBMonth" and select "${BirthMonth}"
	And Click List Box With ID "DOBDay" and select "1"
	And Click List Box With ID "DOBYear" and select "${BirthYear}"

Click Next
	Then Click Button with ID = "Next"
	Then Wait "3" Seconds
	Then click button   xpath=//*[@id='nextDialog']/div/div/div[3]/button[1]
#	And Click Button named "OK"

Enter Recruiter ID
	Then Verify An Element Named "Recruiter Information:" Is On The Page
	Then Type "${RecruiterID}" in the Field With ID "RecruiterID"
	Then Click Button named "Verify"
	Then click element with id = "Next"

Click Next on Welcome Page
	Then Verify An Element Named "Welcome!" Is On The Page
	Then Wait "5" Seconds
	Then click element with id = "Next"

Click Next on Become a WFG Associate Page
	Then Verify An Element Named "Become a WFG Associate:" Is On The Page
	Then Wait "5" Seconds
	Then click element with id = "Next"

Fill Out Personal Info
	${firstname}=       FakerLibrary.First Name
	${lastname}=        FakerLibrary.First Name
	${streetaddress}=   FakerLibrary.Street Address
	${city}=            FakerLibrary.City
	${state}=           FakerLibrary.State
	${state}=           convert to uppercase  ${state}
	${zip}=             FakerLibrary.ZipCode
	${phonenumber}=     FakerLibrary.Phone Number
	${email}=           FakerLibrary.Email
	Then wait "3" seconds
	And Verify An Element Named "Personal Information:" Is On The Page
	Then Type "${firstname}" in the Field With ID "FirstName"
	And Type "${lastname}" in the Field With ID "LastName"
	Then Type "${streetaddress}" in the Field With ID "Address"
	Then Type "${city}" in the Field With ID "City"
	And Click List Box With ID "State" and select "${state}"
	Then Type "${zip}" in the Field With ID "Zip"
	And Type "${phonenumber}" in the Field With ID "HomePhoneNumber"
	Then Type "${email}" in the Field With ID "Email"
	And Click Button with ID = "Next"

Answer Background Questions Positively
	And Wait "5" Seconds
	And Verify An Element Named "Background Questions" Is On The Page
	Then Click Button with ID = "NrbnAnswer1"
	Then Click Button with ID = "NrbnAnswer2"
	Then Click Button with ID = "NrbnAnswer3"
	And Scroll Page to Location Where Y equals "600"
	Then Click Button with ID = "NrbnAnswer4"
	And Scroll Page to Location Where Y equals "600"
	Then Click Button with ID = "NrbnAnswer5"
	Then Click Button with ID = "NrbnAnswer6"
	Then Click Button with ID = "NrbnAnswer7"
	And Scroll Page to Location Where Y equals "1000"
	Then Click Button with ID = "NrbnAnswer8"
	Then Click Button with ID = "NrbnAnswer9"
	Then Click Button with ID = "NrbnAnswer10"
	And Scroll Page to Location Where Y equals "1500"
	Then Click Button with ID = "NrbnAnswer11"
	Then Click Button with ID = "YrbnAnswer12"
	And Scroll Page to Location Where Y equals "100"
	And Click Button with ID = "Next"

Associate Membership Agreement
	Then Wait "40" Seconds
Switch to Checkbox Frame
	And Switch to Frame Named "DSiframe"
Select Checkbox
	Then Select Checkbox Where ID is "disclosureAccepted"
Click Continue
	And Click Button with ID = "action-bar-btn-continue"
Click Start
#	Then Click Button with ID = "ds_hldrBdy_navnexttext_btnInline"
	Then Click Button using id "navigate-btn"
Switch to Signing Frame
	Then Switch to Frame Named "signingIframe"
Enter Common Name
	${CommonName}=  FakerLibrary.First Name
	Then Type "${CommonName}" in the Field Titled "Enter Common Name"
Click Next 1
	Wait "1" Seconds
	And Click Button named "Next"
Enter Spouse First Name
	Wait "1" Seconds
	${SpouseName}=  FakerLibrary.First Name Female
	Then Type "${SpouseName}" in the Field Titled "Enter Spouse First Name"
Click Next 2
	Wait "1" Seconds
	And Click Button named "Next"
Enter Spouse Last Name
	Wait "1" Seconds
	${LastName}=    FakerLibrary.Last Name
	Then Type "${LastName}" in the Field Titled "Enter Spouse Last Name"
Click Next 3
	Wait "1" Seconds
	And Click Button named "Next"
Click Fill In 1
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 2
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 3
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 4
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 5
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 6
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Choose 1
	Wait "1" Seconds
	Then Click Button named "Choose"
Click Fill In 7
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Sign Here 1
	Then Click Label with Title = "Sign Here"
Click Adopt and Sign
	Wait "2" Seconds
	Then Unselect Frame
	And Switch to Frame Named "DSiframe"
	Then Click Button named "Adopt and Sign"
Click Initial Here 1
	Wait "2" Seconds
	select frame    xpath=//iframe
	Wait "1" Seconds
	click element  xpath=//div[2]/div[14]/input
Click Initial Here 2
	Wait "1" Seconds
	click element  xpath=//div[14]/input[2]
Click Initial Here 3
	Wait "1" Seconds
	click element  xpath=//div[14]/input[3]
Click Initial Here 4
	Wait "1" Seconds
	click element  xpath=//div[14]/input[4]
Click Initial Here 5
	Wait "1" Seconds
	click element  xpath=//div[14]/input[5]
Click Initial Here 6
	Wait "1" Seconds
	click element  xpath=//div[14]/input[6]
Click Initial Here 7
	Wait "1" Seconds
	click element  xpath=//div[14]/input[7]
Click Initial Here 8
	Wait "1" Seconds
	click element  xpath=//div[14]/input[8]
Click Sign Here 2
	Wait "1" Seconds
	Then Click Element  xpath=//input[@src="Images/tabs/signhereactive150.png"]
Click Fill In 8
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 9
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Fill In 10
	Wait "1" Seconds
	Then Click Button named "Fill In"
Click Sign Here 3
	Wait "2" Seconds
	Then Click Element  xpath=//input[@src="Images/tabs/signhereactive150.png"]
Select Dedicaed Checkbox
	Wait "2" Seconds
	And Select Checkbox     xpath=//input[@title='Dedicated (1)']
Click Initial Here 9
	Wait "2" Seconds
	Then click element  xpath=//div[34]/input[1]
Click Choose
	Wait "2" Seconds
	And Click Button named "Choose"
Click Sign Here 4
	Wait "2" Seconds
	Then Click Element  xpath=//*[@pagenum="16"]//input[@src="Images/tabs/signhereactive150.png"]
Click Finish
	Wait "2" Seconds
	Then Unselect Frame
	And select frame    xpath=//iframe
	Then Click Button using id "action-bar-bottom-btn-finish"
Click Pay Now
	Wait "8" Seconds
	Then Unselect Frame
	And select window  title=WFG - AMA
	And Click Element with ID = "Next"
Enter Payment Info
	Wait "10" Seconds
	${firstname}=       FakerLibrary.First Name
	${lastname}=        FakerLibrary.First Name
	${streetaddress}=   FakerLibrary.Street Address
	${city}=            FakerLibrary.City
	${state}=           FakerLibrary.State
	${zip}=             FakerLibrary.ZipCode
	${phonenumber}=     FakerLibrary.Phone Number
	And Type "4024007197007098" in the Field With ID "cc_number"
	Then Type "01" in the Field With ID "expdate_month"
	And Type "18" in the Field With ID "expdate_year"
	Then Type "${firstname}" in the Field With ID "first_name"
	Then Type "${lastname}" in the Field With ID "last_name"
	Then Type "${streetaddress}" in the Field With ID "billingAddress1"
	Then Type "${city}" in the Field With ID "billingCity"
	And Click List Box With ID "billingState" and select "${state}"
	Then Type "${zip}" in the Field With ID "billingZip"
	And Type "${phonenumber}" in the Field With ID "phone_number"
	Then Click Element with ID = "btn_pay_cc"
Get Reference Number
	Wait "6" Seconds
	get value  xpath=//*[@id='contPaymentOptionsContent']/p[1]/span
Click To Complete Transaction
	Wait "6" Seconds
	click element  xpath=//*[@onclick="Post()"]
Get New Associate Number
	Wait "10" Seconds
	${welcome}=     get text  xpath=//div[@id='divHeader']//*[@id='divWelcome']
	log      ${welcome}

*** Keywords ***
