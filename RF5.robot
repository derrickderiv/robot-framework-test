*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Keywords ***
Verify Loading
    Wait Until Page Does Not Contain Element    //*[contains(@aria-label,"Loading")]    30
	Wait Until Page Does Not Contain Element    //*[contains(@class,'chart-container__loader')]    30

*** Test Cases ***
Task 5
    Open Browser    https://app.deriv.com/    chrome
    Maximize Browser Window
    


